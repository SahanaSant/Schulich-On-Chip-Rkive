#!/usr/bin/env bash
set -euo pipefail
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"
build_root="${EXT_BUILD_ROOT:-/tmp/udma_ext_verified}"
core="local:schulich:udma_external_per:0.1.0"
fusesoc --config "$root/fusesoc.external_per.conf" --cores-root "$root" run \
  --target=lint --build-root "$build_root/lint" "$core"
fusesoc --config "$root/fusesoc.external_per.conf" --cores-root "$root" run \
  --target=sim --build-root "$build_root/sim" "$core"
binary="$build_root/sim/local_schulich_udma_external_per_0.1.0/sim-verilator/Vudma_external_per_top_tb"
"$binary" +sys_half=31 +periph_half=25
"$binary" +sys_half=25 +periph_half=25
