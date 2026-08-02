module udma_uart_rx (busy_o,
    cfg_en_i,
    cfg_parity_en_i,
    cfg_stop_bits_i,
    char_event_o,
    clk_i,
    err_overflow_o,
    err_parity_o,
    rstn_i,
    rx_i,
    rx_ready_i,
    rx_valid_o,
    cfg_bits_i,
    cfg_div_i,
    rx_data_o,
    VDD,
    VSS);
 output busy_o;
 input cfg_en_i;
 input cfg_parity_en_i;
 input cfg_stop_bits_i;
 output char_event_o;
 input clk_i;
 output err_overflow_o;
 output err_parity_o;
 input rstn_i;
 input rx_i;
 input rx_ready_i;
 output rx_valid_o;
 input [1:0] cfg_bits_i;
 input [15:0] cfg_div_i;
 output [7:0] rx_data_o;
 inout VDD;
 inout VSS;

 wire \CS[0] ;
 wire \CS[1] ;
 wire \CS[2] ;
 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire \baud_cnt[0] ;
 wire \baud_cnt[10] ;
 wire \baud_cnt[11] ;
 wire \baud_cnt[12] ;
 wire \baud_cnt[13] ;
 wire \baud_cnt[14] ;
 wire \baud_cnt[15] ;
 wire \baud_cnt[1] ;
 wire \baud_cnt[2] ;
 wire \baud_cnt[3] ;
 wire \baud_cnt[4] ;
 wire \baud_cnt[5] ;
 wire \baud_cnt[6] ;
 wire \baud_cnt[7] ;
 wire \baud_cnt[8] ;
 wire \baud_cnt[9] ;
 wire bit_done;
 wire parity_bit;
 wire r_error_parity;
 wire reg_bit_count;
 wire \reg_rx_sync[0] ;
 wire \reg_rx_sync[1] ;
 wire \reg_rx_sync[2] ;

 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Left_36 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Right_0 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Left_46 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Right_10 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Left_47 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Right_11 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Left_48 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Right_12 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Left_49 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Right_13 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Left_50 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Right_14 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Left_51 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Right_15 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Left_52 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Right_16 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_17_Left_53 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_17_Right_17 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_18_Left_54 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_18_Right_18 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_19_Left_55 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_19_Right_19 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Left_37 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Right_1 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_20_Left_56 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_20_Right_20 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_21_Left_57 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_21_Right_21 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_22_Left_58 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_22_Right_22 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_23_Left_59 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_23_Right_23 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_24_Left_60 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_24_Right_24 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_25_Left_61 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_25_Right_25 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_26_Left_62 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_26_Right_26 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_27_Left_63 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_27_Right_27 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_28_Left_64 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_28_Right_28 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_29_Left_65 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_29_Right_29 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Left_38 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Right_2 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_30_Left_66 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_30_Right_30 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_31_Left_67 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_31_Right_31 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_32_Left_68 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_32_Right_32 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_33_Left_69 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_33_Right_33 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_34_Left_70 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_34_Right_34 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_35_Left_71 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_35_Right_35 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Left_39 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Right_3 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Left_40 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Right_4 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Left_41 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Right_5 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Left_42 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Right_6 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Left_43 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Right_7 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Left_44 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Right_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Left_45 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Right_9 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_72 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_73 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_74 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_75 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_76 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_77 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_78 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_110 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_111 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_112 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_113 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_114 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_115 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_116 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_117 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_118 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_119 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_120 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_121 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_122 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_123 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_124 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_125 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_126 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_127 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_128 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_129 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_130 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_131 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_132 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_133 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_134 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_135 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_136 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_137 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_138 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_139 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_140 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_141 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_142 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_143 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_144 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_79 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_80 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_81 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_145 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_146 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_147 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_148 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_149 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_150 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_151 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_152 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_153 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_154 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_155 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_156 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_157 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_158 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_159 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_160 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_161 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_162 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_163 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_164 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_165 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_166 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_167 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_168 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_169 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_170 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_171 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_172 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_173 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_174 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_175 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_176 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_177 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_178 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_179 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_82 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_83 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_84 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_85 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_180 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_181 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_182 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_183 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_184 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_185 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_186 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_187 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_188 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_189 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_190 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_33_191 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_33_192 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_33_193 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_34_194 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_34_195 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_34_196 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_34_197 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_35_198 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_35_199 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_35_200 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_35_201 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_35_202 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_35_203 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_35_204 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_86 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_87 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_88 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_89 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_90 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_91 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_92 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_93 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_94 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_95 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_96 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_97 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_98 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_99 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_100 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_101 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_102 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_103 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_104 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_105 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_106 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_107 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_108 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_109 ();
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _180_ (.I(\CS[1] ),
    .ZN(_038_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _181_ (.I(\CS[2] ),
    .ZN(_039_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _182_ (.I(\reg_rx_sync[2] ),
    .ZN(_040_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _183_ (.I(\reg_rx_sync[1] ),
    .ZN(_041_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _184_ (.I(cfg_div_i[2]),
    .ZN(_042_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _185_ (.I(\baud_cnt[1] ),
    .ZN(_043_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _186_ (.I(\baud_cnt[3] ),
    .ZN(_044_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _187_ (.I(\baud_cnt[4] ),
    .ZN(_045_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _188_ (.I(cfg_div_i[6]),
    .ZN(_046_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _189_ (.I(cfg_div_i[8]),
    .ZN(_047_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _190_ (.I(\baud_cnt[7] ),
    .ZN(_048_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _191_ (.I(cfg_div_i[9]),
    .ZN(_049_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _192_ (.I(\baud_cnt[8] ),
    .ZN(_050_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _193_ (.I(cfg_div_i[10]),
    .ZN(_051_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _194_ (.I(\baud_cnt[9] ),
    .ZN(_052_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _195_ (.I(cfg_div_i[12]),
    .ZN(_053_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _196_ (.I(r_error_parity),
    .ZN(_054_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _197_ (.I(cfg_en_i),
    .ZN(_055_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _198_ (.I(_021_),
    .ZN(_056_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _199_ (.I(cfg_parity_en_i),
    .ZN(_057_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _200_ (.I(rx_data_o[7]),
    .ZN(_058_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _201_ (.A1(\CS[1] ),
    .A2(\CS[0] ),
    .ZN(_059_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _202_ (.A1(_039_),
    .A2(_059_),
    .ZN(busy_o));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _203_ (.A1(\baud_cnt[0] ),
    .A2(cfg_div_i[0]),
    .Z(_060_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _204_ (.A1(cfg_div_i[5]),
    .A2(\baud_cnt[5] ),
    .Z(_061_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _205_ (.A1(cfg_div_i[4]),
    .A2(_045_),
    .Z(_062_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _206_ (.A1(cfg_div_i[2]),
    .A2(\baud_cnt[2] ),
    .Z(_063_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _207_ (.A1(_040_),
    .A2(\reg_rx_sync[1] ),
    .ZN(_064_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _208_ (.A1(_039_),
    .A2(\reg_rx_sync[2] ),
    .A3(_041_),
    .A4(_059_),
    .ZN(_065_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _209_ (.A1(\CS[0] ),
    .A2(_039_),
    .ZN(_066_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _210_ (.A1(\CS[1] ),
    .A2(_066_),
    .B(_065_),
    .ZN(_067_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _211_ (.A1(cfg_div_i[13]),
    .A2(\baud_cnt[13] ),
    .Z(_068_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _212_ (.A1(_049_),
    .A2(\baud_cnt[9] ),
    .Z(_069_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _213_ (.A1(cfg_div_i[6]),
    .A2(\baud_cnt[6] ),
    .Z(_070_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _214_ (.A1(cfg_div_i[3]),
    .A2(\baud_cnt[3] ),
    .Z(_071_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _215_ (.A1(cfg_div_i[12]),
    .A2(\baud_cnt[12] ),
    .Z(_072_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _216_ (.A1(cfg_div_i[10]),
    .A2(\baud_cnt[10] ),
    .Z(_073_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _217_ (.A1(cfg_div_i[14]),
    .A2(\baud_cnt[14] ),
    .Z(_074_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _218_ (.A1(cfg_div_i[1]),
    .A2(\baud_cnt[1] ),
    .Z(_075_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _219_ (.A1(_060_),
    .A2(_063_),
    .A3(_074_),
    .A4(_075_),
    .ZN(_076_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _220_ (.A1(cfg_div_i[8]),
    .A2(\baud_cnt[8] ),
    .Z(_077_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _221_ (.A1(cfg_div_i[11]),
    .A2(\baud_cnt[11] ),
    .Z(_078_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _222_ (.A1(_061_),
    .A2(_071_),
    .A3(_077_),
    .A4(_078_),
    .ZN(_079_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _223_ (.A1(_076_),
    .A2(_079_),
    .ZN(_080_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _224_ (.A1(_068_),
    .A2(_070_),
    .A3(_072_),
    .A4(_073_),
    .ZN(_081_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _225_ (.A1(cfg_div_i[15]),
    .A2(\baud_cnt[15] ),
    .ZN(_082_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _226_ (.A1(_062_),
    .A2(_081_),
    .A3(_082_),
    .ZN(_083_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _227_ (.A1(cfg_div_i[7]),
    .A2(_048_),
    .Z(_084_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _228_ (.A1(_069_),
    .A2(_084_),
    .ZN(_085_));
 gf180mcu_fd_sc_mcu7t5v0__or4_1 _229_ (.A1(_067_),
    .A2(_080_),
    .A3(_083_),
    .A4(_085_),
    .Z(_086_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _230_ (.A1(cfg_div_i[3]),
    .A2(\baud_cnt[2] ),
    .ZN(_087_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _231_ (.A1(cfg_div_i[11]),
    .A2(\baud_cnt[10] ),
    .Z(_088_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _232_ (.A1(_042_),
    .A2(\baud_cnt[1] ),
    .B1(_046_),
    .B2(\baud_cnt[5] ),
    .ZN(_089_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _233_ (.A1(cfg_div_i[13]),
    .A2(\baud_cnt[12] ),
    .Z(_090_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _234_ (.A1(cfg_div_i[1]),
    .A2(\baud_cnt[0] ),
    .Z(_091_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _235_ (.A1(cfg_div_i[15]),
    .A2(\baud_cnt[14] ),
    .Z(_092_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _236_ (.A1(cfg_div_i[9]),
    .A2(_050_),
    .B1(_051_),
    .B2(\baud_cnt[9] ),
    .ZN(_093_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _237_ (.A1(cfg_div_i[7]),
    .A2(\baud_cnt[6] ),
    .Z(_094_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _238_ (.A1(_053_),
    .A2(\baud_cnt[11] ),
    .B(\baud_cnt[15] ),
    .ZN(_095_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _239_ (.A1(cfg_div_i[14]),
    .A2(\baud_cnt[13] ),
    .Z(_096_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _240_ (.A1(cfg_div_i[2]),
    .A2(_043_),
    .B1(cfg_div_i[10]),
    .B2(_052_),
    .ZN(_097_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _241_ (.A1(_047_),
    .A2(\baud_cnt[7] ),
    .B1(_049_),
    .B2(\baud_cnt[8] ),
    .C(_096_),
    .ZN(_098_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _242_ (.A1(_088_),
    .A2(_091_),
    .A3(_092_),
    .A4(_094_),
    .ZN(_099_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _243_ (.A1(_095_),
    .A2(_097_),
    .A3(_098_),
    .A4(_099_),
    .Z(_100_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _244_ (.A1(cfg_div_i[4]),
    .A2(_044_),
    .B1(cfg_div_i[5]),
    .B2(_045_),
    .ZN(_101_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _245_ (.A1(_087_),
    .A2(_089_),
    .A3(_093_),
    .A4(_101_),
    .Z(_102_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _246_ (.A1(cfg_div_i[4]),
    .A2(_044_),
    .B1(_047_),
    .B2(\baud_cnt[7] ),
    .ZN(_103_));
 gf180mcu_fd_sc_mcu7t5v0__oai222_1 _247_ (.A1(cfg_div_i[5]),
    .A2(_045_),
    .B1(_046_),
    .B2(\baud_cnt[5] ),
    .C1(_053_),
    .C2(\baud_cnt[11] ),
    .ZN(_104_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _248_ (.A1(_090_),
    .A2(_103_),
    .A3(_104_),
    .ZN(_105_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _249_ (.A1(_067_),
    .A2(_100_),
    .A3(_102_),
    .A4(_105_),
    .ZN(_106_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _250_ (.A1(_086_),
    .A2(_106_),
    .Z(_107_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _251_ (.A1(\CS[2] ),
    .A2(_059_),
    .Z(_108_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _252_ (.A1(_065_),
    .A2(_108_),
    .ZN(_109_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _253_ (.A1(_065_),
    .A2(_108_),
    .B(_107_),
    .ZN(_016_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _254_ (.A1(\CS[2] ),
    .A2(bit_done),
    .A3(_059_),
    .ZN(_110_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _255_ (.A1(r_error_parity),
    .A2(_110_),
    .ZN(rx_valid_o));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _256_ (.A1(rx_ready_i),
    .A2(rx_valid_o),
    .Z(char_event_o));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _257_ (.A1(r_error_parity),
    .A2(rx_ready_i),
    .A3(_110_),
    .ZN(err_overflow_o));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _258_ (.A1(_054_),
    .A2(_110_),
    .ZN(err_parity_o));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _259_ (.A1(_086_),
    .A2(_106_),
    .A3(_109_),
    .ZN(_111_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _260_ (.A1(\baud_cnt[0] ),
    .A2(_111_),
    .ZN(_000_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _261_ (.A1(\baud_cnt[0] ),
    .A2(_043_),
    .Z(_112_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _262_ (.A1(_111_),
    .A2(_112_),
    .ZN(_007_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _263_ (.A1(\baud_cnt[0] ),
    .A2(\baud_cnt[1] ),
    .A3(\baud_cnt[2] ),
    .Z(_113_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _264_ (.A1(\baud_cnt[0] ),
    .A2(\baud_cnt[1] ),
    .B(\baud_cnt[2] ),
    .ZN(_114_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _265_ (.A1(_111_),
    .A2(_113_),
    .A3(_114_),
    .ZN(_008_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _266_ (.A1(\baud_cnt[0] ),
    .A2(\baud_cnt[1] ),
    .A3(\baud_cnt[2] ),
    .A4(\baud_cnt[3] ),
    .Z(_115_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _267_ (.A1(\baud_cnt[3] ),
    .A2(_113_),
    .ZN(_116_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _268_ (.A1(_111_),
    .A2(_115_),
    .A3(_116_),
    .ZN(_009_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _269_ (.A1(_045_),
    .A2(_115_),
    .Z(_117_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _270_ (.A1(_111_),
    .A2(_117_),
    .ZN(_010_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _271_ (.A1(\baud_cnt[4] ),
    .A2(\baud_cnt[5] ),
    .Z(_118_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _272_ (.A1(_115_),
    .A2(_118_),
    .Z(_119_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _273_ (.A1(\baud_cnt[4] ),
    .A2(_115_),
    .B(\baud_cnt[5] ),
    .ZN(_120_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _274_ (.A1(_111_),
    .A2(_119_),
    .A3(_120_),
    .ZN(_011_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _275_ (.A1(\baud_cnt[6] ),
    .A2(_119_),
    .ZN(_121_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _276_ (.A1(\baud_cnt[6] ),
    .A2(_119_),
    .ZN(_122_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _277_ (.A1(_111_),
    .A2(_122_),
    .ZN(_012_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _278_ (.A1(_048_),
    .A2(_121_),
    .ZN(_123_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _279_ (.A1(\baud_cnt[6] ),
    .A2(\baud_cnt[7] ),
    .A3(_115_),
    .A4(_118_),
    .ZN(_124_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _280_ (.A1(_107_),
    .A2(_109_),
    .A3(_123_),
    .A4(_124_),
    .Z(_013_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _281_ (.A1(_050_),
    .A2(_124_),
    .ZN(_125_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _282_ (.A1(\baud_cnt[8] ),
    .A2(_124_),
    .Z(_126_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _283_ (.A1(_111_),
    .A2(_126_),
    .ZN(_014_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _284_ (.A1(\baud_cnt[9] ),
    .A2(_125_),
    .ZN(_127_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _285_ (.A1(_050_),
    .A2(_052_),
    .A3(_124_),
    .ZN(_128_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _286_ (.A1(_111_),
    .A2(_127_),
    .A3(_128_),
    .ZN(_015_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _287_ (.A1(\baud_cnt[10] ),
    .A2(_128_),
    .ZN(_129_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _288_ (.A1(\baud_cnt[8] ),
    .A2(\baud_cnt[9] ),
    .A3(\baud_cnt[10] ),
    .ZN(_130_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _289_ (.A1(_124_),
    .A2(_130_),
    .ZN(_131_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _290_ (.A1(_111_),
    .A2(_129_),
    .A3(_131_),
    .ZN(_001_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _291_ (.A1(\baud_cnt[11] ),
    .A2(_131_),
    .ZN(_132_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _292_ (.A1(\baud_cnt[8] ),
    .A2(\baud_cnt[9] ),
    .A3(\baud_cnt[10] ),
    .A4(\baud_cnt[11] ),
    .ZN(_133_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _293_ (.A1(_124_),
    .A2(_133_),
    .ZN(_134_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _294_ (.A1(_111_),
    .A2(_132_),
    .A3(_134_),
    .ZN(_002_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _295_ (.A1(\baud_cnt[12] ),
    .A2(_134_),
    .ZN(_135_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _296_ (.A1(_111_),
    .A2(_135_),
    .ZN(_003_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _297_ (.A1(\baud_cnt[12] ),
    .A2(_134_),
    .B(\baud_cnt[13] ),
    .ZN(_136_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _298_ (.A1(\baud_cnt[12] ),
    .A2(\baud_cnt[13] ),
    .ZN(_137_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _299_ (.A1(_124_),
    .A2(_133_),
    .A3(_137_),
    .ZN(_138_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _300_ (.A1(_111_),
    .A2(_136_),
    .A3(_138_),
    .ZN(_004_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _301_ (.A1(\baud_cnt[14] ),
    .A2(_138_),
    .ZN(_139_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _302_ (.A1(\baud_cnt[14] ),
    .A2(_138_),
    .Z(_140_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _303_ (.A1(_111_),
    .A2(_139_),
    .A3(_140_),
    .ZN(_005_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _304_ (.A1(\baud_cnt[15] ),
    .A2(_140_),
    .ZN(_141_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _305_ (.A1(\baud_cnt[15] ),
    .A2(_140_),
    .B(_141_),
    .C(_111_),
    .ZN(_006_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _306_ (.A1(_055_),
    .A2(rx_i),
    .Z(_017_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _307_ (.A1(_055_),
    .A2(\reg_rx_sync[0] ),
    .Z(_018_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _308_ (.A1(_041_),
    .A2(cfg_en_i),
    .ZN(_019_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _309_ (.A1(_040_),
    .A2(parity_bit),
    .Z(_142_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _310_ (.A1(\CS[1] ),
    .A2(bit_done),
    .ZN(_143_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _311_ (.A1(_066_),
    .A2(_142_),
    .A3(_143_),
    .ZN(_144_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _312_ (.A1(r_error_parity),
    .A2(_144_),
    .B(_065_),
    .ZN(_145_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _313_ (.I(_145_),
    .ZN(_022_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _314_ (.A1(bit_done),
    .A2(_066_),
    .ZN(_146_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _315_ (.A1(cfg_bits_i[1]),
    .A2(_020_),
    .ZN(_147_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _316_ (.A1(cfg_bits_i[0]),
    .A2(reg_bit_count),
    .ZN(_148_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _317_ (.A1(_021_),
    .A2(_147_),
    .A3(_148_),
    .ZN(_149_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _318_ (.A1(_038_),
    .A2(\CS[0] ),
    .A3(\CS[2] ),
    .ZN(_150_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _319_ (.A1(_149_),
    .A2(_150_),
    .Z(_151_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _320_ (.A1(busy_o),
    .A2(_064_),
    .B1(_108_),
    .B2(bit_done),
    .ZN(_152_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _321_ (.A1(_151_),
    .A2(_152_),
    .ZN(_153_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _322_ (.A1(cfg_parity_en_i),
    .A2(_150_),
    .ZN(_154_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _323_ (.A1(busy_o),
    .A2(_154_),
    .ZN(_155_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _324_ (.A1(_153_),
    .A2(_155_),
    .B(_146_),
    .ZN(_156_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _325_ (.A1(_055_),
    .A2(_156_),
    .ZN(_023_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _326_ (.A1(\CS[1] ),
    .A2(_066_),
    .B(_154_),
    .ZN(_157_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _327_ (.I0(\CS[1] ),
    .I1(_157_),
    .S(_153_),
    .Z(_158_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _328_ (.A1(cfg_en_i),
    .A2(_158_),
    .Z(_024_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _329_ (.A1(\CS[0] ),
    .A2(_057_),
    .B(_039_),
    .C(\CS[1] ),
    .ZN(_159_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _330_ (.A1(\CS[2] ),
    .A2(_153_),
    .B(cfg_en_i),
    .ZN(_160_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _331_ (.A1(_153_),
    .A2(_159_),
    .B(_160_),
    .ZN(_025_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _332_ (.A1(bit_done),
    .A2(_150_),
    .ZN(_161_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _333_ (.I0(rx_data_o[1]),
    .I1(rx_data_o[0]),
    .S(_161_),
    .Z(_026_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _334_ (.I0(rx_data_o[2]),
    .I1(rx_data_o[1]),
    .S(_161_),
    .Z(_027_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _335_ (.I0(rx_data_o[3]),
    .I1(rx_data_o[2]),
    .S(_161_),
    .Z(_028_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _336_ (.I0(rx_data_o[4]),
    .I1(rx_data_o[3]),
    .S(_161_),
    .Z(_029_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _337_ (.A1(cfg_bits_i[0]),
    .A2(cfg_bits_i[1]),
    .B(rx_data_o[5]),
    .ZN(_162_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _338_ (.A1(_040_),
    .A2(cfg_bits_i[0]),
    .A3(cfg_bits_i[1]),
    .B(_162_),
    .ZN(_163_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _339_ (.I0(_163_),
    .I1(rx_data_o[4]),
    .S(_161_),
    .Z(_030_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _340_ (.A1(\reg_rx_sync[2] ),
    .A2(cfg_bits_i[0]),
    .ZN(_164_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _341_ (.A1(cfg_bits_i[1]),
    .A2(_164_),
    .ZN(_165_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _342_ (.A1(cfg_bits_i[1]),
    .A2(rx_data_o[6]),
    .B(_165_),
    .ZN(_166_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _343_ (.A1(rx_data_o[5]),
    .A2(_161_),
    .ZN(_167_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _344_ (.A1(_161_),
    .A2(_166_),
    .B(_167_),
    .ZN(_031_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _345_ (.A1(cfg_bits_i[0]),
    .A2(_058_),
    .ZN(_168_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _346_ (.A1(\reg_rx_sync[2] ),
    .A2(cfg_bits_i[0]),
    .B(cfg_bits_i[1]),
    .C(_168_),
    .ZN(_169_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _347_ (.A1(rx_data_o[6]),
    .A2(_161_),
    .ZN(_170_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _348_ (.A1(_161_),
    .A2(_169_),
    .B(_170_),
    .ZN(_032_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _349_ (.A1(\reg_rx_sync[2] ),
    .A2(cfg_bits_i[0]),
    .A3(cfg_bits_i[1]),
    .ZN(_171_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _350_ (.A1(rx_data_o[7]),
    .A2(_161_),
    .ZN(_172_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _351_ (.A1(_161_),
    .A2(_171_),
    .B(_172_),
    .ZN(_033_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _352_ (.A1(bit_done),
    .A2(_151_),
    .Z(_173_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _353_ (.I0(_173_),
    .I1(_161_),
    .S(reg_bit_count),
    .Z(_034_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _354_ (.A1(reg_bit_count),
    .A2(_020_),
    .ZN(_174_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _355_ (.A1(_149_),
    .A2(_174_),
    .B(_161_),
    .ZN(_175_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _356_ (.A1(reg_bit_count),
    .A2(_173_),
    .B(_020_),
    .ZN(_176_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _357_ (.A1(_175_),
    .A2(_176_),
    .ZN(_035_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _358_ (.A1(reg_bit_count),
    .A2(_020_),
    .A3(_056_),
    .A4(_173_),
    .ZN(_177_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _359_ (.A1(_056_),
    .A2(_175_),
    .B(_177_),
    .ZN(_036_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _360_ (.A1(_038_),
    .A2(\CS[0] ),
    .A3(_039_),
    .A4(bit_done),
    .ZN(_178_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _361_ (.A1(parity_bit),
    .A2(_161_),
    .A3(_178_),
    .ZN(_179_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _362_ (.A1(_142_),
    .A2(_161_),
    .B(_179_),
    .ZN(_037_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _363_ (.D(_022_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(r_error_parity));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _364_ (.D(_023_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\CS[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _365_ (.D(_024_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\CS[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _366_ (.D(_025_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\CS[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _367_ (.D(_026_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _368_ (.D(_027_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _369_ (.D(_028_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _370_ (.D(_029_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _371_ (.D(_030_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _372_ (.D(_031_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _373_ (.D(_032_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _374_ (.D(_033_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(rx_data_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _375_ (.D(_034_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(reg_bit_count));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _376_ (.D(_035_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(_020_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _377_ (.D(_036_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(_021_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _378_ (.D(_037_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(parity_bit));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _379_ (.D(_000_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _380_ (.D(_007_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _381_ (.D(_008_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _382_ (.D(_009_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _383_ (.D(_010_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _384_ (.D(_011_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _385_ (.D(_012_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _386_ (.D(_013_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _387_ (.D(_014_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _388_ (.D(_015_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _389_ (.D(_001_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _390_ (.D(_002_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _391_ (.D(_003_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _392_ (.D(_004_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _393_ (.D(_005_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _394_ (.D(_006_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(\baud_cnt[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _395_ (.D(_016_),
    .RN(rstn_i),
    .CLK(clk_i),
    .Q(bit_done));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _396_ (.D(_017_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(\reg_rx_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _397_ (.D(_018_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(\reg_rx_sync[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _398_ (.D(_019_),
    .SETN(rstn_i),
    .CLK(clk_i),
    .Q(\reg_rx_sync[2] ));
endmodule
