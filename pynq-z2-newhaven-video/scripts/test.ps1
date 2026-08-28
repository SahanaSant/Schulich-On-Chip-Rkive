$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
Push-Location $projectRoot
try {
    $iverilog = if (Get-Command iverilog -ErrorAction SilentlyContinue) {
        (Get-Command iverilog).Source
    } else {
        'C:\iverilog\bin\iverilog.exe'
    }
    $vvp = if (Get-Command vvp -ErrorAction SilentlyContinue) {
        (Get-Command vvp).Source
    } else {
        'C:\iverilog\bin\vvp.exe'
    }

    $rtlTests = @(
        @('tb_axi_framebuffer.vvp',
          'rtl\framebuffer.sv',
          'rtl\axi_lite_framebuffer_writer.sv',
          'tb\tb_axi_lite_framebuffer_writer.sv'),
        @('tb_spi_byte.vvp',
          'rtl\spi_byte_master.sv',
          'tb\tb_spi_byte_master.sv'),
        @('tb_axi_spi.vvp',
          'rtl\spi_byte_master.sv',
          'rtl\axi_lite_spi_master.sv',
          'tb\tb_axi_lite_spi_master.sv'),
        @('tb_lcd_3wire.vvp',
          'rtl\lcd_3wire_spi.sv',
          'tb\tb_lcd_3wire_spi.sv'),
        @('tb_display_controller.vvp',
          'rtl\lcd_3wire_spi.sv',
          'rtl\display_controller.sv',
          'tb\tb_display_controller.sv'),
        @('tb_axi_display_control.vvp',
          'rtl\axi_lite_display_control.sv',
          'tb\tb_axi_lite_display_control.sv')
    )

    foreach ($test in $rtlTests) {
        $output = Join-Path $env:TEMP $test[0]
        & $iverilog -g2012 -Wall -o $output $test[1..($test.Count - 1)]
        if ($LASTEXITCODE -ne 0) { throw "Icarus compilation failed" }
        & $vvp $output
        if ($LASTEXITCODE -ne 0) { throw "RTL simulation failed" }
    }

    $mbGcc = 'C:\AMDDesignTools\2026.1\gnu\microblaze\nt\bin\mb-gcc.exe'
    if (Test-Path $mbGcc) {
        $sources = (Get-ChildItem firmware\src\*.c).FullName
        $fatFs = (Resolve-Path firmware\third_party\fatfs\ff.c).Path
        & $mbGcc -std=c11 -Wall -Wextra -Werror -ffreestanding `
            -Ifirmware\include -Ifirmware\third_party\fatfs `
            -Ifirmware\host_tests\fatfs_stub `
            -fsyntax-only @sources $fatFs
        if ($LASTEXITCODE -ne 0) { throw "MicroBlaze C check failed" }
        Write-Host 'PASS: MicroBlaze C syntax and warnings'
    } else {
        Write-Warning 'MicroBlaze compiler not found; skipped target C check.'
    }

    $root = (Resolve-Path .).Path
    $linuxRoot = '/mnt/' + $root.Substring(0, 1).ToLower() + `
                 $root.Substring(2).Replace('\', '/')
    $hostCommand = "cd '$linuxRoot' && " +
        'gcc -std=c11 -Wall -Wextra -Werror ' +
        '-Ifirmware/include -Ifirmware/host_tests/fatfs_stub ' +
        'firmware/host_tests/test_firmware.c ' +
        'firmware/src/framebuffer.c firmware/src/video_stream.c ' +
        'firmware/src/sd_spi.c firmware/src/spi_mmio.c ' +
        'firmware/src/fatfs_diskio.c firmware/src/display_mmio.c ' +
        '-o /tmp/pynq_video_firmware_tests && ' +
        '/tmp/pynq_video_firmware_tests'
    & wsl.exe bash -lc $hostCommand
    if ($LASTEXITCODE -ne 0) { throw "Firmware host test failed" }

    & python -m unittest discover -s tests -v
    if ($LASTEXITCODE -ne 0) { throw "Python video pipeline tests failed" }
} finally {
    Pop-Location
}
