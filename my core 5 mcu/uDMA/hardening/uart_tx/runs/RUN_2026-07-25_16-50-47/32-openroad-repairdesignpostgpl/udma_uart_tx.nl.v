module udma_uart_tx (busy_o,
    cfg_en_i,
    cfg_parity_en_i,
    cfg_stop_bits_i,
    clk_i,
    rstn_i,
    tx_o,
    tx_ready_o,
    tx_valid_i,
    cfg_bits_i,
    cfg_div_i,
    tx_data_i);
 output busy_o;
 input cfg_en_i;
 input cfg_parity_en_i;
 input cfg_stop_bits_i;
 input clk_i;
 input rstn_i;
 output tx_o;
 output tx_ready_o;
 input tx_valid_i;
 input [1:0] cfg_bits_i;
 input [15:0] cfg_div_i;
 input [7:0] tx_data_i;

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
 wire net32;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire parity_bit;
 wire \reg_bit_count[0] ;
 wire \reg_bit_count[1] ;
 wire \reg_data[0] ;
 wire \reg_data[1] ;
 wire \reg_data[2] ;
 wire \reg_data[3] ;
 wire \reg_data[4] ;
 wire \reg_data[5] ;
 wire \reg_data[6] ;
 wire \reg_data[7] ;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net33;
 wire net34;
 wire net31;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;

 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Left_33 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Right_0 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Left_43 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Right_10 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Left_44 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Right_11 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Left_45 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Right_12 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Left_46 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Right_13 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Left_47 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Right_14 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Left_48 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Right_15 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Left_49 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Right_16 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_17_Left_50 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_17_Right_17 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_18_Left_51 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_18_Right_18 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_19_Left_52 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_19_Right_19 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Left_34 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Right_1 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_20_Left_53 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_20_Right_20 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_21_Left_54 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_21_Right_21 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_22_Left_55 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_22_Right_22 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_23_Left_56 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_23_Right_23 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_24_Left_57 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_24_Right_24 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_25_Left_58 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_25_Right_25 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_26_Left_59 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_26_Right_26 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_27_Left_60 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_27_Right_27 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_28_Left_61 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_28_Right_28 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_29_Left_62 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_29_Right_29 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Left_35 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Right_2 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_30_Left_63 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_30_Right_30 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_31_Left_64 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_31_Right_31 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_32_Left_65 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_32_Right_32 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Left_36 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Right_3 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Left_37 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Right_4 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Left_38 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Right_5 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Left_39 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Right_6 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Left_40 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Right_7 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Left_41 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Right_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Left_42 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Right_9 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_66 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_67 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_68 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_69 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_70 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_71 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_100 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_101 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_99 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_102 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_103 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_104 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_105 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_106 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_107 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_108 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_109 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_110 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_111 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_112 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_113 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_114 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_115 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_116 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_117 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_118 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_119 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_120 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_121 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_122 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_123 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_124 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_125 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_126 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_127 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_128 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_72 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_73 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_74 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_129 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_130 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_131 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_132 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_133 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_134 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_135 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_136 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_137 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_138 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_139 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_140 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_141 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_142 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_143 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_144 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_145 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_146 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_147 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_148 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_149 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_150 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_151 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_152 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_153 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_154 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_155 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_156 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_157 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_158 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_75 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_76 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_77 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_159 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_160 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_161 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_162 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_163 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_164 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_165 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_166 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_167 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_168 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_169 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_32_170 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_78 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_79 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_80 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_81 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_82 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_83 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_84 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_85 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_86 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_87 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_88 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_89 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_90 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_91 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_92 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_93 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_94 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_95 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_96 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_97 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_98 ();
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _138_ (.I(\CS[2] ),
    .ZN(_136_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _139_ (.I(\CS[0] ),
    .ZN(_137_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _140_ (.I(\CS[1] ),
    .ZN(_033_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _141_ (.I(net19),
    .ZN(_034_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _142_ (.I(\reg_bit_count[0] ),
    .ZN(_035_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _143_ (.I(\reg_bit_count[1] ),
    .ZN(_036_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _144_ (.I(_017_),
    .ZN(_037_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _145_ (.I(bit_done),
    .ZN(_038_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _146_ (.I(net31),
    .ZN(_039_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _147_ (.A1(\CS[2] ),
    .A2(\CS[1] ),
    .ZN(_040_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _148_ (.A1(\CS[2] ),
    .A2(\CS[0] ),
    .A3(\CS[1] ),
    .ZN(_041_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _149_ (.I(net42),
    .ZN(net32));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _150_ (.A1(\CS[2] ),
    .A2(\CS[1] ),
    .B(net42),
    .ZN(_042_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _151_ (.A1(net9),
    .A2(\baud_cnt[15] ),
    .Z(_043_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _152_ (.A1(net10),
    .A2(\baud_cnt[1] ),
    .ZN(_044_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _153_ (.A1(net11),
    .A2(\baud_cnt[2] ),
    .ZN(_045_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _154_ (.A1(net16),
    .A2(\baud_cnt[7] ),
    .Z(_046_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _155_ (.A1(net14),
    .A2(\baud_cnt[5] ),
    .Z(_047_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _156_ (.A1(net8),
    .A2(\baud_cnt[14] ),
    .ZN(_048_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _157_ (.A1(net17),
    .A2(\baud_cnt[8] ),
    .Z(_049_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _158_ (.A1(net4),
    .A2(\baud_cnt[10] ),
    .ZN(_050_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _159_ (.A1(net12),
    .A2(\baud_cnt[3] ),
    .Z(_051_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _160_ (.A1(net18),
    .A2(\baud_cnt[9] ),
    .Z(_052_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _161_ (.A1(net13),
    .A2(\baud_cnt[4] ),
    .Z(_053_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _162_ (.A1(_052_),
    .A2(_053_),
    .ZN(_054_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _163_ (.A1(net3),
    .A2(\baud_cnt[0] ),
    .Z(_055_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _164_ (.A1(net6),
    .A2(\baud_cnt[12] ),
    .Z(_056_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _165_ (.A1(net15),
    .A2(\baud_cnt[6] ),
    .Z(_057_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _166_ (.A1(net7),
    .A2(\baud_cnt[13] ),
    .Z(_058_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _167_ (.A1(_046_),
    .A2(_058_),
    .ZN(_059_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _168_ (.A1(net5),
    .A2(\baud_cnt[11] ),
    .Z(_060_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _169_ (.A1(_047_),
    .A2(_055_),
    .A3(_057_),
    .A4(_060_),
    .ZN(_061_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _170_ (.A1(_044_),
    .A2(_048_),
    .A3(_059_),
    .A4(_061_),
    .ZN(_062_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _171_ (.A1(_043_),
    .A2(_049_),
    .A3(_051_),
    .A4(_056_),
    .ZN(_063_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _172_ (.A1(_045_),
    .A2(_050_),
    .A3(_054_),
    .A4(_063_),
    .ZN(_064_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _173_ (.A1(_062_),
    .A2(_064_),
    .ZN(_065_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _174_ (.A1(_042_),
    .A2(_065_),
    .Z(_016_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _175_ (.A1(_034_),
    .A2(net32),
    .ZN(net34));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _176_ (.A1(_062_),
    .A2(_064_),
    .B(_042_),
    .ZN(_066_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _177_ (.A1(\baud_cnt[0] ),
    .A2(net36),
    .ZN(_000_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _178_ (.A1(\baud_cnt[0] ),
    .A2(\baud_cnt[1] ),
    .ZN(_067_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _179_ (.A1(net36),
    .A2(_067_),
    .ZN(_007_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _180_ (.A1(\baud_cnt[0] ),
    .A2(\baud_cnt[1] ),
    .A3(\baud_cnt[2] ),
    .Z(_068_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _181_ (.A1(\baud_cnt[0] ),
    .A2(\baud_cnt[1] ),
    .B(\baud_cnt[2] ),
    .ZN(_069_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _182_ (.A1(net36),
    .A2(_068_),
    .A3(_069_),
    .ZN(_008_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _183_ (.A1(\baud_cnt[3] ),
    .A2(_068_),
    .Z(_070_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _184_ (.A1(\baud_cnt[0] ),
    .A2(\baud_cnt[1] ),
    .A3(\baud_cnt[2] ),
    .A4(\baud_cnt[3] ),
    .ZN(_071_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _185_ (.A1(\baud_cnt[3] ),
    .A2(_068_),
    .ZN(_072_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _186_ (.A1(net36),
    .A2(_070_),
    .A3(_072_),
    .ZN(_009_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _187_ (.A1(\baud_cnt[4] ),
    .A2(_071_),
    .Z(_073_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _188_ (.A1(net36),
    .A2(_073_),
    .ZN(_010_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _189_ (.A1(\baud_cnt[4] ),
    .A2(\baud_cnt[5] ),
    .ZN(_074_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _190_ (.A1(_071_),
    .A2(_074_),
    .ZN(_075_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _191_ (.A1(\baud_cnt[4] ),
    .A2(_070_),
    .B(\baud_cnt[5] ),
    .ZN(_076_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _192_ (.A1(net36),
    .A2(_075_),
    .A3(_076_),
    .ZN(_011_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _193_ (.A1(\baud_cnt[6] ),
    .A2(_075_),
    .ZN(_077_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _194_ (.A1(net36),
    .A2(_077_),
    .ZN(_012_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _195_ (.A1(\baud_cnt[6] ),
    .A2(\baud_cnt[7] ),
    .ZN(_078_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _196_ (.A1(_071_),
    .A2(_074_),
    .A3(_078_),
    .ZN(_079_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _197_ (.A1(\baud_cnt[6] ),
    .A2(_075_),
    .B(\baud_cnt[7] ),
    .ZN(_080_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _198_ (.A1(net36),
    .A2(_079_),
    .A3(_080_),
    .ZN(_013_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _199_ (.A1(\baud_cnt[8] ),
    .A2(_079_),
    .ZN(_081_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _200_ (.A1(net36),
    .A2(_081_),
    .ZN(_014_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _201_ (.A1(\baud_cnt[8] ),
    .A2(\baud_cnt[9] ),
    .A3(_079_),
    .Z(_082_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _202_ (.A1(\baud_cnt[8] ),
    .A2(_079_),
    .B(\baud_cnt[9] ),
    .ZN(_083_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _203_ (.A1(net36),
    .A2(_082_),
    .A3(_083_),
    .ZN(_015_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _204_ (.A1(\baud_cnt[10] ),
    .A2(_082_),
    .ZN(_084_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _205_ (.A1(\baud_cnt[10] ),
    .A2(_082_),
    .Z(_085_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _206_ (.A1(net37),
    .A2(_084_),
    .A3(_085_),
    .ZN(_001_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _207_ (.A1(\baud_cnt[10] ),
    .A2(_082_),
    .B(\baud_cnt[11] ),
    .ZN(_086_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _208_ (.A1(\baud_cnt[8] ),
    .A2(\baud_cnt[9] ),
    .A3(\baud_cnt[10] ),
    .A4(\baud_cnt[11] ),
    .ZN(_087_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _209_ (.A1(_071_),
    .A2(_074_),
    .A3(_078_),
    .A4(_087_),
    .ZN(_088_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _210_ (.A1(net37),
    .A2(_086_),
    .A3(_088_),
    .ZN(_002_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _211_ (.A1(\baud_cnt[12] ),
    .A2(net41),
    .ZN(_089_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _212_ (.A1(net37),
    .A2(_089_),
    .ZN(_003_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _213_ (.A1(\baud_cnt[12] ),
    .A2(net41),
    .B(\baud_cnt[13] ),
    .ZN(_090_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _214_ (.A1(\baud_cnt[12] ),
    .A2(\baud_cnt[13] ),
    .A3(net41),
    .Z(_091_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _215_ (.A1(net37),
    .A2(_090_),
    .A3(_091_),
    .ZN(_004_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _216_ (.A1(_062_),
    .A2(_064_),
    .B1(_091_),
    .B2(\baud_cnt[14] ),
    .C(_042_),
    .ZN(_092_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _217_ (.A1(\baud_cnt[14] ),
    .A2(_091_),
    .B(_092_),
    .ZN(_005_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _218_ (.A1(\baud_cnt[14] ),
    .A2(_091_),
    .B(\baud_cnt[15] ),
    .ZN(_093_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _219_ (.A1(\baud_cnt[14] ),
    .A2(\baud_cnt[15] ),
    .A3(_091_),
    .Z(_094_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _220_ (.A1(net37),
    .A2(_093_),
    .A3(_094_),
    .ZN(_006_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _221_ (.A1(\CS[0] ),
    .A2(_040_),
    .ZN(_095_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _222_ (.A1(\CS[0] ),
    .A2(parity_bit),
    .ZN(_096_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _223_ (.A1(_137_),
    .A2(\reg_data[0] ),
    .B(_033_),
    .C(\CS[2] ),
    .ZN(_097_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _224_ (.A1(\CS[0] ),
    .A2(_040_),
    .B1(_096_),
    .B2(_097_),
    .ZN(net33));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _225_ (.A1(\CS[2] ),
    .A2(\CS[1] ),
    .B(bit_done),
    .C(net42),
    .ZN(_098_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _226_ (.A1(\CS[0] ),
    .A2(_098_),
    .ZN(_099_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _227_ (.A1(\CS[2] ),
    .A2(\CS[0] ),
    .A3(_033_),
    .ZN(_100_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _228_ (.A1(net2),
    .A2(\reg_bit_count[1] ),
    .Z(_101_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _229_ (.A1(net1),
    .A2(_035_),
    .Z(_102_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _230_ (.A1(net1),
    .A2(_035_),
    .B(_017_),
    .ZN(_103_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _231_ (.A1(_101_),
    .A2(_102_),
    .A3(_103_),
    .B(_100_),
    .ZN(_104_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _232_ (.A1(_039_),
    .A2(net42),
    .B(_098_),
    .ZN(_105_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _233_ (.A1(_104_),
    .A2(_105_),
    .ZN(_106_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _234_ (.A1(\CS[2] ),
    .A2(_137_),
    .A3(_033_),
    .A4(net21),
    .ZN(_107_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _235_ (.A1(_137_),
    .A2(net20),
    .ZN(_108_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _236_ (.A1(_136_),
    .A2(_137_),
    .A3(\CS[1] ),
    .A4(net20),
    .ZN(_109_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _237_ (.A1(net32),
    .A2(_107_),
    .A3(_109_),
    .ZN(_110_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _238_ (.A1(_104_),
    .A2(_105_),
    .A3(_110_),
    .ZN(_111_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _239_ (.A1(_099_),
    .A2(_111_),
    .B(_034_),
    .ZN(_018_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _240_ (.A1(_095_),
    .A2(_104_),
    .A3(_105_),
    .A4(_109_),
    .Z(_112_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _241_ (.A1(_033_),
    .A2(_106_),
    .B(_112_),
    .C(_034_),
    .ZN(_019_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _242_ (.A1(_136_),
    .A2(\CS[1] ),
    .A3(_108_),
    .ZN(_113_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _243_ (.A1(_104_),
    .A2(_105_),
    .A3(_107_),
    .A4(_113_),
    .Z(_114_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _244_ (.A1(_136_),
    .A2(_106_),
    .B(_114_),
    .C(_034_),
    .ZN(_020_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _245_ (.A1(net31),
    .A2(_041_),
    .ZN(_115_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _246_ (.A1(\CS[2] ),
    .A2(\CS[0] ),
    .A3(_033_),
    .A4(_038_),
    .ZN(_116_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _247_ (.A1(_101_),
    .A2(_102_),
    .A3(_103_),
    .B(net39),
    .ZN(_117_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _248_ (.A1(_115_),
    .A2(net38),
    .ZN(_118_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _249_ (.I0(net23),
    .I1(\reg_data[1] ),
    .S(net40),
    .Z(_119_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _250_ (.I0(\reg_data[0] ),
    .I1(_119_),
    .S(_118_),
    .Z(_021_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _251_ (.I0(net24),
    .I1(\reg_data[2] ),
    .S(net40),
    .Z(_120_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _252_ (.I0(\reg_data[1] ),
    .I1(_120_),
    .S(net35),
    .Z(_022_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _253_ (.I0(net25),
    .I1(\reg_data[3] ),
    .S(net40),
    .Z(_121_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _254_ (.I0(\reg_data[2] ),
    .I1(_121_),
    .S(net35),
    .Z(_023_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _255_ (.I0(net26),
    .I1(\reg_data[4] ),
    .S(net40),
    .Z(_122_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _256_ (.I0(\reg_data[3] ),
    .I1(_122_),
    .S(net35),
    .Z(_024_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _257_ (.I0(net27),
    .I1(\reg_data[5] ),
    .S(_115_),
    .Z(_123_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _258_ (.I0(\reg_data[4] ),
    .I1(_123_),
    .S(net35),
    .Z(_025_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _259_ (.I0(net28),
    .I1(\reg_data[6] ),
    .S(_115_),
    .Z(_124_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _260_ (.I0(\reg_data[5] ),
    .I1(_124_),
    .S(net35),
    .Z(_026_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _261_ (.A1(net31),
    .A2(_041_),
    .B(\reg_data[7] ),
    .ZN(_125_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _262_ (.A1(net29),
    .A2(_115_),
    .ZN(_126_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _263_ (.A1(_125_),
    .A2(_126_),
    .ZN(_127_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _264_ (.I0(\reg_data[6] ),
    .I1(_127_),
    .S(net35),
    .Z(_027_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _265_ (.A1(net30),
    .A2(_115_),
    .ZN(_128_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _266_ (.A1(net38),
    .A2(_125_),
    .B(_128_),
    .ZN(_028_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _267_ (.I0(net39),
    .I1(net38),
    .S(_035_),
    .Z(_129_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _268_ (.I(_129_),
    .ZN(_029_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _269_ (.A1(_035_),
    .A2(net38),
    .Z(_130_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _270_ (.A1(_101_),
    .A2(_102_),
    .A3(_103_),
    .B1(_036_),
    .B2(_035_),
    .ZN(_131_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _271_ (.A1(net39),
    .A2(_131_),
    .Z(_132_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _272_ (.A1(_036_),
    .A2(_130_),
    .B(_132_),
    .ZN(_030_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _273_ (.A1(\reg_bit_count[1] ),
    .A2(_037_),
    .ZN(_133_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _274_ (.A1(_037_),
    .A2(_132_),
    .B1(_133_),
    .B2(_130_),
    .ZN(_031_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _275_ (.A1(\reg_data[0] ),
    .A2(_116_),
    .ZN(_134_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _276_ (.A1(_038_),
    .A2(_095_),
    .B(_134_),
    .C(parity_bit),
    .ZN(_135_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _277_ (.A1(parity_bit),
    .A2(_134_),
    .B(_135_),
    .ZN(_032_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _278_ (.D(_018_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\CS[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _279_ (.D(_019_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\CS[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _280_ (.D(_020_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\CS[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _281_ (.D(_021_),
    .SETN(net44),
    .CLK(clk_i),
    .Q(\reg_data[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _282_ (.D(_022_),
    .SETN(net43),
    .CLK(clk_i),
    .Q(\reg_data[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _283_ (.D(_023_),
    .SETN(net43),
    .CLK(clk_i),
    .Q(\reg_data[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _284_ (.D(_024_),
    .SETN(net43),
    .CLK(clk_i),
    .Q(\reg_data[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _285_ (.D(_025_),
    .SETN(net43),
    .CLK(clk_i),
    .Q(\reg_data[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _286_ (.D(_026_),
    .SETN(net44),
    .CLK(clk_i),
    .Q(\reg_data[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _287_ (.D(_027_),
    .SETN(net44),
    .CLK(clk_i),
    .Q(\reg_data[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _288_ (.D(_028_),
    .SETN(net44),
    .CLK(clk_i),
    .Q(\reg_data[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _289_ (.D(_029_),
    .RN(net44),
    .CLK(clk_i),
    .Q(\reg_bit_count[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _290_ (.D(_030_),
    .RN(net44),
    .CLK(clk_i),
    .Q(\reg_bit_count[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _291_ (.D(_031_),
    .RN(net44),
    .CLK(clk_i),
    .Q(_017_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _292_ (.D(_032_),
    .RN(net44),
    .CLK(clk_i),
    .Q(parity_bit));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _293_ (.D(_000_),
    .RN(net43),
    .CLK(clk_i),
    .Q(\baud_cnt[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _294_ (.D(_007_),
    .RN(net43),
    .CLK(clk_i),
    .Q(\baud_cnt[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _295_ (.D(_008_),
    .RN(net43),
    .CLK(clk_i),
    .Q(\baud_cnt[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _296_ (.D(_009_),
    .RN(net43),
    .CLK(clk_i),
    .Q(\baud_cnt[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _297_ (.D(_010_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\baud_cnt[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _298_ (.D(_011_),
    .RN(net43),
    .CLK(clk_i),
    .Q(\baud_cnt[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _299_ (.D(_012_),
    .RN(net43),
    .CLK(clk_i),
    .Q(\baud_cnt[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _300_ (.D(_013_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\baud_cnt[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _301_ (.D(_014_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\baud_cnt[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _302_ (.D(_015_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\baud_cnt[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _303_ (.D(_001_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\baud_cnt[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _304_ (.D(_002_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\baud_cnt[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _305_ (.D(_003_),
    .RN(net45),
    .CLK(clk_i),
    .Q(\baud_cnt[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _306_ (.D(_004_),
    .RN(net46),
    .CLK(clk_i),
    .Q(\baud_cnt[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _307_ (.D(_005_),
    .RN(net46),
    .CLK(clk_i),
    .Q(\baud_cnt[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _308_ (.D(_006_),
    .RN(net46),
    .CLK(clk_i),
    .Q(\baud_cnt[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _309_ (.D(_016_),
    .RN(net46),
    .CLK(clk_i),
    .Q(bit_done));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 fanout36 (.I(_066_),
    .Z(net36));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 fanout37 (.I(_066_),
    .Z(net37));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 fanout43 (.I(net46),
    .Z(net43));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 fanout44 (.I(net46),
    .Z(net44));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 fanout45 (.I(net46),
    .Z(net45));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 fanout46 (.I(net22),
    .Z(net46));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input1 (.I(cfg_bits_i[0]),
    .Z(net1));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input10 (.I(cfg_div_i[1]),
    .Z(net10));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input11 (.I(cfg_div_i[2]),
    .Z(net11));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input12 (.I(cfg_div_i[3]),
    .Z(net12));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input13 (.I(cfg_div_i[4]),
    .Z(net13));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input14 (.I(cfg_div_i[5]),
    .Z(net14));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input15 (.I(cfg_div_i[6]),
    .Z(net15));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input16 (.I(cfg_div_i[7]),
    .Z(net16));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input17 (.I(cfg_div_i[8]),
    .Z(net17));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input18 (.I(cfg_div_i[9]),
    .Z(net18));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input19 (.I(cfg_en_i),
    .Z(net19));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input2 (.I(cfg_bits_i[1]),
    .Z(net2));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input20 (.I(cfg_parity_en_i),
    .Z(net20));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input21 (.I(cfg_stop_bits_i),
    .Z(net21));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input22 (.I(rstn_i),
    .Z(net22));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input23 (.I(tx_data_i[0]),
    .Z(net23));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input24 (.I(tx_data_i[1]),
    .Z(net24));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input25 (.I(tx_data_i[2]),
    .Z(net25));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input26 (.I(tx_data_i[3]),
    .Z(net26));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input27 (.I(tx_data_i[4]),
    .Z(net27));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input28 (.I(tx_data_i[5]),
    .Z(net28));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input29 (.I(tx_data_i[6]),
    .Z(net29));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input3 (.I(cfg_div_i[0]),
    .Z(net3));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input30 (.I(tx_data_i[7]),
    .Z(net30));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input31 (.I(tx_valid_i),
    .Z(net31));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input4 (.I(cfg_div_i[10]),
    .Z(net4));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input5 (.I(cfg_div_i[11]),
    .Z(net5));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input6 (.I(cfg_div_i[12]),
    .Z(net6));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input7 (.I(cfg_div_i[13]),
    .Z(net7));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input8 (.I(cfg_div_i[14]),
    .Z(net8));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 input9 (.I(cfg_div_i[15]),
    .Z(net9));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 max_cap35 (.I(_118_),
    .Z(net35));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 max_cap39 (.I(_116_),
    .Z(net39));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 max_cap40 (.I(_115_),
    .Z(net40));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 max_cap42 (.I(_041_),
    .Z(net42));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 output32 (.I(net32),
    .Z(busy_o));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 output33 (.I(net33),
    .Z(tx_o));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 output34 (.I(net34),
    .Z(tx_ready_o));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 wire38 (.I(_117_),
    .Z(net38));
 gf180mcu_fd_sc_mcu7t5v0__dlyb_1 wire41 (.I(_088_),
    .Z(net41));
endmodule
