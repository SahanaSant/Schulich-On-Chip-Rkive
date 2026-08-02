module udma_uart_top (cfg_ready_o,
    cfg_rwn_i,
    cfg_rx_clr_o,
    cfg_rx_continuous_o,
    cfg_rx_en_i,
    cfg_rx_en_o,
    cfg_rx_pending_i,
    cfg_tx_clr_o,
    cfg_tx_continuous_o,
    cfg_tx_en_i,
    cfg_tx_en_o,
    cfg_tx_pending_i,
    cfg_valid_i,
    data_rx_ready_i,
    data_rx_valid_o,
    data_tx_gnt_i,
    data_tx_ready_o,
    data_tx_req_o,
    data_tx_valid_i,
    err_event_o,
    periph_clk_i,
    rstn_i,
    rx_char_event_o,
    sys_clk_i,
    uart_rx_i,
    uart_tx_o,
    cfg_addr_i,
    cfg_data_i,
    cfg_data_o,
    cfg_rx_bytes_left_i,
    cfg_rx_curr_addr_i,
    cfg_rx_datasize_o,
    cfg_rx_size_o,
    cfg_rx_startaddr_o,
    cfg_tx_bytes_left_i,
    cfg_tx_curr_addr_i,
    cfg_tx_datasize_o,
    cfg_tx_size_o,
    cfg_tx_startaddr_o,
    data_rx_datasize_o,
    data_rx_o,
    data_tx_datasize_o,
    data_tx_i);
 output cfg_ready_o;
 input cfg_rwn_i;
 output cfg_rx_clr_o;
 output cfg_rx_continuous_o;
 input cfg_rx_en_i;
 output cfg_rx_en_o;
 input cfg_rx_pending_i;
 output cfg_tx_clr_o;
 output cfg_tx_continuous_o;
 input cfg_tx_en_i;
 output cfg_tx_en_o;
 input cfg_tx_pending_i;
 input cfg_valid_i;
 input data_rx_ready_i;
 output data_rx_valid_o;
 input data_tx_gnt_i;
 output data_tx_ready_o;
 output data_tx_req_o;
 input data_tx_valid_i;
 output err_event_o;
 input periph_clk_i;
 input rstn_i;
 output rx_char_event_o;
 input sys_clk_i;
 input uart_rx_i;
 output uart_tx_o;
 input [4:0] cfg_addr_i;
 input [31:0] cfg_data_i;
 output [31:0] cfg_data_o;
 input [15:0] cfg_rx_bytes_left_i;
 input [11:0] cfg_rx_curr_addr_i;
 output [1:0] cfg_rx_datasize_o;
 output [15:0] cfg_rx_size_o;
 output [11:0] cfg_rx_startaddr_o;
 input [15:0] cfg_tx_bytes_left_i;
 input [11:0] cfg_tx_curr_addr_i;
 output [1:0] cfg_tx_datasize_o;
 output [15:0] cfg_tx_size_o;
 output [11:0] cfg_tx_startaddr_o;
 output [1:0] data_rx_datasize_o;
 output [31:0] data_rx_o;
 output [1:0] data_tx_datasize_o;
 input [31:0] data_tx_i;

 wire _0000_;
 wire _0001_;
 wire _0002_;
 wire _0003_;
 wire _0004_;
 wire _0005_;
 wire _0006_;
 wire _0007_;
 wire _0008_;
 wire _0009_;
 wire _0010_;
 wire _0011_;
 wire _0012_;
 wire _0013_;
 wire _0014_;
 wire _0015_;
 wire _0016_;
 wire _0017_;
 wire _0018_;
 wire _0019_;
 wire _0020_;
 wire _0021_;
 wire _0022_;
 wire _0023_;
 wire _0024_;
 wire _0025_;
 wire _0026_;
 wire _0027_;
 wire _0028_;
 wire _0029_;
 wire _0030_;
 wire _0031_;
 wire _0032_;
 wire _0033_;
 wire _0034_;
 wire _0035_;
 wire _0036_;
 wire _0037_;
 wire _0038_;
 wire _0039_;
 wire _0040_;
 wire _0041_;
 wire _0042_;
 wire _0043_;
 wire _0044_;
 wire _0045_;
 wire _0046_;
 wire _0047_;
 wire _0048_;
 wire _0049_;
 wire _0050_;
 wire _0051_;
 wire _0052_;
 wire _0053_;
 wire _0054_;
 wire _0055_;
 wire _0056_;
 wire _0057_;
 wire _0058_;
 wire _0059_;
 wire _0060_;
 wire _0061_;
 wire _0062_;
 wire _0063_;
 wire _0064_;
 wire _0065_;
 wire _0066_;
 wire _0067_;
 wire _0068_;
 wire _0069_;
 wire _0070_;
 wire _0071_;
 wire _0072_;
 wire _0073_;
 wire _0074_;
 wire _0075_;
 wire _0076_;
 wire _0077_;
 wire _0078_;
 wire _0079_;
 wire _0080_;
 wire _0081_;
 wire _0082_;
 wire _0083_;
 wire _0084_;
 wire _0085_;
 wire _0086_;
 wire _0087_;
 wire _0088_;
 wire _0089_;
 wire _0090_;
 wire _0091_;
 wire _0092_;
 wire _0093_;
 wire _0094_;
 wire _0095_;
 wire _0096_;
 wire _0097_;
 wire _0098_;
 wire _0099_;
 wire _0100_;
 wire _0101_;
 wire _0102_;
 wire _0103_;
 wire _0104_;
 wire _0105_;
 wire _0106_;
 wire _0107_;
 wire _0108_;
 wire _0109_;
 wire _0110_;
 wire _0111_;
 wire _0112_;
 wire _0113_;
 wire _0114_;
 wire _0115_;
 wire _0116_;
 wire _0117_;
 wire _0118_;
 wire _0119_;
 wire _0120_;
 wire _0121_;
 wire _0122_;
 wire _0123_;
 wire _0124_;
 wire _0125_;
 wire _0126_;
 wire _0127_;
 wire _0128_;
 wire _0129_;
 wire _0130_;
 wire _0131_;
 wire _0132_;
 wire _0133_;
 wire _0134_;
 wire _0135_;
 wire _0136_;
 wire _0137_;
 wire _0138_;
 wire _0139_;
 wire _0140_;
 wire _0141_;
 wire _0142_;
 wire _0143_;
 wire _0144_;
 wire _0145_;
 wire _0146_;
 wire _0147_;
 wire _0148_;
 wire _0149_;
 wire _0150_;
 wire _0151_;
 wire _0152_;
 wire _0153_;
 wire _0154_;
 wire _0155_;
 wire _0156_;
 wire _0157_;
 wire _0158_;
 wire _0159_;
 wire _0160_;
 wire _0161_;
 wire _0162_;
 wire _0163_;
 wire _0164_;
 wire _0165_;
 wire _0166_;
 wire _0167_;
 wire _0168_;
 wire _0169_;
 wire _0170_;
 wire _0171_;
 wire _0172_;
 wire _0173_;
 wire _0174_;
 wire _0175_;
 wire _0176_;
 wire _0177_;
 wire _0178_;
 wire _0179_;
 wire _0180_;
 wire _0181_;
 wire _0182_;
 wire _0183_;
 wire _0184_;
 wire _0185_;
 wire _0186_;
 wire _0187_;
 wire _0188_;
 wire _0189_;
 wire _0190_;
 wire _0191_;
 wire _0192_;
 wire _0193_;
 wire _0194_;
 wire _0195_;
 wire _0196_;
 wire _0197_;
 wire _0198_;
 wire _0199_;
 wire _0200_;
 wire _0201_;
 wire _0202_;
 wire _0203_;
 wire _0204_;
 wire _0205_;
 wire _0206_;
 wire _0207_;
 wire _0208_;
 wire _0209_;
 wire _0210_;
 wire _0211_;
 wire _0212_;
 wire _0213_;
 wire _0214_;
 wire _0215_;
 wire _0216_;
 wire _0217_;
 wire _0218_;
 wire _0219_;
 wire _0220_;
 wire _0221_;
 wire _0222_;
 wire _0223_;
 wire _0224_;
 wire _0225_;
 wire _0226_;
 wire _0227_;
 wire _0228_;
 wire _0229_;
 wire _0230_;
 wire _0231_;
 wire _0232_;
 wire _0233_;
 wire _0234_;
 wire _0235_;
 wire _0236_;
 wire _0237_;
 wire _0238_;
 wire _0239_;
 wire _0240_;
 wire _0241_;
 wire _0242_;
 wire _0243_;
 wire _0244_;
 wire _0245_;
 wire _0246_;
 wire _0247_;
 wire _0248_;
 wire _0249_;
 wire _0250_;
 wire _0251_;
 wire _0252_;
 wire _0253_;
 wire _0254_;
 wire _0255_;
 wire _0256_;
 wire _0257_;
 wire _0258_;
 wire _0259_;
 wire _0260_;
 wire _0261_;
 wire _0262_;
 wire _0263_;
 wire _0264_;
 wire _0265_;
 wire _0266_;
 wire _0267_;
 wire _0268_;
 wire _0269_;
 wire _0270_;
 wire _0271_;
 wire _0272_;
 wire _0273_;
 wire _0274_;
 wire _0275_;
 wire _0276_;
 wire _0277_;
 wire _0278_;
 wire _0279_;
 wire _0280_;
 wire _0281_;
 wire _0282_;
 wire _0283_;
 wire _0284_;
 wire _0285_;
 wire _0286_;
 wire _0287_;
 wire _0288_;
 wire _0289_;
 wire _0290_;
 wire _0291_;
 wire _0292_;
 wire _0293_;
 wire _0294_;
 wire _0295_;
 wire _0296_;
 wire _0297_;
 wire _0298_;
 wire _0299_;
 wire _0300_;
 wire _0301_;
 wire _0302_;
 wire _0303_;
 wire _0304_;
 wire _0305_;
 wire _0306_;
 wire _0307_;
 wire _0308_;
 wire _0309_;
 wire _0310_;
 wire _0311_;
 wire _0312_;
 wire _0313_;
 wire _0314_;
 wire _0315_;
 wire _0316_;
 wire _0317_;
 wire _0318_;
 wire _0319_;
 wire _0320_;
 wire _0321_;
 wire _0322_;
 wire _0323_;
 wire _0324_;
 wire _0325_;
 wire _0326_;
 wire _0327_;
 wire _0328_;
 wire _0329_;
 wire _0330_;
 wire _0331_;
 wire _0332_;
 wire _0333_;
 wire _0334_;
 wire _0335_;
 wire _0336_;
 wire _0337_;
 wire _0338_;
 wire _0339_;
 wire _0340_;
 wire _0341_;
 wire _0342_;
 wire _0343_;
 wire _0344_;
 wire _0345_;
 wire _0346_;
 wire _0347_;
 wire _0348_;
 wire _0349_;
 wire _0350_;
 wire _0351_;
 wire _0352_;
 wire _0353_;
 wire _0354_;
 wire _0355_;
 wire _0356_;
 wire _0357_;
 wire _0358_;
 wire _0359_;
 wire _0360_;
 wire _0361_;
 wire _0362_;
 wire _0363_;
 wire _0364_;
 wire _0365_;
 wire _0366_;
 wire _0367_;
 wire _0368_;
 wire _0369_;
 wire _0370_;
 wire _0371_;
 wire _0372_;
 wire _0373_;
 wire _0374_;
 wire _0375_;
 wire _0376_;
 wire _0377_;
 wire _0378_;
 wire _0379_;
 wire _0380_;
 wire _0381_;
 wire _0382_;
 wire _0383_;
 wire _0384_;
 wire _0385_;
 wire _0386_;
 wire _0387_;
 wire _0388_;
 wire _0389_;
 wire _0390_;
 wire _0391_;
 wire _0392_;
 wire _0393_;
 wire _0394_;
 wire _0395_;
 wire _0396_;
 wire _0397_;
 wire _0398_;
 wire _0399_;
 wire _0400_;
 wire _0401_;
 wire _0402_;
 wire _0403_;
 wire _0404_;
 wire _0405_;
 wire _0406_;
 wire _0407_;
 wire _0408_;
 wire _0409_;
 wire _0410_;
 wire _0411_;
 wire _0412_;
 wire _0413_;
 wire _0414_;
 wire _0415_;
 wire _0416_;
 wire _0417_;
 wire _0418_;
 wire _0419_;
 wire _0420_;
 wire _0421_;
 wire _0422_;
 wire _0423_;
 wire _0424_;
 wire _0425_;
 wire _0426_;
 wire _0427_;
 wire _0428_;
 wire _0429_;
 wire _0430_;
 wire _0431_;
 wire _0432_;
 wire _0433_;
 wire _0434_;
 wire _0435_;
 wire _0436_;
 wire _0437_;
 wire _0438_;
 wire _0439_;
 wire _0440_;
 wire _0441_;
 wire _0442_;
 wire _0443_;
 wire _0444_;
 wire _0445_;
 wire _0446_;
 wire _0447_;
 wire _0448_;
 wire _0449_;
 wire _0450_;
 wire _0451_;
 wire _0452_;
 wire _0453_;
 wire _0454_;
 wire _0455_;
 wire _0456_;
 wire _0457_;
 wire _0458_;
 wire _0459_;
 wire _0460_;
 wire _0461_;
 wire _0462_;
 wire _0463_;
 wire _0464_;
 wire _0465_;
 wire _0466_;
 wire _0467_;
 wire _0468_;
 wire _0469_;
 wire _0470_;
 wire _0471_;
 wire _0472_;
 wire _0473_;
 wire _0474_;
 wire _0475_;
 wire _0476_;
 wire _0477_;
 wire _0478_;
 wire _0479_;
 wire _0480_;
 wire _0481_;
 wire _0482_;
 wire _0483_;
 wire _0484_;
 wire _0485_;
 wire _0486_;
 wire _0487_;
 wire _0488_;
 wire _0489_;
 wire _0490_;
 wire _0491_;
 wire _0492_;
 wire _0493_;
 wire _0494_;
 wire _0495_;
 wire _0496_;
 wire _0497_;
 wire _0498_;
 wire _0499_;
 wire _0500_;
 wire _0501_;
 wire _0502_;
 wire _0503_;
 wire _0504_;
 wire _0505_;
 wire _0506_;
 wire _0507_;
 wire _0508_;
 wire _0509_;
 wire _0510_;
 wire _0511_;
 wire _0512_;
 wire _0513_;
 wire _0514_;
 wire _0515_;
 wire _0516_;
 wire _0517_;
 wire _0518_;
 wire _0519_;
 wire _0520_;
 wire _0521_;
 wire _0522_;
 wire _0523_;
 wire _0524_;
 wire _0525_;
 wire _0526_;
 wire _0527_;
 wire _0528_;
 wire _0529_;
 wire _0530_;
 wire _0531_;
 wire _0532_;
 wire _0533_;
 wire _0534_;
 wire _0535_;
 wire _0536_;
 wire _0537_;
 wire _0538_;
 wire _0539_;
 wire _0540_;
 wire _0541_;
 wire _0542_;
 wire _0543_;
 wire _0544_;
 wire _0545_;
 wire _0546_;
 wire _0547_;
 wire _0548_;
 wire _0549_;
 wire _0550_;
 wire _0551_;
 wire _0552_;
 wire _0553_;
 wire _0554_;
 wire _0555_;
 wire _0556_;
 wire _0557_;
 wire _0558_;
 wire _0559_;
 wire _0560_;
 wire _0561_;
 wire _0562_;
 wire _0563_;
 wire _0564_;
 wire _0565_;
 wire _0566_;
 wire _0567_;
 wire _0568_;
 wire _0569_;
 wire _0570_;
 wire _0571_;
 wire _0572_;
 wire _0573_;
 wire _0574_;
 wire _0575_;
 wire _0576_;
 wire _0577_;
 wire _0578_;
 wire _0579_;
 wire _0580_;
 wire _0581_;
 wire _0582_;
 wire _0583_;
 wire _0584_;
 wire _0585_;
 wire _0586_;
 wire _0587_;
 wire _0588_;
 wire _0589_;
 wire _0590_;
 wire _0591_;
 wire _0592_;
 wire _0593_;
 wire _0594_;
 wire _0595_;
 wire _0596_;
 wire _0597_;
 wire _0598_;
 wire _0599_;
 wire _0600_;
 wire _0601_;
 wire _0602_;
 wire _0603_;
 wire _0604_;
 wire _0605_;
 wire _0606_;
 wire _0607_;
 wire _0608_;
 wire _0609_;
 wire _0610_;
 wire _0611_;
 wire _0612_;
 wire _0613_;
 wire _0614_;
 wire _0615_;
 wire _0616_;
 wire _0617_;
 wire _0618_;
 wire _0619_;
 wire _0620_;
 wire _0621_;
 wire _0622_;
 wire _0623_;
 wire _0624_;
 wire _0625_;
 wire _0626_;
 wire _0627_;
 wire _0628_;
 wire _0629_;
 wire _0630_;
 wire _0631_;
 wire _0632_;
 wire _0633_;
 wire _0634_;
 wire _0635_;
 wire _0636_;
 wire _0637_;
 wire _0638_;
 wire _0639_;
 wire _0640_;
 wire _0641_;
 wire _0642_;
 wire _0643_;
 wire _0644_;
 wire _0645_;
 wire _0646_;
 wire _0647_;
 wire _0648_;
 wire _0649_;
 wire _0650_;
 wire _0651_;
 wire _0652_;
 wire _0653_;
 wire _0654_;
 wire _0655_;
 wire _0656_;
 wire _0657_;
 wire _0658_;
 wire _0659_;
 wire _0660_;
 wire _0661_;
 wire _0662_;
 wire _0663_;
 wire _0664_;
 wire _0665_;
 wire _0666_;
 wire _0667_;
 wire _0668_;
 wire _0669_;
 wire _0670_;
 wire _0671_;
 wire _0672_;
 wire _0673_;
 wire _0674_;
 wire _0675_;
 wire _0676_;
 wire _0677_;
 wire _0678_;
 wire _0679_;
 wire _0680_;
 wire _0681_;
 wire _0682_;
 wire _0683_;
 wire _0684_;
 wire _0685_;
 wire _0686_;
 wire _0687_;
 wire _0688_;
 wire _0689_;
 wire _0690_;
 wire _0691_;
 wire _0692_;
 wire _0693_;
 wire _0694_;
 wire _0695_;
 wire _0696_;
 wire _0697_;
 wire _0698_;
 wire _0699_;
 wire _0700_;
 wire _0701_;
 wire _0702_;
 wire _0703_;
 wire _0704_;
 wire _0705_;
 wire _0706_;
 wire _0707_;
 wire _0708_;
 wire _0709_;
 wire _0710_;
 wire _0711_;
 wire _0712_;
 wire _0713_;
 wire _0714_;
 wire _0715_;
 wire _0716_;
 wire _0717_;
 wire _0718_;
 wire _0719_;
 wire _0720_;
 wire _0721_;
 wire _0722_;
 wire _0723_;
 wire _0724_;
 wire _0725_;
 wire _0726_;
 wire _0727_;
 wire _0728_;
 wire _0729_;
 wire _0730_;
 wire _0731_;
 wire _0732_;
 wire _0733_;
 wire _0734_;
 wire _0735_;
 wire _0736_;
 wire _0737_;
 wire _0738_;
 wire _0739_;
 wire _0740_;
 wire _0741_;
 wire _0742_;
 wire _0743_;
 wire _0744_;
 wire _0745_;
 wire _0746_;
 wire _0747_;
 wire _0748_;
 wire _0749_;
 wire _0750_;
 wire _0751_;
 wire _0752_;
 wire _0753_;
 wire _0754_;
 wire _0755_;
 wire _0756_;
 wire _0757_;
 wire _0758_;
 wire _0759_;
 wire _0760_;
 wire _0761_;
 wire _0762_;
 wire _0763_;
 wire _0764_;
 wire _0765_;
 wire _0766_;
 wire _0767_;
 wire _0768_;
 wire _0769_;
 wire _0770_;
 wire _0771_;
 wire _0772_;
 wire _0773_;
 wire _0774_;
 wire _0775_;
 wire _0776_;
 wire _0777_;
 wire _0778_;
 wire _0779_;
 wire _0780_;
 wire _0781_;
 wire _0782_;
 wire _0783_;
 wire _0784_;
 wire _0785_;
 wire _0786_;
 wire _0787_;
 wire _0788_;
 wire _0789_;
 wire _0790_;
 wire _0791_;
 wire _0792_;
 wire _0793_;
 wire _0794_;
 wire _0795_;
 wire _0796_;
 wire _0797_;
 wire _0798_;
 wire _0799_;
 wire _0800_;
 wire _0801_;
 wire _0802_;
 wire _0803_;
 wire _0804_;
 wire _0805_;
 wire _0806_;
 wire _0807_;
 wire _0808_;
 wire _0809_;
 wire _0810_;
 wire _0811_;
 wire _0812_;
 wire _0813_;
 wire _0814_;
 wire _0815_;
 wire _0816_;
 wire _0817_;
 wire _0818_;
 wire _0819_;
 wire _0820_;
 wire _0821_;
 wire _0822_;
 wire _0823_;
 wire _0824_;
 wire _0825_;
 wire _0826_;
 wire _0827_;
 wire _0828_;
 wire _0829_;
 wire _0830_;
 wire _0831_;
 wire _0832_;
 wire _0833_;
 wire _0834_;
 wire _0835_;
 wire _0836_;
 wire _0837_;
 wire _0838_;
 wire _0839_;
 wire _0840_;
 wire _0841_;
 wire _0842_;
 wire _0843_;
 wire _0844_;
 wire _0845_;
 wire _0846_;
 wire _0847_;
 wire _0848_;
 wire _0849_;
 wire _0850_;
 wire _0851_;
 wire _0852_;
 wire _0853_;
 wire _0854_;
 wire _0855_;
 wire _0856_;
 wire _0857_;
 wire _0858_;
 wire _0859_;
 wire _0860_;
 wire _0861_;
 wire _0862_;
 wire _0863_;
 wire _0864_;
 wire _0865_;
 wire _0866_;
 wire _0867_;
 wire _0868_;
 wire _0869_;
 wire _0870_;
 wire _0871_;
 wire _0872_;
 wire _0873_;
 wire _0874_;
 wire _0875_;
 wire _0876_;
 wire _0877_;
 wire _0878_;
 wire _0879_;
 wire _0880_;
 wire _0881_;
 wire _0882_;
 wire _0883_;
 wire _0884_;
 wire _0885_;
 wire _0886_;
 wire _0887_;
 wire _0888_;
 wire _0889_;
 wire _0890_;
 wire _0891_;
 wire _0892_;
 wire _0893_;
 wire _0894_;
 wire _0895_;
 wire _0896_;
 wire _0897_;
 wire _0898_;
 wire _0899_;
 wire _0900_;
 wire \i_ep_err_overflow.i_sync_clkb.i_pulp_sync.r_reg[0] ;
 wire \i_ep_err_overflow.i_sync_clkb.i_pulp_sync.r_reg[1] ;
 wire \i_ep_err_overflow.i_sync_clkb.i_pulp_sync.serial_i ;
 wire \i_ep_err_overflow.i_sync_clkb.serial_o ;
 wire \i_ep_err_overflow.s_input_reg_next ;
 wire \i_ep_err_overflow.sync_a[0] ;
 wire \i_ep_err_overflow.sync_a[1] ;
 wire \i_ep_err_parity.i_sync_clkb.i_pulp_sync.r_reg[0] ;
 wire \i_ep_err_parity.i_sync_clkb.i_pulp_sync.r_reg[1] ;
 wire \i_ep_err_parity.i_sync_clkb.i_pulp_sync.serial_i ;
 wire \i_ep_err_parity.i_sync_clkb.serial_o ;
 wire \i_ep_err_parity.s_input_reg_next ;
 wire \i_ep_err_parity.sync_a[0] ;
 wire \i_ep_err_parity.sync_a[1] ;
 wire \i_ep_event.i_sync_clkb.i_pulp_sync.r_reg[0] ;
 wire \i_ep_event.i_sync_clkb.i_pulp_sync.r_reg[1] ;
 wire \i_ep_event.i_sync_clkb.i_pulp_sync.serial_i ;
 wire \i_ep_event.i_sync_clkb.serial_o ;
 wire \i_ep_event.s_input_reg_next ;
 wire \i_ep_event.sync_a[0] ;
 wire \i_ep_event.sync_a[1] ;
 wire \r_status_sync[0] ;
 wire \r_status_sync[1] ;
 wire \r_status_sync[2] ;
 wire \r_status_sync[3] ;
 wire \r_uart_bits[0] ;
 wire \r_uart_bits[1] ;
 wire \r_uart_div[0] ;
 wire \r_uart_div[10] ;
 wire \r_uart_div[11] ;
 wire \r_uart_div[12] ;
 wire \r_uart_div[13] ;
 wire \r_uart_div[14] ;
 wire \r_uart_div[15] ;
 wire \r_uart_div[1] ;
 wire \r_uart_div[2] ;
 wire \r_uart_div[3] ;
 wire \r_uart_div[4] ;
 wire \r_uart_div[5] ;
 wire \r_uart_div[6] ;
 wire \r_uart_div[7] ;
 wire \r_uart_div[8] ;
 wire \r_uart_div[9] ;
 wire \r_uart_en_rx_sync[0] ;
 wire \r_uart_en_rx_sync[1] ;
 wire \r_uart_en_rx_sync[2] ;
 wire \r_uart_en_tx_sync[0] ;
 wire \r_uart_en_tx_sync[1] ;
 wire \r_uart_en_tx_sync[2] ;
 wire r_uart_parity_en;
 wire r_uart_stop_bits;
 wire \s_data_rx_dc[0] ;
 wire \s_data_rx_dc[1] ;
 wire \s_data_rx_dc[2] ;
 wire \s_data_rx_dc[3] ;
 wire \s_data_rx_dc[4] ;
 wire \s_data_rx_dc[5] ;
 wire \s_data_rx_dc[6] ;
 wire \s_data_rx_dc[7] ;
 wire \s_uart_bits[0] ;
 wire \s_uart_bits[1] ;
 wire \s_uart_div[0] ;
 wire \s_uart_div[10] ;
 wire \s_uart_div[11] ;
 wire \s_uart_div[12] ;
 wire \s_uart_div[13] ;
 wire \s_uart_div[14] ;
 wire \s_uart_div[15] ;
 wire \s_uart_div[1] ;
 wire \s_uart_div[2] ;
 wire \s_uart_div[3] ;
 wire \s_uart_div[4] ;
 wire \s_uart_div[5] ;
 wire \s_uart_div[6] ;
 wire \s_uart_div[7] ;
 wire \s_uart_div[8] ;
 wire \s_uart_div[9] ;
 wire s_uart_en_rx;
 wire s_uart_en_tx;
 wire s_uart_err_irq_en;
 wire s_uart_parity_en;
 wire s_uart_rx_clean_fifo;
 wire s_uart_rx_irq_en;
 wire s_uart_rx_polling_en;
 wire s_uart_stop_bits;
 wire \u_dc_fifo_rx.dst_rstn_i ;
 wire \u_dc_fifo_rx.u_din.buffer.data[0] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[10] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[11] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[12] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[13] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[14] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[15] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[16] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[17] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[18] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[19] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[1] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[20] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[21] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[22] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[23] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[24] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[25] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[26] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[27] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[28] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[29] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[2] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[30] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[31] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[3] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[4] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[5] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[6] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[7] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[8] ;
 wire \u_dc_fifo_rx.u_din.buffer.data[9] ;
 wire \u_dc_fifo_rx.u_din.full.full_synch.d_in[0] ;
 wire \u_dc_fifo_rx.u_din.full.full_synch.d_middle[0] ;
 wire \u_dc_fifo_rx.u_din.full.full_synch.d_out[0] ;
 wire \u_dc_fifo_rx.u_din.full.latched_full_s ;
 wire \u_dc_fifo_rx.u_din.write_token[0] ;
 wire \u_dc_fifo_rx.u_din.write_token[1] ;
 wire \u_dc_fifo_rx.u_din.write_token[2] ;
 wire \u_dc_fifo_rx.u_din.write_token[3] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_middle[0] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_middle[1] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_middle[2] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_middle[3] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_out[0] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_out[1] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_out[2] ;
 wire \u_dc_fifo_rx.u_dout.empty_synch.d_out[3] ;
 wire \u_dc_fifo_rx.u_dout.read_token[0] ;
 wire \u_dc_fifo_rx.u_dout.read_token[1] ;
 wire \u_dc_fifo_rx.u_dout.read_token[2] ;
 wire \u_dc_fifo_rx.u_dout.read_token[3] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[0] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[10] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[11] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[12] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[13] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[14] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[15] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[16] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[17] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[18] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[19] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[1] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[20] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[21] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[22] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[23] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[24] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[25] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[26] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[27] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[28] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[29] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[2] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[30] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[31] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[3] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[4] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[5] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[6] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[7] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[8] ;
 wire \u_dc_fifo_tx.u_din.buffer.data[9] ;
 wire \u_dc_fifo_tx.u_din.full.full_synch.d_in[0] ;
 wire \u_dc_fifo_tx.u_din.full.full_synch.d_middle[0] ;
 wire \u_dc_fifo_tx.u_din.full.full_synch.d_out[0] ;
 wire \u_dc_fifo_tx.u_din.full.latched_full_s ;
 wire \u_dc_fifo_tx.u_din.write_token[0] ;
 wire \u_dc_fifo_tx.u_din.write_token[1] ;
 wire \u_dc_fifo_tx.u_din.write_token[2] ;
 wire \u_dc_fifo_tx.u_din.write_token[3] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_middle[0] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_middle[1] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_middle[2] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_middle[3] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_out[0] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_out[1] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_out[2] ;
 wire \u_dc_fifo_tx.u_dout.empty_synch.d_out[3] ;
 wire \u_dc_fifo_tx.u_dout.read_token[0] ;
 wire \u_dc_fifo_tx.u_dout.read_token[1] ;
 wire \u_dc_fifo_tx.u_dout.read_token[2] ;
 wire \u_dc_fifo_tx.u_dout.read_token[3] ;
 wire \u_fifo.i_fifo.buffer[0][0] ;
 wire \u_fifo.i_fifo.buffer[0][1] ;
 wire \u_fifo.i_fifo.buffer[0][2] ;
 wire \u_fifo.i_fifo.buffer[0][3] ;
 wire \u_fifo.i_fifo.buffer[0][4] ;
 wire \u_fifo.i_fifo.buffer[0][5] ;
 wire \u_fifo.i_fifo.buffer[0][6] ;
 wire \u_fifo.i_fifo.buffer[0][7] ;
 wire \u_fifo.i_fifo.buffer[1][0] ;
 wire \u_fifo.i_fifo.buffer[1][1] ;
 wire \u_fifo.i_fifo.buffer[1][2] ;
 wire \u_fifo.i_fifo.buffer[1][3] ;
 wire \u_fifo.i_fifo.buffer[1][4] ;
 wire \u_fifo.i_fifo.buffer[1][5] ;
 wire \u_fifo.i_fifo.buffer[1][6] ;
 wire \u_fifo.i_fifo.buffer[1][7] ;
 wire \u_fifo.i_fifo.elements[0] ;
 wire \u_fifo.i_fifo.elements[1] ;
 wire \u_fifo.i_fifo.pointer_in[0] ;
 wire \u_fifo.i_fifo.pointer_out[0] ;
 wire \u_fifo.r_inflight[0] ;
 wire \u_fifo.r_inflight[1] ;
 wire \u_reg_if.r_err_overflow ;
 wire \u_reg_if.r_err_parity ;
 wire \u_reg_if.r_uart_rx_data[0] ;
 wire \u_reg_if.r_uart_rx_data[1] ;
 wire \u_reg_if.r_uart_rx_data[2] ;
 wire \u_reg_if.r_uart_rx_data[3] ;
 wire \u_reg_if.r_uart_rx_data[4] ;
 wire \u_reg_if.r_uart_rx_data[5] ;
 wire \u_reg_if.r_uart_rx_data[6] ;
 wire \u_reg_if.r_uart_rx_data[7] ;
 wire \u_reg_if.r_uart_rx_data_valid ;
 wire \u_uart_rx.CS[0] ;
 wire \u_uart_rx.CS[1] ;
 wire \u_uart_rx.CS[2] ;
 wire \u_uart_rx.baud_cnt[0] ;
 wire \u_uart_rx.baud_cnt[10] ;
 wire \u_uart_rx.baud_cnt[11] ;
 wire \u_uart_rx.baud_cnt[12] ;
 wire \u_uart_rx.baud_cnt[13] ;
 wire \u_uart_rx.baud_cnt[14] ;
 wire \u_uart_rx.baud_cnt[15] ;
 wire \u_uart_rx.baud_cnt[1] ;
 wire \u_uart_rx.baud_cnt[2] ;
 wire \u_uart_rx.baud_cnt[3] ;
 wire \u_uart_rx.baud_cnt[4] ;
 wire \u_uart_rx.baud_cnt[5] ;
 wire \u_uart_rx.baud_cnt[6] ;
 wire \u_uart_rx.baud_cnt[7] ;
 wire \u_uart_rx.baud_cnt[8] ;
 wire \u_uart_rx.baud_cnt[9] ;
 wire \u_uart_rx.bit_done ;
 wire \u_uart_rx.busy_o ;
 wire \u_uart_rx.parity_bit ;
 wire \u_uart_rx.r_error_parity ;
 wire \u_uart_rx.reg_bit_count[0] ;
 wire \u_uart_rx.reg_bit_count[1] ;
 wire \u_uart_rx.reg_bit_count[2] ;
 wire \u_uart_rx.reg_rx_sync[0] ;
 wire \u_uart_rx.reg_rx_sync[1] ;
 wire \u_uart_rx.reg_rx_sync[2] ;
 wire \u_uart_tx.CS[0] ;
 wire \u_uart_tx.CS[1] ;
 wire \u_uart_tx.CS[2] ;
 wire \u_uart_tx.baud_cnt[0] ;
 wire \u_uart_tx.baud_cnt[10] ;
 wire \u_uart_tx.baud_cnt[11] ;
 wire \u_uart_tx.baud_cnt[12] ;
 wire \u_uart_tx.baud_cnt[13] ;
 wire \u_uart_tx.baud_cnt[14] ;
 wire \u_uart_tx.baud_cnt[15] ;
 wire \u_uart_tx.baud_cnt[1] ;
 wire \u_uart_tx.baud_cnt[2] ;
 wire \u_uart_tx.baud_cnt[3] ;
 wire \u_uart_tx.baud_cnt[4] ;
 wire \u_uart_tx.baud_cnt[5] ;
 wire \u_uart_tx.baud_cnt[6] ;
 wire \u_uart_tx.baud_cnt[7] ;
 wire \u_uart_tx.baud_cnt[8] ;
 wire \u_uart_tx.baud_cnt[9] ;
 wire \u_uart_tx.bit_done ;
 wire \u_uart_tx.busy_o ;
 wire \u_uart_tx.parity_bit ;
 wire \u_uart_tx.reg_bit_count[0] ;
 wire \u_uart_tx.reg_bit_count[1] ;
 wire \u_uart_tx.reg_bit_count[2] ;
 wire \u_uart_tx.reg_data[0] ;
 wire \u_uart_tx.reg_data[1] ;
 wire \u_uart_tx.reg_data[2] ;
 wire \u_uart_tx.reg_data[3] ;
 wire \u_uart_tx.reg_data[4] ;
 wire \u_uart_tx.reg_data[5] ;
 wire \u_uart_tx.reg_data[6] ;
 wire \u_uart_tx.reg_data[7] ;

 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0901_ (.I(\u_fifo.i_fifo.elements[0] ),
    .ZN(_0692_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0902_ (.I(\i_ep_err_overflow.i_sync_clkb.serial_o ),
    .ZN(_0693_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0903_ (.I(\i_ep_err_parity.i_sync_clkb.serial_o ),
    .ZN(_0694_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0904_ (.I(rstn_i),
    .ZN(_0695_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0905_ (.I(cfg_valid_i),
    .ZN(_0696_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0906_ (.I(cfg_addr_i[2]),
    .ZN(_0697_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0907_ (.I(cfg_addr_i[3]),
    .ZN(_0698_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0908_ (.I(\u_dc_fifo_rx.u_dout.empty_synch.d_out[0] ),
    .ZN(_0699_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0909_ (.I(\u_dc_fifo_rx.u_dout.empty_synch.d_out[2] ),
    .ZN(_0700_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0910_ (.I(\u_fifo.i_fifo.elements[1] ),
    .ZN(_0701_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0911_ (.I(\u_dc_fifo_tx.u_dout.empty_synch.d_out[0] ),
    .ZN(_0702_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0912_ (.I(\u_dc_fifo_tx.u_dout.empty_synch.d_out[1] ),
    .ZN(_0703_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0913_ (.I(\u_dc_fifo_tx.u_dout.empty_synch.d_out[3] ),
    .ZN(_0704_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0914_ (.I(\u_uart_tx.CS[2] ),
    .ZN(_0705_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0915_ (.I(\r_uart_en_tx_sync[2] ),
    .ZN(_0706_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0916_ (.I(\r_uart_div[0] ),
    .ZN(_0707_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0917_ (.I(\r_uart_div[1] ),
    .ZN(_0708_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0918_ (.I(\r_uart_div[2] ),
    .ZN(_0709_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0919_ (.I(\r_uart_div[3] ),
    .ZN(_0710_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0920_ (.I(\r_uart_div[4] ),
    .ZN(_0711_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0921_ (.I(\r_uart_div[5] ),
    .ZN(_0712_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0922_ (.I(\r_uart_div[6] ),
    .ZN(_0713_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0923_ (.I(\r_uart_div[8] ),
    .ZN(_0714_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0924_ (.I(\r_uart_div[9] ),
    .ZN(_0715_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0925_ (.I(\r_uart_div[10] ),
    .ZN(_0716_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0926_ (.I(\r_uart_div[12] ),
    .ZN(_0717_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0927_ (.I(\r_uart_div[13] ),
    .ZN(_0718_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0928_ (.I(\r_uart_div[15] ),
    .ZN(_0719_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0929_ (.I(\u_uart_rx.CS[0] ),
    .ZN(_0720_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0930_ (.I(\u_uart_rx.CS[1] ),
    .ZN(_0721_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0931_ (.I(\u_uart_rx.CS[2] ),
    .ZN(_0722_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0932_ (.I(\u_uart_rx.reg_rx_sync[1] ),
    .ZN(_0723_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0933_ (.I(\u_uart_rx.baud_cnt[0] ),
    .ZN(_0724_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0934_ (.I(\u_uart_rx.baud_cnt[1] ),
    .ZN(_0725_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0935_ (.I(\u_uart_rx.baud_cnt[2] ),
    .ZN(_0726_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0936_ (.I(\u_uart_rx.baud_cnt[3] ),
    .ZN(_0727_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0937_ (.I(\u_uart_rx.baud_cnt[4] ),
    .ZN(_0728_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0938_ (.I(\u_uart_rx.baud_cnt[5] ),
    .ZN(_0729_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0939_ (.I(\u_uart_rx.baud_cnt[6] ),
    .ZN(_0730_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0940_ (.I(\u_uart_rx.baud_cnt[7] ),
    .ZN(_0731_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0941_ (.I(\u_uart_rx.baud_cnt[8] ),
    .ZN(_0732_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0942_ (.I(\u_uart_rx.baud_cnt[9] ),
    .ZN(_0733_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0943_ (.I(\u_uart_rx.baud_cnt[11] ),
    .ZN(_0734_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0944_ (.I(\u_uart_rx.baud_cnt[12] ),
    .ZN(_0735_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0945_ (.I(\u_uart_rx.baud_cnt[13] ),
    .ZN(_0736_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0946_ (.I(\u_uart_rx.baud_cnt[14] ),
    .ZN(_0737_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0947_ (.I(\u_uart_rx.baud_cnt[15] ),
    .ZN(_0738_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0948_ (.I(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.serial_i ),
    .ZN(_0739_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0949_ (.I(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.serial_i ),
    .ZN(_0740_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0950_ (.I(\i_ep_event.i_sync_clkb.i_pulp_sync.serial_i ),
    .ZN(_0741_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0951_ (.I(\r_uart_en_rx_sync[2] ),
    .ZN(_0742_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0952_ (.I(\r_uart_bits[0] ),
    .ZN(_0743_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0953_ (.I(\r_uart_bits[1] ),
    .ZN(_0744_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0954_ (.I(\u_uart_rx.reg_bit_count[0] ),
    .ZN(_0745_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0955_ (.I(\u_uart_rx.reg_bit_count[1] ),
    .ZN(_0746_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0956_ (.I(\u_uart_tx.reg_bit_count[0] ),
    .ZN(_0747_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0957_ (.I(\u_uart_tx.reg_bit_count[1] ),
    .ZN(_0748_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0958_ (.I(\u_uart_tx.reg_bit_count[2] ),
    .ZN(_0749_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0959_ (.I(r_uart_parity_en),
    .ZN(_0750_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0960_ (.A1(_0693_),
    .A2(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.r_reg[1] ),
    .ZN(_0751_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0961_ (.A1(_0694_),
    .A2(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.r_reg[1] ),
    .ZN(_0752_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0962_ (.A1(_0751_),
    .A2(_0752_),
    .ZN(_0753_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _0963_ (.A1(_0753_),
    .A2(s_uart_err_irq_en),
    .Z(err_event_o));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0964_ (.A1(\i_ep_event.i_sync_clkb.i_pulp_sync.r_reg[1] ),
    .A2(s_uart_rx_irq_en),
    .ZN(_0754_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _0965_ (.A1(_0754_),
    .A2(s_uart_rx_polling_en),
    .A3(\i_ep_event.i_sync_clkb.serial_o ),
    .ZN(rx_char_event_o));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0966_ (.A1(_0695_),
    .A2(s_uart_rx_clean_fifo),
    .ZN(\u_dc_fifo_rx.dst_rstn_i ));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0967_ (.A1(cfg_addr_i[0]),
    .A2(cfg_addr_i[4]),
    .ZN(_0755_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _0968_ (.A1(cfg_addr_i[1]),
    .A2(_0755_),
    .Z(_0756_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0969_ (.A1(cfg_addr_i[2]),
    .A2(cfg_addr_i[3]),
    .ZN(_0757_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0970_ (.A1(_0696_),
    .A2(cfg_rwn_i),
    .ZN(_0758_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0971_ (.A1(cfg_addr_i[1]),
    .A2(_0755_),
    .A3(_0757_),
    .A4(_0758_),
    .ZN(_0759_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _0972_ (.A1(cfg_data_i[4]),
    .A2(_0756_),
    .A3(_0757_),
    .A4(_0758_),
    .Z(_0003_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _0973_ (.A1(cfg_data_i[6]),
    .A2(_0756_),
    .A3(_0757_),
    .A4(_0758_),
    .Z(_0002_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _0974_ (.A1(_0696_),
    .A2(_0697_),
    .A3(cfg_addr_i[3]),
    .A4(cfg_rwn_i),
    .ZN(_0760_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0975_ (.A1(cfg_addr_i[2]),
    .A2(_0758_),
    .A3(_0698_),
    .ZN(_0761_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0976_ (.A1(cfg_addr_i[2]),
    .A2(_0756_),
    .A3(_0758_),
    .A4(_0698_),
    .ZN(_0762_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _0977_ (.A1(cfg_data_i[4]),
    .A2(cfg_addr_i[1]),
    .A3(_0755_),
    .A4(_0760_),
    .Z(_0005_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _0978_ (.A1(cfg_addr_i[1]),
    .A2(cfg_data_i[6]),
    .A3(_0755_),
    .A4(_0760_),
    .Z(_0004_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0979_ (.A1(_0697_),
    .A2(cfg_addr_i[3]),
    .ZN(_0763_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _0980_ (.A1(_0696_),
    .A2(cfg_addr_i[1]),
    .A3(cfg_rwn_i),
    .ZN(_0764_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0981_ (.A1(cfg_addr_i[0]),
    .A2(_0764_),
    .ZN(_0765_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _0982_ (.A1(_0696_),
    .A2(_0763_),
    .A3(cfg_addr_i[4]),
    .A4(cfg_rwn_i),
    .ZN(_0766_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _0983_ (.A1(cfg_addr_i[0]),
    .A2(cfg_data_i[5]),
    .A3(_0764_),
    .A4(_0766_),
    .Z(_0006_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0984_ (.A1(\u_dc_fifo_rx.u_dout.read_token[1] ),
    .A2(\u_dc_fifo_rx.u_dout.read_token[2] ),
    .ZN(_0767_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0985_ (.A1(_0700_),
    .A2(\u_dc_fifo_rx.u_dout.read_token[1] ),
    .A3(\u_dc_fifo_rx.u_dout.empty_synch.d_out[3] ),
    .A4(\u_dc_fifo_rx.u_dout.read_token[2] ),
    .ZN(_0768_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0986_ (.A1(_0700_),
    .A2(\u_dc_fifo_rx.u_dout.empty_synch.d_out[1] ),
    .ZN(_0769_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0987_ (.A1(\u_dc_fifo_rx.u_dout.read_token[0] ),
    .A2(\u_dc_fifo_rx.u_dout.read_token[1] ),
    .A3(_0769_),
    .ZN(_0770_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0988_ (.A1(_0699_),
    .A2(\u_dc_fifo_rx.u_dout.empty_synch.d_out[1] ),
    .A3(\u_dc_fifo_rx.u_dout.read_token[0] ),
    .A4(\u_dc_fifo_rx.u_dout.read_token[3] ),
    .ZN(_0771_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0989_ (.A1(\u_dc_fifo_rx.u_dout.read_token[3] ),
    .A2(\u_dc_fifo_rx.u_dout.read_token[2] ),
    .ZN(_0772_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _0990_ (.A1(_0699_),
    .A2(_0772_),
    .A3(\u_dc_fifo_rx.u_dout.empty_synch.d_out[3] ),
    .Z(_0773_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0991_ (.A1(_0768_),
    .A2(_0770_),
    .A3(_0771_),
    .A4(_0773_),
    .ZN(_0774_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0992_ (.I(_0774_),
    .ZN(data_rx_valid_o));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0993_ (.A1(_0692_),
    .A2(\u_fifo.i_fifo.elements[1] ),
    .ZN(data_tx_ready_o));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _0994_ (.A1(\u_fifo.i_fifo.elements[0] ),
    .A2(\u_fifo.i_fifo.elements[1] ),
    .Z(_0775_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0995_ (.A1(_0701_),
    .A2(\u_fifo.r_inflight[1] ),
    .A3(\u_fifo.r_inflight[0] ),
    .ZN(_0776_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _0996_ (.A1(\u_fifo.r_inflight[1] ),
    .A2(_0775_),
    .B1(\u_fifo.r_inflight[0] ),
    .B2(_0692_),
    .C(_0776_),
    .ZN(data_tx_req_o));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _0997_ (.A1(\u_fifo.i_fifo.elements[0] ),
    .A2(\u_fifo.i_fifo.elements[1] ),
    .A3(\u_dc_fifo_tx.u_din.full.full_synch.d_out[0] ),
    .Z(_0001_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0998_ (.A1(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .ZN(_0777_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0999_ (.A1(\u_dc_fifo_tx.u_din.write_token[1] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[0] ),
    .ZN(_0778_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1000_ (.A1(\u_dc_fifo_tx.u_din.write_token[2] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[3] ),
    .Z(_0779_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1001_ (.A1(\u_dc_fifo_tx.u_din.write_token[2] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[3] ),
    .ZN(_0780_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1002_ (.A1(\u_dc_fifo_tx.u_din.write_token[2] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[1] ),
    .Z(_0781_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1003_ (.A1(\u_dc_fifo_tx.u_din.write_token[1] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[3] ),
    .B(\u_dc_fifo_tx.u_din.write_token[2] ),
    .ZN(_0782_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1004_ (.A1(\u_dc_fifo_tx.u_din.write_token[2] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[3] ),
    .B1(\u_dc_fifo_tx.u_din.write_token[0] ),
    .B2(\u_dc_fifo_tx.u_din.write_token[1] ),
    .ZN(_0783_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1005_ (.A1(_0778_),
    .A2(_0780_),
    .ZN(_0784_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1006_ (.A1(_0784_),
    .A2(_0781_),
    .B(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .C(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .ZN(_0785_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1007_ (.A1(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .ZN(_0786_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1008_ (.A1(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .ZN(_0787_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1009_ (.A1(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .ZN(_0788_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1010_ (.A1(_0787_),
    .A2(_0788_),
    .ZN(_0789_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1011_ (.A1(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .B1(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .B2(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .ZN(_0790_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1012_ (.A1(_0786_),
    .A2(_0788_),
    .ZN(_0791_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1013_ (.A1(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .B(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .ZN(_0792_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1014_ (.A1(_0786_),
    .A2(_0787_),
    .ZN(_0793_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1015_ (.A1(\u_dc_fifo_tx.u_din.write_token[3] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[0] ),
    .ZN(_0794_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1016_ (.A1(_0792_),
    .A2(_0788_),
    .B(_0794_),
    .ZN(_0795_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1017_ (.A1(_0779_),
    .A2(_0789_),
    .B1(_0791_),
    .B2(_0781_),
    .C(_0795_),
    .ZN(_0796_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1018_ (.A1(_0778_),
    .A2(_0792_),
    .B(_0796_),
    .C(_0785_),
    .ZN(\u_dc_fifo_tx.u_din.full.full_synch.d_in[0] ));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1019_ (.A1(\r_uart_div[10] ),
    .A2(\u_uart_tx.baud_cnt[10] ),
    .ZN(_0797_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1020_ (.A1(\r_uart_div[15] ),
    .A2(\u_uart_tx.baud_cnt[15] ),
    .Z(_0798_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1021_ (.A1(\r_uart_div[0] ),
    .A2(\u_uart_tx.baud_cnt[0] ),
    .Z(_0799_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1022_ (.A1(\r_uart_div[4] ),
    .A2(\u_uart_tx.baud_cnt[4] ),
    .Z(_0800_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1023_ (.A1(\r_uart_div[6] ),
    .A2(\u_uart_tx.baud_cnt[6] ),
    .Z(_0801_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1024_ (.A1(\r_uart_div[1] ),
    .A2(\u_uart_tx.baud_cnt[1] ),
    .ZN(_0802_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1025_ (.A1(\r_uart_div[5] ),
    .A2(\u_uart_tx.baud_cnt[5] ),
    .Z(_0803_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1026_ (.A1(\r_uart_div[3] ),
    .A2(\u_uart_tx.baud_cnt[3] ),
    .Z(_0804_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1027_ (.A1(\r_uart_div[12] ),
    .A2(\u_uart_tx.baud_cnt[12] ),
    .ZN(_0805_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1028_ (.A1(\r_uart_div[14] ),
    .A2(\u_uart_tx.baud_cnt[14] ),
    .Z(_0806_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1029_ (.A1(\r_uart_div[13] ),
    .A2(\u_uart_tx.baud_cnt[13] ),
    .Z(_0807_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1030_ (.A1(\r_uart_div[7] ),
    .A2(\u_uart_tx.baud_cnt[7] ),
    .Z(_0808_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1031_ (.A1(\r_uart_div[2] ),
    .A2(\u_uart_tx.baud_cnt[2] ),
    .ZN(_0809_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1032_ (.A1(\r_uart_div[9] ),
    .A2(\u_uart_tx.baud_cnt[9] ),
    .Z(_0810_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1033_ (.A1(\r_uart_div[8] ),
    .A2(\u_uart_tx.baud_cnt[8] ),
    .Z(_0811_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1034_ (.A1(_0798_),
    .A2(_0804_),
    .A3(_0810_),
    .A4(_0811_),
    .ZN(_0812_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1035_ (.A1(_0799_),
    .A2(_0800_),
    .A3(_0801_),
    .A4(_0806_),
    .ZN(_0813_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1036_ (.A1(\r_uart_div[11] ),
    .A2(\u_uart_tx.baud_cnt[11] ),
    .Z(_0814_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1037_ (.A1(_0803_),
    .A2(_0807_),
    .A3(_0808_),
    .A4(_0814_),
    .ZN(_0815_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1038_ (.A1(_0797_),
    .A2(_0802_),
    .A3(_0805_),
    .A4(_0809_),
    .Z(_0816_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1039_ (.A1(_0812_),
    .A2(_0813_),
    .A3(_0815_),
    .A4(_0816_),
    .ZN(_0817_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1040_ (.A1(\u_uart_tx.CS[2] ),
    .A2(\u_uart_tx.CS[0] ),
    .ZN(_0818_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1041_ (.A1(\u_uart_tx.CS[0] ),
    .A2(\u_uart_tx.CS[1] ),
    .ZN(_0819_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1042_ (.A1(\u_uart_tx.CS[2] ),
    .A2(\u_uart_tx.CS[0] ),
    .A3(\u_uart_tx.CS[1] ),
    .ZN(_0820_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1043_ (.I(_0820_),
    .ZN(\u_uart_tx.busy_o ));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1044_ (.A1(\u_uart_tx.CS[2] ),
    .A2(\u_uart_tx.CS[1] ),
    .B(_0820_),
    .ZN(_0821_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1045_ (.A1(\u_uart_tx.CS[2] ),
    .A2(\u_uart_tx.CS[1] ),
    .B(_0817_),
    .C(_0820_),
    .ZN(_0043_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1046_ (.A1(_0720_),
    .A2(_0721_),
    .A3(\u_uart_rx.CS[2] ),
    .ZN(_0822_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1047_ (.A1(_0720_),
    .A2(_0721_),
    .A3(\u_uart_rx.CS[2] ),
    .A4(\u_uart_rx.bit_done ),
    .ZN(_0823_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1048_ (.A1(_0823_),
    .A2(\u_uart_rx.r_error_parity ),
    .ZN(_0824_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1049_ (.A1(\u_dc_fifo_rx.u_din.full.full_synch.d_out[0] ),
    .A2(_0824_),
    .Z(_0000_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1050_ (.A1(\u_dc_fifo_rx.u_din.write_token[2] ),
    .A2(\u_dc_fifo_rx.u_din.write_token[1] ),
    .ZN(_0825_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1051_ (.A1(\u_dc_fifo_rx.u_dout.read_token[0] ),
    .A2(\u_dc_fifo_rx.u_dout.read_token[1] ),
    .B1(\u_dc_fifo_rx.u_dout.read_token[2] ),
    .B2(\u_dc_fifo_rx.u_dout.read_token[3] ),
    .ZN(_0826_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1052_ (.A1(\u_dc_fifo_rx.u_din.write_token[2] ),
    .A2(\u_dc_fifo_rx.u_din.write_token[3] ),
    .ZN(_0827_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1053_ (.A1(\u_dc_fifo_rx.u_dout.read_token[0] ),
    .A2(\u_dc_fifo_rx.u_dout.read_token[2] ),
    .B(\u_dc_fifo_rx.u_dout.read_token[3] ),
    .ZN(_0828_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1054_ (.A1(\u_dc_fifo_rx.u_din.write_token[1] ),
    .A2(\u_dc_fifo_rx.u_din.write_token[0] ),
    .Z(_0829_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1055_ (.A1(\u_dc_fifo_rx.u_din.write_token[1] ),
    .A2(\u_dc_fifo_rx.u_din.write_token[0] ),
    .ZN(_0830_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1056_ (.A1(\u_dc_fifo_rx.u_dout.read_token[3] ),
    .A2(\u_dc_fifo_rx.u_dout.read_token[1] ),
    .B(\u_dc_fifo_rx.u_dout.read_token[0] ),
    .ZN(_0831_));
 gf180mcu_fd_sc_mcu7t5v0__oai222_1 _1057_ (.A1(_0825_),
    .A2(_0826_),
    .B1(_0827_),
    .B2(_0828_),
    .C1(_0830_),
    .C2(_0831_),
    .ZN(_0832_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1058_ (.A1(\u_dc_fifo_rx.u_din.write_token[1] ),
    .A2(\u_dc_fifo_rx.u_din.write_token[3] ),
    .B(\u_dc_fifo_rx.u_din.write_token[2] ),
    .ZN(_0833_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1059_ (.A1(_0833_),
    .A2(_0830_),
    .B(_0767_),
    .ZN(_0834_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1060_ (.A1(\u_dc_fifo_rx.u_din.write_token[3] ),
    .A2(\u_dc_fifo_rx.u_din.write_token[0] ),
    .ZN(_0835_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1061_ (.A1(_0831_),
    .A2(_0772_),
    .B(_0835_),
    .ZN(_0836_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _1062_ (.A1(_0832_),
    .A2(_0834_),
    .A3(_0836_),
    .Z(\u_dc_fifo_rx.u_din.full.full_synch.d_in[0] ));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1063_ (.A1(\u_uart_rx.CS[0] ),
    .A2(\u_uart_rx.CS[1] ),
    .A3(\u_uart_rx.CS[2] ),
    .ZN(_0837_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1064_ (.I(_0837_),
    .ZN(\u_uart_rx.busy_o ));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1065_ (.A1(\r_uart_div[11] ),
    .A2(\u_uart_rx.baud_cnt[11] ),
    .Z(_0838_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1066_ (.A1(\r_uart_div[11] ),
    .A2(\u_uart_rx.baud_cnt[11] ),
    .ZN(_0839_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1067_ (.A1(_0838_),
    .A2(_0839_),
    .ZN(_0840_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1068_ (.A1(\r_uart_div[14] ),
    .A2(\u_uart_rx.baud_cnt[14] ),
    .Z(_0841_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1069_ (.A1(\r_uart_div[14] ),
    .A2(\u_uart_rx.baud_cnt[14] ),
    .ZN(_0842_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1070_ (.A1(_0841_),
    .A2(_0842_),
    .ZN(_0843_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1071_ (.A1(\r_uart_div[3] ),
    .A2(\u_uart_rx.baud_cnt[3] ),
    .ZN(_0844_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1072_ (.A1(\r_uart_div[3] ),
    .A2(\u_uart_rx.baud_cnt[3] ),
    .Z(_0845_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1073_ (.A1(_0844_),
    .A2(_0845_),
    .ZN(_0846_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1074_ (.A1(_0711_),
    .A2(\u_uart_rx.baud_cnt[4] ),
    .B1(_0719_),
    .B2(\u_uart_rx.baud_cnt[15] ),
    .ZN(_0847_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1075_ (.A1(_0840_),
    .A2(_0843_),
    .A3(_0846_),
    .A4(_0847_),
    .ZN(_0848_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1076_ (.A1(_0707_),
    .A2(\u_uart_rx.baud_cnt[0] ),
    .B1(_0708_),
    .B2(\u_uart_rx.baud_cnt[1] ),
    .ZN(_0849_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1077_ (.A1(\r_uart_div[0] ),
    .A2(_0724_),
    .B1(_0728_),
    .B2(\r_uart_div[4] ),
    .ZN(_0850_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1078_ (.A1(\r_uart_div[13] ),
    .A2(_0736_),
    .B1(_0738_),
    .B2(\r_uart_div[15] ),
    .ZN(_0851_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1079_ (.A1(_0718_),
    .A2(\u_uart_rx.baud_cnt[13] ),
    .B1(_0725_),
    .B2(\r_uart_div[1] ),
    .ZN(_0852_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1080_ (.A1(_0849_),
    .A2(_0850_),
    .A3(_0851_),
    .A4(_0852_),
    .ZN(_0853_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1081_ (.A1(_0848_),
    .A2(_0853_),
    .ZN(_0854_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1082_ (.A1(_0720_),
    .A2(\u_uart_rx.CS[1] ),
    .A3(\u_uart_rx.CS[2] ),
    .ZN(_0855_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1083_ (.A1(_0723_),
    .A2(\u_uart_rx.reg_rx_sync[2] ),
    .ZN(_0856_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1084_ (.A1(_0856_),
    .A2(\u_uart_rx.CS[2] ),
    .A3(\u_uart_rx.CS[1] ),
    .A4(\u_uart_rx.CS[0] ),
    .ZN(_0857_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1085_ (.A1(_0855_),
    .A2(_0857_),
    .ZN(_0858_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1086_ (.A1(_0720_),
    .A2(_0856_),
    .B(\u_uart_rx.CS[2] ),
    .C(\u_uart_rx.CS[1] ),
    .ZN(_0859_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1087_ (.A1(_0715_),
    .A2(_0733_),
    .ZN(_0860_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1088_ (.A1(\r_uart_div[9] ),
    .A2(\u_uart_rx.baud_cnt[9] ),
    .ZN(_0861_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1089_ (.A1(\r_uart_div[12] ),
    .A2(\u_uart_rx.baud_cnt[12] ),
    .Z(_0862_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1090_ (.A1(\r_uart_div[12] ),
    .A2(\u_uart_rx.baud_cnt[12] ),
    .ZN(_0863_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1091_ (.A1(_0860_),
    .A2(_0861_),
    .B1(_0862_),
    .B2(_0863_),
    .ZN(_0864_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1092_ (.A1(_0712_),
    .A2(_0729_),
    .ZN(_0865_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1093_ (.A1(\r_uart_div[5] ),
    .A2(\u_uart_rx.baud_cnt[5] ),
    .ZN(_0866_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1094_ (.A1(\r_uart_div[10] ),
    .A2(\u_uart_rx.baud_cnt[10] ),
    .ZN(_0867_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1095_ (.A1(\r_uart_div[10] ),
    .A2(\u_uart_rx.baud_cnt[10] ),
    .Z(_0868_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1096_ (.A1(_0865_),
    .A2(_0866_),
    .B1(_0867_),
    .B2(_0868_),
    .ZN(_0869_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1097_ (.A1(\r_uart_div[6] ),
    .A2(\u_uart_rx.baud_cnt[6] ),
    .ZN(_0870_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1098_ (.A1(\r_uart_div[6] ),
    .A2(\u_uart_rx.baud_cnt[6] ),
    .Z(_0871_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1099_ (.A1(\r_uart_div[8] ),
    .A2(\u_uart_rx.baud_cnt[8] ),
    .ZN(_0872_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1100_ (.A1(\r_uart_div[8] ),
    .A2(\u_uart_rx.baud_cnt[8] ),
    .Z(_0873_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1101_ (.A1(_0870_),
    .A2(_0871_),
    .B1(_0872_),
    .B2(_0873_),
    .ZN(_0874_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1102_ (.A1(\r_uart_div[7] ),
    .A2(\u_uart_rx.baud_cnt[7] ),
    .Z(_0875_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1103_ (.A1(\r_uart_div[7] ),
    .A2(\u_uart_rx.baud_cnt[7] ),
    .ZN(_0876_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1104_ (.A1(\r_uart_div[2] ),
    .A2(\u_uart_rx.baud_cnt[2] ),
    .Z(_0877_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1105_ (.A1(\r_uart_div[2] ),
    .A2(\u_uart_rx.baud_cnt[2] ),
    .ZN(_0878_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1106_ (.A1(_0875_),
    .A2(_0876_),
    .B1(_0877_),
    .B2(_0878_),
    .ZN(_0879_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1107_ (.A1(_0864_),
    .A2(_0869_),
    .A3(_0874_),
    .A4(_0879_),
    .Z(_0880_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1108_ (.A1(_0864_),
    .A2(_0869_),
    .A3(_0874_),
    .A4(_0879_),
    .ZN(_0881_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1109_ (.A1(_0859_),
    .A2(_0881_),
    .ZN(_0882_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1110_ (.A1(_0854_),
    .A2(_0858_),
    .A3(_0880_),
    .ZN(_0883_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1111_ (.A1(_0725_),
    .A2(\r_uart_div[2] ),
    .ZN(_0884_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1112_ (.A1(_0714_),
    .A2(\u_uart_rx.baud_cnt[7] ),
    .ZN(_0885_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1113_ (.A1(\r_uart_div[14] ),
    .A2(\u_uart_rx.baud_cnt[13] ),
    .ZN(_0886_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1114_ (.A1(\r_uart_div[14] ),
    .A2(\u_uart_rx.baud_cnt[13] ),
    .Z(_0887_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1115_ (.A1(\r_uart_div[1] ),
    .A2(\u_uart_rx.baud_cnt[0] ),
    .Z(_0888_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1116_ (.A1(_0718_),
    .A2(\u_uart_rx.baud_cnt[12] ),
    .ZN(_0889_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1117_ (.A1(_0713_),
    .A2(\u_uart_rx.baud_cnt[5] ),
    .ZN(_0890_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1118_ (.A1(_0735_),
    .A2(\r_uart_div[13] ),
    .ZN(_0891_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1119_ (.A1(\r_uart_div[7] ),
    .A2(\u_uart_rx.baud_cnt[6] ),
    .Z(_0892_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1120_ (.A1(\r_uart_div[7] ),
    .A2(\u_uart_rx.baud_cnt[6] ),
    .ZN(_0893_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1121_ (.A1(_0892_),
    .A2(_0893_),
    .Z(_0894_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1122_ (.A1(_0728_),
    .A2(\r_uart_div[5] ),
    .ZN(_0895_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1123_ (.A1(\r_uart_div[11] ),
    .A2(\u_uart_rx.baud_cnt[10] ),
    .ZN(_0896_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1124_ (.A1(\r_uart_div[11] ),
    .A2(\u_uart_rx.baud_cnt[10] ),
    .Z(_0897_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1125_ (.A1(_0727_),
    .A2(\r_uart_div[4] ),
    .B(\u_uart_rx.baud_cnt[15] ),
    .ZN(_0898_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _1126_ (.A1(_0886_),
    .A2(_0887_),
    .B1(_0896_),
    .B2(_0897_),
    .C(_0898_),
    .ZN(_0899_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1127_ (.A1(_0712_),
    .A2(\u_uart_rx.baud_cnt[4] ),
    .B1(_0719_),
    .B2(\u_uart_rx.baud_cnt[14] ),
    .ZN(_0900_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1128_ (.A1(\r_uart_div[2] ),
    .A2(_0725_),
    .B1(_0729_),
    .B2(\r_uart_div[6] ),
    .ZN(_0291_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1129_ (.A1(_0900_),
    .A2(_0291_),
    .A3(_0891_),
    .ZN(_0292_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1130_ (.A1(_0888_),
    .A2(_0899_),
    .A3(_0292_),
    .ZN(_0293_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1131_ (.A1(\r_uart_div[10] ),
    .A2(\u_uart_rx.baud_cnt[9] ),
    .ZN(_0294_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1132_ (.A1(\r_uart_div[10] ),
    .A2(\u_uart_rx.baud_cnt[9] ),
    .Z(_0295_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1133_ (.A1(_0294_),
    .A2(_0295_),
    .ZN(_0296_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1134_ (.A1(_0717_),
    .A2(\u_uart_rx.baud_cnt[11] ),
    .B1(_0726_),
    .B2(\r_uart_div[3] ),
    .ZN(_0297_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1135_ (.A1(_0710_),
    .A2(\u_uart_rx.baud_cnt[2] ),
    .B1(_0734_),
    .B2(\r_uart_div[12] ),
    .ZN(_0298_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1136_ (.A1(_0885_),
    .A2(_0296_),
    .A3(_0297_),
    .A4(_0298_),
    .ZN(_0299_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1137_ (.A1(\r_uart_div[8] ),
    .A2(_0731_),
    .B1(_0732_),
    .B2(\r_uart_div[9] ),
    .ZN(_0300_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1138_ (.A1(_0709_),
    .A2(\u_uart_rx.baud_cnt[1] ),
    .B1(_0715_),
    .B2(\u_uart_rx.baud_cnt[8] ),
    .ZN(_0301_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1139_ (.A1(_0300_),
    .A2(_0301_),
    .A3(_0890_),
    .A4(_0895_),
    .ZN(_0302_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1140_ (.A1(_0299_),
    .A2(_0302_),
    .ZN(_0303_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1141_ (.A1(_0711_),
    .A2(\u_uart_rx.baud_cnt[3] ),
    .B1(\u_uart_rx.baud_cnt[12] ),
    .B2(_0718_),
    .C1(_0737_),
    .C2(\r_uart_div[15] ),
    .ZN(_0304_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1142_ (.A1(_0859_),
    .A2(_0894_),
    .A3(_0304_),
    .Z(_0305_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1143_ (.A1(_0293_),
    .A2(_0303_),
    .A3(_0305_),
    .ZN(_0306_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _1144_ (.A1(_0711_),
    .A2(\u_uart_rx.baud_cnt[3] ),
    .B1(_0737_),
    .B2(\r_uart_div[15] ),
    .ZN(_0307_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1145_ (.A1(_0712_),
    .A2(\u_uart_rx.baud_cnt[4] ),
    .B1(_0729_),
    .B2(\r_uart_div[6] ),
    .ZN(_0308_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1146_ (.A1(_0711_),
    .A2(\u_uart_rx.baud_cnt[3] ),
    .B1(_0737_),
    .B2(\r_uart_div[15] ),
    .ZN(_0309_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1147_ (.A1(_0308_),
    .A2(_0309_),
    .A3(_0889_),
    .A4(_0891_),
    .ZN(_0310_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1148_ (.A1(_0708_),
    .A2(\u_uart_rx.baud_cnt[0] ),
    .B1(_0728_),
    .B2(\r_uart_div[5] ),
    .ZN(_0311_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1149_ (.A1(_0300_),
    .A2(_0301_),
    .A3(_0311_),
    .A4(_0884_),
    .ZN(_0312_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1150_ (.A1(_0307_),
    .A2(_0310_),
    .A3(_0312_),
    .ZN(_0313_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1151_ (.A1(_0713_),
    .A2(\u_uart_rx.baud_cnt[5] ),
    .B1(_0724_),
    .B2(\r_uart_div[1] ),
    .ZN(_0314_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1152_ (.A1(_0710_),
    .A2(\u_uart_rx.baud_cnt[2] ),
    .B1(_0733_),
    .B2(\r_uart_div[10] ),
    .ZN(_0315_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1153_ (.A1(_0716_),
    .A2(\u_uart_rx.baud_cnt[9] ),
    .B1(_0734_),
    .B2(\r_uart_div[12] ),
    .ZN(_0316_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1154_ (.A1(_0714_),
    .A2(\u_uart_rx.baud_cnt[7] ),
    .B1(_0726_),
    .B2(\r_uart_div[3] ),
    .ZN(_0317_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1155_ (.A1(_0314_),
    .A2(_0315_),
    .A3(_0316_),
    .A4(_0317_),
    .ZN(_0318_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1156_ (.A1(_0734_),
    .A2(\r_uart_div[12] ),
    .B(_0738_),
    .ZN(_0319_));
 gf180mcu_fd_sc_mcu7t5v0__oai222_1 _1157_ (.A1(_0886_),
    .A2(_0887_),
    .B1(_0892_),
    .B2(_0893_),
    .C1(_0896_),
    .C2(_0897_),
    .ZN(_0320_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1158_ (.A1(_0318_),
    .A2(_0319_),
    .A3(_0320_),
    .ZN(_0321_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1159_ (.A1(_0313_),
    .A2(_0321_),
    .A3(_0859_),
    .ZN(_0322_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1160_ (.A1(_0721_),
    .A2(\u_uart_rx.CS[2] ),
    .ZN(_0323_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1161_ (.A1(_0721_),
    .A2(\u_uart_rx.CS[2] ),
    .A3(\u_uart_rx.CS[0] ),
    .ZN(_0324_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1162_ (.A1(\u_uart_rx.CS[0] ),
    .A2(\u_uart_rx.CS[1] ),
    .B(_0722_),
    .ZN(_0325_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1163_ (.A1(\u_uart_rx.busy_o ),
    .A2(_0856_),
    .B(_0325_),
    .C(_0822_),
    .ZN(_0326_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1164_ (.I(_0326_),
    .ZN(_0327_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1165_ (.A1(_0883_),
    .A2(_0306_),
    .B(_0327_),
    .ZN(_0023_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1166_ (.A1(\u_dc_fifo_rx.u_din.full.full_synch.d_out[0] ),
    .A2(\u_dc_fifo_rx.u_din.full.latched_full_s ),
    .ZN(_0328_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _1167_ (.A1(_0823_),
    .A2(_0328_),
    .A3(\u_uart_rx.r_error_parity ),
    .B1(_0739_),
    .B2(\i_ep_err_overflow.sync_a[0] ),
    .ZN(\i_ep_err_overflow.s_input_reg_next ));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1168_ (.A1(\u_uart_rx.r_error_parity ),
    .A2(\u_uart_rx.bit_done ),
    .ZN(_0329_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _1169_ (.A1(_0822_),
    .A2(_0329_),
    .B1(_0740_),
    .B2(\i_ep_err_parity.sync_a[0] ),
    .ZN(\i_ep_err_parity.s_input_reg_next ));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1170_ (.A1(\u_dc_fifo_rx.u_din.full.full_synch.d_out[0] ),
    .A2(\u_dc_fifo_rx.u_din.full.latched_full_s ),
    .B(_0823_),
    .C(\u_uart_rx.r_error_parity ),
    .ZN(_0330_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1171_ (.A1(_0824_),
    .A2(_0328_),
    .ZN(_0331_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1172_ (.A1(_0741_),
    .A2(\i_ep_event.sync_a[0] ),
    .B(_0331_),
    .ZN(\i_ep_event.s_input_reg_next ));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1173_ (.A1(cfg_rwn_i),
    .A2(cfg_valid_i),
    .Z(_0332_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1174_ (.A1(cfg_rwn_i),
    .A2(cfg_valid_i),
    .ZN(_0333_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1175_ (.A1(_0333_),
    .A2(cfg_addr_i[2]),
    .A3(_0698_),
    .ZN(_0334_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1176_ (.A1(cfg_rwn_i),
    .A2(cfg_valid_i),
    .A3(cfg_addr_i[0]),
    .ZN(_0335_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1177_ (.A1(_0335_),
    .A2(cfg_addr_i[4]),
    .A3(cfg_addr_i[1]),
    .ZN(_0336_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1178_ (.A1(_0698_),
    .A2(_0335_),
    .A3(cfg_addr_i[4]),
    .A4(cfg_addr_i[2]),
    .ZN(_0337_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1179_ (.A1(_0336_),
    .A2(_0697_),
    .A3(cfg_addr_i[3]),
    .Z(_0338_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1180_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[0] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[16]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1181_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[1] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[17]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1182_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[2] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[18]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1183_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[3] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[19]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1184_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[4] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[20]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1185_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[5] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[21]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1186_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[6] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[22]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1187_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[7] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[23]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1188_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[8] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[24]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1189_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[9] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[25]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1190_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[10] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[26]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1191_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[11] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[27]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1192_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[12] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[28]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1193_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[13] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[29]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1194_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[14] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[30]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1195_ (.A1(cfg_addr_i[3]),
    .A2(\s_uart_div[15] ),
    .A3(_0336_),
    .A4(_0697_),
    .Z(cfg_data_o[31]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1196_ (.A1(_0817_),
    .A2(_0821_),
    .ZN(_0339_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1197_ (.A1(_0339_),
    .A2(\u_uart_tx.baud_cnt[0] ),
    .ZN(_0027_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1198_ (.A1(\u_uart_tx.baud_cnt[0] ),
    .A2(\u_uart_tx.baud_cnt[1] ),
    .ZN(_0340_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1199_ (.A1(\u_uart_tx.baud_cnt[0] ),
    .A2(\u_uart_tx.baud_cnt[1] ),
    .Z(_0341_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1200_ (.A1(_0339_),
    .A2(_0340_),
    .A3(_0341_),
    .ZN(_0034_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1201_ (.A1(\u_uart_tx.baud_cnt[0] ),
    .A2(\u_uart_tx.baud_cnt[1] ),
    .A3(\u_uart_tx.baud_cnt[2] ),
    .Z(_0342_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1202_ (.A1(\u_uart_tx.baud_cnt[0] ),
    .A2(\u_uart_tx.baud_cnt[1] ),
    .B(\u_uart_tx.baud_cnt[2] ),
    .ZN(_0343_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1203_ (.A1(_0339_),
    .A2(_0342_),
    .A3(_0343_),
    .ZN(_0035_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1204_ (.A1(\u_uart_tx.baud_cnt[2] ),
    .A2(_0341_),
    .B(\u_uart_tx.baud_cnt[3] ),
    .ZN(_0344_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1205_ (.A1(\u_uart_tx.baud_cnt[0] ),
    .A2(\u_uart_tx.baud_cnt[1] ),
    .A3(\u_uart_tx.baud_cnt[2] ),
    .A4(\u_uart_tx.baud_cnt[3] ),
    .Z(_0345_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1206_ (.A1(_0339_),
    .A2(_0344_),
    .A3(_0345_),
    .ZN(_0036_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1207_ (.A1(\u_uart_tx.baud_cnt[3] ),
    .A2(_0342_),
    .B(\u_uart_tx.baud_cnt[4] ),
    .ZN(_0346_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1208_ (.A1(\u_uart_tx.baud_cnt[2] ),
    .A2(\u_uart_tx.baud_cnt[3] ),
    .A3(\u_uart_tx.baud_cnt[4] ),
    .A4(_0341_),
    .Z(_0347_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1209_ (.A1(_0339_),
    .A2(_0346_),
    .A3(_0347_),
    .ZN(_0037_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1210_ (.A1(\u_uart_tx.baud_cnt[4] ),
    .A2(_0345_),
    .B(\u_uart_tx.baud_cnt[5] ),
    .ZN(_0348_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1211_ (.A1(\u_uart_tx.baud_cnt[3] ),
    .A2(\u_uart_tx.baud_cnt[4] ),
    .A3(\u_uart_tx.baud_cnt[5] ),
    .A4(_0342_),
    .Z(_0349_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1212_ (.A1(_0339_),
    .A2(_0348_),
    .A3(_0349_),
    .ZN(_0038_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1213_ (.A1(\u_uart_tx.baud_cnt[4] ),
    .A2(\u_uart_tx.baud_cnt[5] ),
    .A3(\u_uart_tx.baud_cnt[6] ),
    .A4(_0345_),
    .Z(_0350_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1214_ (.A1(\u_uart_tx.baud_cnt[5] ),
    .A2(_0347_),
    .B(\u_uart_tx.baud_cnt[6] ),
    .ZN(_0351_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1215_ (.A1(_0339_),
    .A2(_0350_),
    .A3(_0351_),
    .ZN(_0039_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1216_ (.A1(\u_uart_tx.baud_cnt[6] ),
    .A2(_0349_),
    .B(\u_uart_tx.baud_cnt[7] ),
    .ZN(_0352_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1217_ (.A1(\u_uart_tx.baud_cnt[6] ),
    .A2(\u_uart_tx.baud_cnt[7] ),
    .Z(_0353_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1218_ (.A1(\u_uart_tx.baud_cnt[4] ),
    .A2(\u_uart_tx.baud_cnt[5] ),
    .A3(_0345_),
    .A4(_0353_),
    .Z(_0354_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1219_ (.A1(\u_uart_tx.baud_cnt[4] ),
    .A2(\u_uart_tx.baud_cnt[5] ),
    .A3(_0345_),
    .A4(_0353_),
    .ZN(_0355_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1220_ (.A1(_0339_),
    .A2(_0352_),
    .A3(_0354_),
    .ZN(_0040_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1221_ (.A1(_0349_),
    .A2(_0353_),
    .B(\u_uart_tx.baud_cnt[8] ),
    .ZN(_0356_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1222_ (.A1(\u_uart_tx.baud_cnt[5] ),
    .A2(\u_uart_tx.baud_cnt[8] ),
    .A3(_0347_),
    .A4(_0353_),
    .Z(_0357_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1223_ (.A1(_0339_),
    .A2(_0356_),
    .A3(_0357_),
    .ZN(_0041_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1224_ (.A1(\u_uart_tx.baud_cnt[8] ),
    .A2(_0354_),
    .B(\u_uart_tx.baud_cnt[9] ),
    .ZN(_0358_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1225_ (.A1(\u_uart_tx.baud_cnt[8] ),
    .A2(\u_uart_tx.baud_cnt[9] ),
    .ZN(_0359_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1226_ (.A1(\u_uart_tx.baud_cnt[8] ),
    .A2(\u_uart_tx.baud_cnt[9] ),
    .A3(_0349_),
    .A4(_0353_),
    .Z(_0360_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1227_ (.A1(_0339_),
    .A2(_0358_),
    .A3(_0360_),
    .ZN(_0042_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1228_ (.A1(\u_uart_tx.baud_cnt[10] ),
    .A2(_0360_),
    .ZN(_0361_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1229_ (.A1(\u_uart_tx.baud_cnt[8] ),
    .A2(\u_uart_tx.baud_cnt[9] ),
    .A3(\u_uart_tx.baud_cnt[10] ),
    .A4(_0354_),
    .Z(_0362_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1230_ (.A1(_0339_),
    .A2(_0361_),
    .A3(_0362_),
    .ZN(_0028_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1231_ (.A1(\u_uart_tx.baud_cnt[10] ),
    .A2(_0360_),
    .B(\u_uart_tx.baud_cnt[11] ),
    .ZN(_0363_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1232_ (.A1(\u_uart_tx.baud_cnt[10] ),
    .A2(\u_uart_tx.baud_cnt[11] ),
    .ZN(_0364_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1233_ (.A1(_0355_),
    .A2(_0359_),
    .A3(_0364_),
    .ZN(_0365_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1234_ (.A1(_0339_),
    .A2(_0363_),
    .A3(_0365_),
    .ZN(_0029_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1235_ (.A1(\u_uart_tx.baud_cnt[12] ),
    .A2(_0365_),
    .ZN(_0366_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1236_ (.A1(\u_uart_tx.baud_cnt[10] ),
    .A2(\u_uart_tx.baud_cnt[11] ),
    .A3(\u_uart_tx.baud_cnt[12] ),
    .A4(_0360_),
    .Z(_0367_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1237_ (.A1(_0339_),
    .A2(_0366_),
    .A3(_0367_),
    .ZN(_0030_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1238_ (.A1(\u_uart_tx.baud_cnt[12] ),
    .A2(_0365_),
    .B(\u_uart_tx.baud_cnt[13] ),
    .ZN(_0368_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1239_ (.A1(\u_uart_tx.baud_cnt[12] ),
    .A2(\u_uart_tx.baud_cnt[13] ),
    .ZN(_0369_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1240_ (.A1(_0355_),
    .A2(_0359_),
    .A3(_0364_),
    .A4(_0369_),
    .ZN(_0370_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1241_ (.A1(_0339_),
    .A2(_0368_),
    .A3(_0370_),
    .ZN(_0031_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1242_ (.A1(\u_uart_tx.baud_cnt[14] ),
    .A2(_0370_),
    .ZN(_0371_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1243_ (.A1(\u_uart_tx.baud_cnt[12] ),
    .A2(\u_uart_tx.baud_cnt[13] ),
    .A3(\u_uart_tx.baud_cnt[14] ),
    .A4(_0365_),
    .Z(_0372_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1244_ (.A1(_0339_),
    .A2(_0371_),
    .A3(_0372_),
    .ZN(_0032_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1245_ (.A1(\u_uart_tx.baud_cnt[14] ),
    .A2(_0370_),
    .B(\u_uart_tx.baud_cnt[15] ),
    .ZN(_0373_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1246_ (.A1(\u_uart_tx.baud_cnt[14] ),
    .A2(\u_uart_tx.baud_cnt[15] ),
    .A3(_0370_),
    .Z(_0374_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1247_ (.A1(_0339_),
    .A2(_0373_),
    .A3(_0374_),
    .ZN(_0033_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1248_ (.A1(_0742_),
    .A2(uart_rx_i),
    .Z(_0024_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1249_ (.A1(_0742_),
    .A2(\u_uart_rx.reg_rx_sync[0] ),
    .Z(_0025_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1250_ (.A1(_0723_),
    .A2(\r_uart_en_rx_sync[2] ),
    .ZN(_0026_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1251_ (.A1(_0854_),
    .A2(_0882_),
    .B(_0327_),
    .ZN(_0375_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1252_ (.A1(_0724_),
    .A2(_0883_),
    .A3(_0306_),
    .A4(_0326_),
    .Z(_0007_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1253_ (.A1(_0724_),
    .A2(_0725_),
    .ZN(_0376_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1254_ (.A1(\u_uart_rx.baud_cnt[0] ),
    .A2(\u_uart_rx.baud_cnt[1] ),
    .ZN(_0377_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1255_ (.A1(_0375_),
    .A2(_0376_),
    .A3(_0377_),
    .A4(_0322_),
    .Z(_0014_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1256_ (.A1(\u_uart_rx.baud_cnt[0] ),
    .A2(\u_uart_rx.baud_cnt[1] ),
    .A3(\u_uart_rx.baud_cnt[2] ),
    .ZN(_0378_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1257_ (.A1(_0726_),
    .A2(_0377_),
    .ZN(_0379_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1258_ (.A1(_0375_),
    .A2(_0378_),
    .A3(_0379_),
    .A4(_0322_),
    .Z(_0015_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1259_ (.A1(_0727_),
    .A2(_0378_),
    .ZN(_0380_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1260_ (.A1(\u_uart_rx.baud_cnt[0] ),
    .A2(\u_uart_rx.baud_cnt[1] ),
    .A3(\u_uart_rx.baud_cnt[2] ),
    .A4(\u_uart_rx.baud_cnt[3] ),
    .Z(_0381_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1261_ (.A1(\u_uart_rx.baud_cnt[0] ),
    .A2(\u_uart_rx.baud_cnt[1] ),
    .A3(\u_uart_rx.baud_cnt[2] ),
    .A4(\u_uart_rx.baud_cnt[3] ),
    .ZN(_0382_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1262_ (.A1(_0375_),
    .A2(_0380_),
    .A3(_0382_),
    .A4(_0322_),
    .Z(_0016_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1263_ (.A1(\u_uart_rx.baud_cnt[4] ),
    .A2(_0381_),
    .ZN(_0383_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1264_ (.A1(_0728_),
    .A2(_0382_),
    .ZN(_0384_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1265_ (.A1(_0375_),
    .A2(_0383_),
    .A3(_0384_),
    .A4(_0322_),
    .Z(_0017_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1266_ (.A1(\u_uart_rx.baud_cnt[4] ),
    .A2(\u_uart_rx.baud_cnt[5] ),
    .A3(_0381_),
    .ZN(_0385_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1267_ (.A1(_0729_),
    .A2(_0383_),
    .ZN(_0386_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1268_ (.A1(_0375_),
    .A2(_0385_),
    .A3(_0386_),
    .A4(_0322_),
    .Z(_0018_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1269_ (.A1(_0730_),
    .A2(_0385_),
    .ZN(_0387_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1270_ (.A1(_0728_),
    .A2(_0729_),
    .A3(_0730_),
    .A4(_0382_),
    .ZN(_0388_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1271_ (.A1(\u_uart_rx.baud_cnt[4] ),
    .A2(\u_uart_rx.baud_cnt[5] ),
    .A3(\u_uart_rx.baud_cnt[6] ),
    .A4(_0381_),
    .ZN(_0389_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1272_ (.A1(_0375_),
    .A2(_0387_),
    .A3(_0389_),
    .A4(_0322_),
    .Z(_0019_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1273_ (.A1(_0731_),
    .A2(_0389_),
    .ZN(_0390_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1274_ (.A1(_0730_),
    .A2(_0731_),
    .A3(_0385_),
    .ZN(_0391_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1275_ (.A1(\u_uart_rx.baud_cnt[7] ),
    .A2(_0388_),
    .ZN(_0392_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1276_ (.A1(_0375_),
    .A2(_0390_),
    .A3(_0392_),
    .A4(_0322_),
    .Z(_0020_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1277_ (.A1(_0732_),
    .A2(_0392_),
    .ZN(_0393_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1278_ (.A1(\u_uart_rx.baud_cnt[7] ),
    .A2(\u_uart_rx.baud_cnt[8] ),
    .A3(_0388_),
    .ZN(_0394_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1279_ (.A1(_0375_),
    .A2(_0393_),
    .A3(_0394_),
    .A4(_0322_),
    .Z(_0021_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1280_ (.A1(_0731_),
    .A2(_0732_),
    .A3(_0733_),
    .A4(_0389_),
    .ZN(_0395_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1281_ (.A1(_0732_),
    .A2(_0392_),
    .B(_0733_),
    .ZN(_0396_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1282_ (.A1(_0883_),
    .A2(_0306_),
    .A3(_0326_),
    .A4(_0396_),
    .ZN(_0397_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1283_ (.A1(_0397_),
    .A2(_0395_),
    .ZN(_0022_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1284_ (.A1(\u_uart_rx.baud_cnt[10] ),
    .A2(_0395_),
    .Z(_0398_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1285_ (.A1(\u_uart_rx.baud_cnt[8] ),
    .A2(\u_uart_rx.baud_cnt[9] ),
    .A3(\u_uart_rx.baud_cnt[10] ),
    .A4(_0391_),
    .ZN(_0399_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1286_ (.A1(_0375_),
    .A2(_0398_),
    .A3(_0399_),
    .A4(_0322_),
    .Z(_0008_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1287_ (.A1(\u_uart_rx.baud_cnt[10] ),
    .A2(_0395_),
    .B(\u_uart_rx.baud_cnt[11] ),
    .ZN(_0400_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1288_ (.A1(\u_uart_rx.baud_cnt[8] ),
    .A2(\u_uart_rx.baud_cnt[9] ),
    .A3(\u_uart_rx.baud_cnt[10] ),
    .A4(\u_uart_rx.baud_cnt[11] ),
    .Z(_0401_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1289_ (.A1(\u_uart_rx.baud_cnt[7] ),
    .A2(_0388_),
    .A3(_0401_),
    .ZN(_0402_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1290_ (.A1(_0883_),
    .A2(_0306_),
    .A3(_0326_),
    .A4(_0402_),
    .ZN(_0403_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1291_ (.A1(_0403_),
    .A2(_0400_),
    .ZN(_0009_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1292_ (.A1(_0735_),
    .A2(_0402_),
    .ZN(_0404_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1293_ (.A1(\u_uart_rx.baud_cnt[7] ),
    .A2(\u_uart_rx.baud_cnt[12] ),
    .A3(_0388_),
    .A4(_0401_),
    .ZN(_0405_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1294_ (.A1(_0375_),
    .A2(_0404_),
    .A3(_0405_),
    .A4(_0322_),
    .Z(_0010_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1295_ (.A1(_0736_),
    .A2(_0405_),
    .ZN(_0406_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1296_ (.A1(_0735_),
    .A2(_0736_),
    .ZN(_0407_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1297_ (.A1(\u_uart_rx.baud_cnt[7] ),
    .A2(_0388_),
    .A3(_0401_),
    .A4(_0407_),
    .ZN(_0408_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1298_ (.A1(_0375_),
    .A2(_0406_),
    .A3(_0408_),
    .A4(_0322_),
    .Z(_0011_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1299_ (.A1(_0737_),
    .A2(_0408_),
    .ZN(_0409_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1300_ (.A1(\u_uart_rx.baud_cnt[14] ),
    .A2(_0391_),
    .A3(_0401_),
    .A4(_0407_),
    .ZN(_0410_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1301_ (.A1(_0375_),
    .A2(_0409_),
    .A3(_0410_),
    .A4(_0322_),
    .Z(_0012_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1302_ (.A1(_0738_),
    .A2(_0410_),
    .ZN(_0411_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _1303_ (.A1(_0737_),
    .A2(_0738_),
    .A3(_0408_),
    .Z(_0412_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1304_ (.A1(_0375_),
    .A2(_0411_),
    .A3(_0412_),
    .A4(_0322_),
    .Z(_0013_));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1305_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[24] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[16] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[8] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[0] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1306_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[25] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[17] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[9] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[1] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1307_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[26] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[18] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[10] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[2] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1308_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[27] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[19] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[11] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[3] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1309_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[28] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[20] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[12] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[4] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1310_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[29] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[21] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[13] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[5] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1311_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[30] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[22] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[14] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[6] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[6]));
 gf180mcu_fd_sc_mcu7t5v0__mux4_1 _1312_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[31] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[23] ),
    .I2(\u_dc_fifo_rx.u_din.buffer.data[15] ),
    .I3(\u_dc_fifo_rx.u_din.buffer.data[7] ),
    .S0(_0826_),
    .S1(_0831_),
    .Z(data_rx_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1313_ (.A1(\u_uart_tx.CS[1] ),
    .A2(_0818_),
    .Z(_0413_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1314_ (.A1(\u_uart_tx.CS[0] ),
    .A2(\u_uart_tx.CS[1] ),
    .Z(_0414_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1315_ (.A1(\u_uart_tx.reg_data[0] ),
    .A2(_0413_),
    .B1(_0414_),
    .B2(\u_uart_tx.parity_bit ),
    .C(\u_uart_tx.CS[2] ),
    .ZN(_0415_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1316_ (.A1(\u_uart_tx.CS[0] ),
    .A2(\u_uart_tx.CS[1] ),
    .B(_0415_),
    .ZN(uart_tx_o));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1317_ (.A1(cfg_addr_i[0]),
    .A2(cfg_addr_i[1]),
    .A3(cfg_addr_i[4]),
    .ZN(_0416_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1318_ (.A1(_0416_),
    .A2(_0698_),
    .A3(_0697_),
    .ZN(_0417_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1319_ (.A1(cfg_addr_i[2]),
    .A2(cfg_addr_i[3]),
    .B(cfg_rwn_i),
    .C(cfg_valid_i),
    .ZN(_0418_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1320_ (.A1(_0417_),
    .A2(cfg_valid_i),
    .A3(cfg_rwn_i),
    .ZN(_0419_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1321_ (.A1(_0419_),
    .A2(cfg_rx_curr_addr_i[0]),
    .ZN(_0420_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1322_ (.A1(_0697_),
    .A2(_0333_),
    .A3(cfg_addr_i[3]),
    .ZN(_0421_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1323_ (.A1(_0698_),
    .A2(cfg_addr_i[2]),
    .A3(cfg_valid_i),
    .A4(cfg_rwn_i),
    .ZN(_0422_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1324_ (.A1(_0697_),
    .A2(_0698_),
    .A3(_0333_),
    .ZN(_0423_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1325_ (.A1(cfg_addr_i[2]),
    .A2(cfg_addr_i[3]),
    .A3(_0332_),
    .A4(_0336_),
    .Z(_0424_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1326_ (.A1(cfg_addr_i[2]),
    .A2(cfg_addr_i[3]),
    .A3(_0332_),
    .A4(_0336_),
    .ZN(_0425_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1327_ (.A1(_0333_),
    .A2(_0416_),
    .B(_0423_),
    .C(\u_reg_if.r_uart_rx_data_valid ),
    .ZN(_0426_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1328_ (.A1(cfg_addr_i[0]),
    .A2(_0332_),
    .B(cfg_addr_i[4]),
    .ZN(_0427_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1329_ (.A1(cfg_rwn_i),
    .A2(cfg_valid_i),
    .A3(cfg_addr_i[1]),
    .Z(_0428_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1330_ (.A1(cfg_rwn_i),
    .A2(cfg_valid_i),
    .A3(cfg_addr_i[1]),
    .ZN(_0429_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1331_ (.A1(_0429_),
    .A2(_0427_),
    .A3(_0334_),
    .A4(\r_status_sync[2] ),
    .ZN(_0430_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1332_ (.A1(_0422_),
    .A2(cfg_addr_i[4]),
    .A3(cfg_addr_i[1]),
    .A4(_0335_),
    .ZN(_0431_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1333_ (.A1(_0336_),
    .A2(_0418_),
    .Z(_0432_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1334_ (.A1(cfg_tx_bytes_left_i[0]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[0]),
    .ZN(_0433_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1335_ (.A1(_0422_),
    .A2(cfg_addr_i[4]),
    .A3(cfg_addr_i[1]),
    .A4(cfg_addr_i[0]),
    .ZN(_0434_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1336_ (.A1(cfg_tx_curr_addr_i[0]),
    .A2(_0416_),
    .A3(_0421_),
    .ZN(_0435_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1337_ (.A1(cfg_addr_i[0]),
    .A2(cfg_addr_i[1]),
    .ZN(_0436_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1338_ (.A1(_0763_),
    .A2(_0333_),
    .A3(_0436_),
    .A4(cfg_addr_i[4]),
    .ZN(_0437_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1339_ (.A1(cfg_tx_continuous_o),
    .A2(_0755_),
    .A3(_0421_),
    .A4(_0428_),
    .ZN(_0438_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1340_ (.A1(_0430_),
    .A2(_0435_),
    .A3(_0438_),
    .ZN(_0439_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1341_ (.A1(_0420_),
    .A2(_0426_),
    .ZN(_0440_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1342_ (.A1(_0756_),
    .A2(_0697_),
    .A3(cfg_addr_i[3]),
    .A4(_0332_),
    .ZN(_0441_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1343_ (.A1(\u_reg_if.r_err_overflow ),
    .A2(_0755_),
    .A3(_0334_),
    .A4(_0428_),
    .ZN(_0442_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1344_ (.A1(_0418_),
    .A2(_0428_),
    .A3(cfg_rx_continuous_o),
    .A4(_0755_),
    .ZN(_0443_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1345_ (.A1(s_uart_rx_irq_en),
    .A2(cfg_addr_i[1]),
    .A3(_0337_),
    .ZN(_0444_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1346_ (.A1(_0442_),
    .A2(_0443_),
    .A3(_0444_),
    .ZN(_0445_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1347_ (.A1(_0439_),
    .A2(_0440_),
    .A3(_0445_),
    .ZN(_0446_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1348_ (.A1(s_uart_parity_en),
    .A2(_0338_),
    .B1(_0424_),
    .B2(\u_reg_if.r_uart_rx_data[0] ),
    .ZN(_0447_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1349_ (.A1(_0433_),
    .A2(_0446_),
    .A3(_0447_),
    .ZN(cfg_data_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1350_ (.A1(cfg_rx_curr_addr_i[1]),
    .A2(_0419_),
    .B1(_0434_),
    .B2(cfg_tx_curr_addr_i[1]),
    .C1(s_uart_err_irq_en),
    .C2(_0437_),
    .ZN(_0448_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1351_ (.A1(\u_reg_if.r_uart_rx_data[1] ),
    .A2(_0424_),
    .B1(_0431_),
    .B2(cfg_tx_bytes_left_i[1]),
    .ZN(_0449_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1352_ (.A1(\s_uart_bits[0] ),
    .A2(_0338_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[1]),
    .ZN(_0450_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1353_ (.A1(_0429_),
    .A2(_0427_),
    .A3(_0334_),
    .A4(\r_status_sync[3] ),
    .ZN(_0451_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1354_ (.A1(\u_reg_if.r_err_parity ),
    .A2(_0755_),
    .A3(_0334_),
    .A4(_0428_),
    .ZN(_0452_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1355_ (.A1(_0449_),
    .A2(_0450_),
    .A3(_0451_),
    .A4(_0452_),
    .Z(_0453_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1356_ (.A1(_0448_),
    .A2(_0453_),
    .ZN(cfg_data_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1357_ (.A1(\u_reg_if.r_uart_rx_data[2] ),
    .A2(_0424_),
    .B1(_0434_),
    .B2(cfg_tx_curr_addr_i[2]),
    .ZN(_0454_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1358_ (.A1(cfg_rx_bytes_left_i[2]),
    .A2(_0432_),
    .B1(_0419_),
    .B2(cfg_rx_curr_addr_i[2]),
    .ZN(_0455_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1359_ (.A1(\s_uart_bits[1] ),
    .A2(_0338_),
    .B1(_0431_),
    .B2(cfg_tx_bytes_left_i[2]),
    .ZN(_0456_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1360_ (.A1(_0454_),
    .A2(_0455_),
    .A3(_0456_),
    .ZN(cfg_data_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1361_ (.A1(s_uart_stop_bits),
    .A2(_0338_),
    .B1(_0424_),
    .B2(\u_reg_if.r_uart_rx_data[3] ),
    .ZN(_0457_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1362_ (.A1(cfg_tx_bytes_left_i[3]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[3]),
    .ZN(_0458_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1363_ (.A1(_0457_),
    .A2(_0458_),
    .Z(_0459_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1364_ (.A1(cfg_rx_curr_addr_i[3]),
    .A2(_0419_),
    .B1(_0434_),
    .B2(cfg_tx_curr_addr_i[3]),
    .ZN(_0460_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1365_ (.A1(_0459_),
    .A2(_0460_),
    .ZN(cfg_data_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1366_ (.A1(cfg_tx_en_i),
    .A2(_0755_),
    .A3(_0421_),
    .A4(_0428_),
    .ZN(_0461_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1367_ (.A1(_0418_),
    .A2(_0428_),
    .A3(cfg_rx_en_i),
    .A4(_0755_),
    .ZN(_0462_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1368_ (.A1(_0461_),
    .A2(_0462_),
    .ZN(_0463_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1369_ (.A1(cfg_rx_curr_addr_i[4]),
    .A2(_0419_),
    .B1(_0434_),
    .B2(cfg_tx_curr_addr_i[4]),
    .C(_0463_),
    .ZN(_0464_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1370_ (.A1(\u_reg_if.r_uart_rx_data[4] ),
    .A2(_0424_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[4]),
    .ZN(_0465_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1371_ (.A1(s_uart_rx_polling_en),
    .A2(_0338_),
    .B1(_0431_),
    .B2(cfg_tx_bytes_left_i[4]),
    .ZN(_0466_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1372_ (.A1(_0464_),
    .A2(_0465_),
    .A3(_0466_),
    .ZN(cfg_data_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1373_ (.A1(cfg_tx_pending_i),
    .A2(_0755_),
    .A3(_0421_),
    .ZN(_0467_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1374_ (.A1(s_uart_rx_clean_fifo),
    .A2(_0338_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[5]),
    .ZN(_0468_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1375_ (.A1(cfg_tx_bytes_left_i[5]),
    .A2(_0431_),
    .B1(_0434_),
    .B2(cfg_tx_curr_addr_i[5]),
    .ZN(_0469_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1376_ (.A1(_0418_),
    .A2(_0755_),
    .A3(cfg_rx_pending_i),
    .ZN(_0470_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1377_ (.A1(_0467_),
    .A2(_0470_),
    .ZN(_0471_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1378_ (.A1(_0471_),
    .A2(_0428_),
    .B1(_0424_),
    .B2(\u_reg_if.r_uart_rx_data[5] ),
    .C1(_0419_),
    .C2(cfg_rx_curr_addr_i[5]),
    .ZN(_0472_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1379_ (.A1(_0468_),
    .A2(_0469_),
    .A3(_0472_),
    .ZN(cfg_data_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1380_ (.A1(\u_reg_if.r_uart_rx_data[6] ),
    .A2(_0424_),
    .B1(_0419_),
    .B2(cfg_rx_curr_addr_i[6]),
    .ZN(_0473_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1381_ (.A1(cfg_tx_bytes_left_i[6]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[6]),
    .C1(_0434_),
    .C2(cfg_tx_curr_addr_i[6]),
    .ZN(_0474_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1382_ (.A1(_0473_),
    .A2(_0474_),
    .ZN(cfg_data_o[6]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1383_ (.A1(\u_reg_if.r_uart_rx_data[7] ),
    .A2(_0424_),
    .B1(_0419_),
    .B2(cfg_rx_curr_addr_i[7]),
    .ZN(_0475_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1384_ (.A1(cfg_tx_bytes_left_i[7]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[7]),
    .C1(_0434_),
    .C2(cfg_tx_curr_addr_i[7]),
    .ZN(_0476_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1385_ (.A1(_0475_),
    .A2(_0476_),
    .ZN(cfg_data_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1386_ (.A1(s_uart_en_tx),
    .A2(_0338_),
    .B1(_0419_),
    .B2(cfg_rx_curr_addr_i[8]),
    .ZN(_0477_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1387_ (.A1(cfg_tx_bytes_left_i[8]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[8]),
    .C1(_0434_),
    .C2(cfg_tx_curr_addr_i[8]),
    .ZN(_0478_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1388_ (.A1(_0477_),
    .A2(_0478_),
    .ZN(cfg_data_o[8]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1389_ (.A1(s_uart_en_rx),
    .A2(_0338_),
    .B1(_0419_),
    .B2(cfg_rx_curr_addr_i[9]),
    .ZN(_0479_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1390_ (.A1(cfg_tx_bytes_left_i[9]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[9]),
    .C1(_0434_),
    .C2(cfg_tx_curr_addr_i[9]),
    .ZN(_0480_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1391_ (.A1(_0479_),
    .A2(_0480_),
    .ZN(cfg_data_o[9]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1392_ (.A1(cfg_tx_bytes_left_i[10]),
    .A2(_0431_),
    .B1(_0434_),
    .B2(cfg_tx_curr_addr_i[10]),
    .ZN(_0481_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1393_ (.A1(cfg_rx_bytes_left_i[10]),
    .A2(_0432_),
    .B1(_0419_),
    .B2(cfg_rx_curr_addr_i[10]),
    .ZN(_0482_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1394_ (.A1(_0481_),
    .A2(_0482_),
    .ZN(cfg_data_o[10]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1395_ (.A1(cfg_tx_bytes_left_i[11]),
    .A2(_0431_),
    .B1(_0434_),
    .B2(cfg_tx_curr_addr_i[11]),
    .ZN(_0483_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1396_ (.A1(cfg_rx_bytes_left_i[11]),
    .A2(_0432_),
    .B1(_0419_),
    .B2(cfg_rx_curr_addr_i[11]),
    .ZN(_0484_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1397_ (.A1(_0483_),
    .A2(_0484_),
    .ZN(cfg_data_o[11]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1398_ (.A1(cfg_tx_bytes_left_i[12]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[12]),
    .ZN(_0485_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1399_ (.I(_0485_),
    .ZN(cfg_data_o[12]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1400_ (.A1(cfg_tx_bytes_left_i[13]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[13]),
    .ZN(_0486_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1401_ (.I(_0486_),
    .ZN(cfg_data_o[13]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1402_ (.A1(cfg_tx_bytes_left_i[14]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[14]),
    .ZN(_0487_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1403_ (.I(_0487_),
    .ZN(cfg_data_o[14]));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1404_ (.A1(cfg_tx_bytes_left_i[15]),
    .A2(_0431_),
    .B1(_0432_),
    .B2(cfg_rx_bytes_left_i[15]),
    .ZN(_0488_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1405_ (.I(_0488_),
    .ZN(cfg_data_o[15]));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1406_ (.A1(_0824_),
    .A2(_0830_),
    .A3(_0833_),
    .A4(_0328_),
    .Z(_0489_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1407_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[0] ),
    .I1(\s_data_rx_dc[0] ),
    .S(_0489_),
    .Z(_0044_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1408_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[1] ),
    .I1(\s_data_rx_dc[1] ),
    .S(_0489_),
    .Z(_0045_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1409_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[2] ),
    .I1(\s_data_rx_dc[2] ),
    .S(_0489_),
    .Z(_0046_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1410_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[3] ),
    .I1(\s_data_rx_dc[3] ),
    .S(_0489_),
    .Z(_0047_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1411_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[4] ),
    .I1(\s_data_rx_dc[4] ),
    .S(_0489_),
    .Z(_0048_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1412_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[5] ),
    .I1(\s_data_rx_dc[5] ),
    .S(_0489_),
    .Z(_0049_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1413_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[6] ),
    .I1(\s_data_rx_dc[6] ),
    .S(_0489_),
    .Z(_0050_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1414_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[7] ),
    .I1(\s_data_rx_dc[7] ),
    .S(_0489_),
    .Z(_0051_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1415_ (.A1(_0824_),
    .A2(_0829_),
    .A3(_0833_),
    .A4(_0328_),
    .ZN(_0490_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1416_ (.I0(\s_data_rx_dc[0] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[8] ),
    .S(_0490_),
    .Z(_0052_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1417_ (.I0(\s_data_rx_dc[1] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[9] ),
    .S(_0490_),
    .Z(_0053_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1418_ (.I0(\s_data_rx_dc[2] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[10] ),
    .S(_0490_),
    .Z(_0054_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1419_ (.I0(\s_data_rx_dc[3] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[11] ),
    .S(_0490_),
    .Z(_0055_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1420_ (.I0(\s_data_rx_dc[4] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[12] ),
    .S(_0490_),
    .Z(_0056_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1421_ (.I0(\s_data_rx_dc[5] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[13] ),
    .S(_0490_),
    .Z(_0057_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1422_ (.I0(\s_data_rx_dc[6] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[14] ),
    .S(_0490_),
    .Z(_0058_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1423_ (.I0(\s_data_rx_dc[7] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[15] ),
    .S(_0490_),
    .Z(_0059_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1424_ (.A1(_0825_),
    .A2(_0331_),
    .A3(_0829_),
    .A4(\u_dc_fifo_rx.u_din.write_token[3] ),
    .ZN(_0491_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1425_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[16] ),
    .I1(\s_data_rx_dc[0] ),
    .S(_0491_),
    .Z(_0060_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1426_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[17] ),
    .I1(\s_data_rx_dc[1] ),
    .S(_0491_),
    .Z(_0061_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1427_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[18] ),
    .I1(\s_data_rx_dc[2] ),
    .S(_0491_),
    .Z(_0062_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1428_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[19] ),
    .I1(\s_data_rx_dc[3] ),
    .S(_0491_),
    .Z(_0063_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1429_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[20] ),
    .I1(\s_data_rx_dc[4] ),
    .S(_0491_),
    .Z(_0064_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1430_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[21] ),
    .I1(\s_data_rx_dc[5] ),
    .S(_0491_),
    .Z(_0065_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1431_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[22] ),
    .I1(\s_data_rx_dc[6] ),
    .S(_0491_),
    .Z(_0066_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1432_ (.I0(\u_dc_fifo_rx.u_din.buffer.data[23] ),
    .I1(\s_data_rx_dc[7] ),
    .S(_0491_),
    .Z(_0067_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1433_ (.A1(\u_dc_fifo_rx.u_din.write_token[3] ),
    .A2(_0829_),
    .B(_0330_),
    .C(\u_dc_fifo_rx.u_din.write_token[2] ),
    .ZN(_0492_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1434_ (.I0(\s_data_rx_dc[0] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[24] ),
    .S(_0492_),
    .Z(_0068_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1435_ (.I0(\s_data_rx_dc[1] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[25] ),
    .S(_0492_),
    .Z(_0069_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1436_ (.I0(\s_data_rx_dc[2] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[26] ),
    .S(_0492_),
    .Z(_0070_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1437_ (.I0(\s_data_rx_dc[3] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[27] ),
    .S(_0492_),
    .Z(_0071_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1438_ (.I0(\s_data_rx_dc[4] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[28] ),
    .S(_0492_),
    .Z(_0072_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1439_ (.I0(\s_data_rx_dc[5] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[29] ),
    .S(_0492_),
    .Z(_0073_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1440_ (.I0(\s_data_rx_dc[6] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[30] ),
    .S(_0492_),
    .Z(_0074_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1441_ (.I0(\s_data_rx_dc[7] ),
    .I1(\u_dc_fifo_rx.u_din.buffer.data[31] ),
    .S(_0492_),
    .Z(_0075_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1442_ (.I0(\u_dc_fifo_rx.u_din.write_token[0] ),
    .I1(\u_dc_fifo_rx.u_din.write_token[3] ),
    .S(_0330_),
    .Z(_0076_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1443_ (.I0(\u_dc_fifo_rx.u_din.write_token[1] ),
    .I1(\u_dc_fifo_rx.u_din.write_token[0] ),
    .S(_0330_),
    .Z(_0077_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1444_ (.I0(\u_dc_fifo_rx.u_din.write_token[2] ),
    .I1(\u_dc_fifo_rx.u_din.write_token[1] ),
    .S(_0330_),
    .Z(_0078_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1445_ (.I0(\u_dc_fifo_rx.u_din.write_token[3] ),
    .I1(\u_dc_fifo_rx.u_din.write_token[2] ),
    .S(_0330_),
    .Z(_0079_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1446_ (.A1(s_uart_rx_irq_en),
    .A2(s_uart_rx_polling_en),
    .Z(_0493_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1447_ (.A1(_0425_),
    .A2(_0493_),
    .ZN(_0494_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1448_ (.A1(s_uart_rx_irq_en),
    .A2(s_uart_rx_polling_en),
    .A3(data_rx_ready_i),
    .ZN(_0495_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1449_ (.A1(_0425_),
    .A2(_0493_),
    .B(_0774_),
    .C(_0495_),
    .ZN(_0496_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1450_ (.I0(\u_dc_fifo_rx.u_dout.read_token[0] ),
    .I1(\u_dc_fifo_rx.u_dout.read_token[3] ),
    .S(_0496_),
    .Z(_0080_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1451_ (.I0(\u_dc_fifo_rx.u_dout.read_token[1] ),
    .I1(\u_dc_fifo_rx.u_dout.read_token[0] ),
    .S(_0496_),
    .Z(_0081_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1452_ (.I0(\u_dc_fifo_rx.u_dout.read_token[2] ),
    .I1(\u_dc_fifo_rx.u_dout.read_token[1] ),
    .S(_0496_),
    .Z(_0082_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1453_ (.I0(\u_dc_fifo_rx.u_dout.read_token[3] ),
    .I1(\u_dc_fifo_rx.u_dout.read_token[2] ),
    .S(_0496_),
    .Z(_0083_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1454_ (.A1(\u_dc_fifo_tx.u_din.full.full_synch.d_out[0] ),
    .A2(\u_dc_fifo_tx.u_din.full.latched_full_s ),
    .ZN(_0497_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1455_ (.A1(_0692_),
    .A2(_0701_),
    .B1(\u_dc_fifo_tx.u_din.full.full_synch.d_out[0] ),
    .B2(\u_dc_fifo_tx.u_din.full.latched_full_s ),
    .ZN(_0498_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1456_ (.A1(\u_fifo.i_fifo.elements[0] ),
    .A2(\u_fifo.i_fifo.elements[1] ),
    .B(_0497_),
    .ZN(_0499_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1457_ (.A1(_0498_),
    .A2(_0778_),
    .A3(_0782_),
    .ZN(_0500_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1458_ (.I0(\u_fifo.i_fifo.buffer[0][0] ),
    .I1(\u_fifo.i_fifo.buffer[1][0] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0501_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1459_ (.I0(_0501_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[0] ),
    .S(_0500_),
    .Z(_0084_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1460_ (.I0(\u_fifo.i_fifo.buffer[0][1] ),
    .I1(\u_fifo.i_fifo.buffer[1][1] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0502_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1461_ (.I0(_0502_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[1] ),
    .S(_0500_),
    .Z(_0085_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1462_ (.I0(\u_fifo.i_fifo.buffer[0][2] ),
    .I1(\u_fifo.i_fifo.buffer[1][2] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0503_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1463_ (.I0(_0503_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[2] ),
    .S(_0500_),
    .Z(_0086_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1464_ (.I0(\u_fifo.i_fifo.buffer[0][3] ),
    .I1(\u_fifo.i_fifo.buffer[1][3] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0504_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1465_ (.I0(_0504_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[3] ),
    .S(_0500_),
    .Z(_0087_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1466_ (.I0(\u_fifo.i_fifo.buffer[0][4] ),
    .I1(\u_fifo.i_fifo.buffer[1][4] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0505_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1467_ (.I0(_0505_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[4] ),
    .S(_0500_),
    .Z(_0088_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1468_ (.I0(\u_fifo.i_fifo.buffer[0][5] ),
    .I1(\u_fifo.i_fifo.buffer[1][5] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0506_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1469_ (.I0(_0506_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[5] ),
    .S(_0500_),
    .Z(_0089_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1470_ (.I0(\u_fifo.i_fifo.buffer[0][6] ),
    .I1(\u_fifo.i_fifo.buffer[1][6] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0507_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1471_ (.I0(_0507_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[6] ),
    .S(_0500_),
    .Z(_0090_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1472_ (.I0(\u_fifo.i_fifo.buffer[0][7] ),
    .I1(\u_fifo.i_fifo.buffer[1][7] ),
    .S(\u_fifo.i_fifo.pointer_out[0] ),
    .Z(_0508_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1473_ (.I0(_0508_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[7] ),
    .S(_0500_),
    .Z(_0091_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1474_ (.A1(\u_dc_fifo_tx.u_din.write_token[2] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[3] ),
    .B(_0781_),
    .C(_0783_),
    .ZN(_0509_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1475_ (.A1(\u_dc_fifo_tx.u_din.write_token[1] ),
    .A2(\u_dc_fifo_tx.u_din.write_token[0] ),
    .A3(_0782_),
    .A4(_0498_),
    .ZN(_0510_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1476_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[8] ),
    .ZN(_0511_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1477_ (.A1(_0781_),
    .A2(_0783_),
    .B(_0509_),
    .ZN(_0512_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1478_ (.A1(_0782_),
    .A2(_0498_),
    .A3(_0501_),
    .A4(_0784_),
    .ZN(_0513_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1479_ (.A1(_0511_),
    .A2(_0513_),
    .ZN(_0092_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1480_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[9] ),
    .ZN(_0514_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1481_ (.A1(_0498_),
    .A2(_0502_),
    .A3(_0784_),
    .ZN(_0515_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1482_ (.A1(_0512_),
    .A2(_0515_),
    .B(_0514_),
    .ZN(_0093_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1483_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[10] ),
    .ZN(_0516_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1484_ (.A1(_0498_),
    .A2(_0503_),
    .A3(_0784_),
    .ZN(_0517_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1485_ (.A1(_0512_),
    .A2(_0517_),
    .B(_0516_),
    .ZN(_0094_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1486_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[11] ),
    .ZN(_0518_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1487_ (.A1(_0498_),
    .A2(_0504_),
    .A3(_0784_),
    .ZN(_0519_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1488_ (.A1(_0512_),
    .A2(_0519_),
    .B(_0518_),
    .ZN(_0095_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1489_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[12] ),
    .ZN(_0520_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1490_ (.A1(_0498_),
    .A2(_0505_),
    .A3(_0784_),
    .ZN(_0521_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1491_ (.A1(_0512_),
    .A2(_0521_),
    .B(_0520_),
    .ZN(_0096_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1492_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[13] ),
    .ZN(_0522_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1493_ (.A1(_0498_),
    .A2(_0506_),
    .A3(_0784_),
    .ZN(_0523_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1494_ (.A1(_0512_),
    .A2(_0523_),
    .B(_0522_),
    .ZN(_0097_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1495_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[14] ),
    .ZN(_0524_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1496_ (.A1(_0498_),
    .A2(_0507_),
    .A3(_0784_),
    .ZN(_0525_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1497_ (.A1(_0512_),
    .A2(_0525_),
    .B(_0524_),
    .ZN(_0098_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1498_ (.A1(_0498_),
    .A2(_0508_),
    .A3(_0784_),
    .ZN(_0526_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1499_ (.A1(_0510_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[15] ),
    .ZN(_0527_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1500_ (.A1(_0512_),
    .A2(_0526_),
    .B(_0527_),
    .ZN(_0099_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1501_ (.A1(_0498_),
    .A2(_0780_),
    .A3(_0778_),
    .A4(_0781_),
    .ZN(_0528_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1502_ (.I0(_0501_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[16] ),
    .S(_0528_),
    .Z(_0100_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1503_ (.I0(_0502_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[17] ),
    .S(_0528_),
    .Z(_0101_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1504_ (.I0(_0503_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[18] ),
    .S(_0528_),
    .Z(_0102_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1505_ (.I0(_0504_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[19] ),
    .S(_0528_),
    .Z(_0103_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1506_ (.I0(_0505_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[20] ),
    .S(_0528_),
    .Z(_0104_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1507_ (.I0(_0506_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[21] ),
    .S(_0528_),
    .Z(_0105_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1508_ (.I0(_0507_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[22] ),
    .S(_0528_),
    .Z(_0106_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1509_ (.I0(_0508_),
    .I1(\u_dc_fifo_tx.u_din.buffer.data[23] ),
    .S(_0528_),
    .Z(_0107_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1510_ (.A1(_0498_),
    .A2(_0512_),
    .A3(_0501_),
    .A4(_0784_),
    .ZN(_0529_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1511_ (.A1(_0779_),
    .A2(_0781_),
    .B(_0498_),
    .C(_0784_),
    .ZN(_0530_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1512_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[24] ),
    .ZN(_0531_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1513_ (.A1(_0529_),
    .A2(_0531_),
    .ZN(_0108_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1514_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[25] ),
    .ZN(_0532_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1515_ (.A1(_0509_),
    .A2(_0515_),
    .B(_0532_),
    .ZN(_0109_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1516_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[26] ),
    .ZN(_0533_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1517_ (.A1(_0509_),
    .A2(_0517_),
    .B(_0533_),
    .ZN(_0110_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1518_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[27] ),
    .ZN(_0534_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1519_ (.A1(_0509_),
    .A2(_0519_),
    .B(_0534_),
    .ZN(_0111_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1520_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[28] ),
    .ZN(_0535_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1521_ (.A1(_0509_),
    .A2(_0521_),
    .B(_0535_),
    .ZN(_0112_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1522_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[29] ),
    .ZN(_0536_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1523_ (.A1(_0509_),
    .A2(_0523_),
    .B(_0536_),
    .ZN(_0113_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1524_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[30] ),
    .ZN(_0537_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1525_ (.A1(_0509_),
    .A2(_0525_),
    .B(_0537_),
    .ZN(_0114_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1526_ (.A1(_0530_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[31] ),
    .ZN(_0538_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1527_ (.A1(_0509_),
    .A2(_0526_),
    .B(_0538_),
    .ZN(_0115_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1528_ (.I0(\u_dc_fifo_tx.u_din.write_token[0] ),
    .I1(\u_dc_fifo_tx.u_din.write_token[3] ),
    .S(_0498_),
    .Z(_0116_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1529_ (.I0(\u_dc_fifo_tx.u_din.write_token[1] ),
    .I1(\u_dc_fifo_tx.u_din.write_token[0] ),
    .S(_0498_),
    .Z(_0117_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1530_ (.I0(\u_dc_fifo_tx.u_din.write_token[2] ),
    .I1(\u_dc_fifo_tx.u_din.write_token[1] ),
    .S(_0498_),
    .Z(_0118_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1531_ (.I0(\u_dc_fifo_tx.u_din.write_token[3] ),
    .I1(\u_dc_fifo_tx.u_din.write_token[2] ),
    .S(_0498_),
    .Z(_0119_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1532_ (.A1(_0703_),
    .A2(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .A3(\u_dc_fifo_tx.u_dout.empty_synch.d_out[2] ),
    .A4(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .ZN(_0539_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1533_ (.A1(_0704_),
    .A2(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .A3(\u_dc_fifo_tx.u_dout.empty_synch.d_out[0] ),
    .A4(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .ZN(_0540_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1534_ (.A1(_0702_),
    .A2(\u_dc_fifo_tx.u_dout.empty_synch.d_out[1] ),
    .A3(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .A4(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .ZN(_0541_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _1535_ (.A1(_0777_),
    .A2(\u_dc_fifo_tx.u_dout.empty_synch.d_out[2] ),
    .A3(_0704_),
    .Z(_0542_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1536_ (.A1(_0539_),
    .A2(_0542_),
    .ZN(_0543_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1537_ (.A1(_0540_),
    .A2(_0541_),
    .A3(_0820_),
    .Z(_0544_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1538_ (.A1(_0705_),
    .A2(_0540_),
    .A3(_0541_),
    .A4(_0819_),
    .ZN(_0545_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1539_ (.A1(_0543_),
    .A2(_0545_),
    .ZN(_0546_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1540_ (.A1(_0544_),
    .A2(_0542_),
    .A3(_0539_),
    .ZN(_0547_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1541_ (.A1(\r_uart_en_tx_sync[2] ),
    .A2(_0546_),
    .ZN(_0548_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1542_ (.I0(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .I1(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .S(_0548_),
    .Z(_0120_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1543_ (.I0(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .I1(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .S(_0548_),
    .Z(_0121_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1544_ (.I0(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .I1(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .S(_0548_),
    .Z(_0122_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1545_ (.I0(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .I1(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .S(_0548_),
    .Z(_0123_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1546_ (.A1(data_tx_ready_o),
    .A2(data_tx_valid_i),
    .ZN(_0549_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1547_ (.I(_0549_),
    .ZN(_0550_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1548_ (.A1(data_tx_req_o),
    .A2(data_tx_gnt_i),
    .ZN(_0551_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1549_ (.A1(data_tx_req_o),
    .A2(_0549_),
    .A3(data_tx_gnt_i),
    .ZN(_0552_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1550_ (.A1(data_tx_req_o),
    .A2(data_tx_gnt_i),
    .B(_0549_),
    .ZN(_0553_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1551_ (.A1(\u_fifo.r_inflight[0] ),
    .A2(_0549_),
    .A3(_0551_),
    .Z(_0124_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1552_ (.A1(\u_fifo.r_inflight[0] ),
    .A2(\u_fifo.r_inflight[1] ),
    .Z(_0554_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1553_ (.A1(_0551_),
    .A2(_0550_),
    .B(_0554_),
    .ZN(_0555_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1554_ (.A1(_0552_),
    .A2(_0554_),
    .Z(_0556_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1555_ (.A1(_0552_),
    .A2(\u_fifo.r_inflight[1] ),
    .ZN(_0557_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _1556_ (.A1(_0555_),
    .A2(_0556_),
    .B1(_0557_),
    .B2(_0553_),
    .ZN(_0125_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1557_ (.A1(data_tx_ready_o),
    .A2(\u_fifo.i_fifo.pointer_in[0] ),
    .A3(data_tx_valid_i),
    .ZN(_0558_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1558_ (.A1(_0549_),
    .A2(\u_fifo.i_fifo.pointer_in[0] ),
    .ZN(_0559_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1559_ (.A1(\u_fifo.i_fifo.pointer_in[0] ),
    .A2(_0550_),
    .Z(_0126_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1560_ (.A1(\u_fifo.i_fifo.pointer_out[0] ),
    .A2(_0498_),
    .Z(_0127_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1561_ (.I0(\u_fifo.i_fifo.buffer[0][0] ),
    .I1(data_tx_i[0]),
    .S(_0559_),
    .Z(_0128_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1562_ (.I0(\u_fifo.i_fifo.buffer[0][1] ),
    .I1(data_tx_i[1]),
    .S(_0559_),
    .Z(_0129_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1563_ (.I0(\u_fifo.i_fifo.buffer[0][2] ),
    .I1(data_tx_i[2]),
    .S(_0559_),
    .Z(_0130_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1564_ (.I0(\u_fifo.i_fifo.buffer[0][3] ),
    .I1(data_tx_i[3]),
    .S(_0559_),
    .Z(_0131_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1565_ (.I0(\u_fifo.i_fifo.buffer[0][4] ),
    .I1(data_tx_i[4]),
    .S(_0559_),
    .Z(_0132_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1566_ (.I0(\u_fifo.i_fifo.buffer[0][5] ),
    .I1(data_tx_i[5]),
    .S(_0559_),
    .Z(_0133_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1567_ (.I0(\u_fifo.i_fifo.buffer[0][6] ),
    .I1(data_tx_i[6]),
    .S(_0559_),
    .Z(_0134_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1568_ (.I0(\u_fifo.i_fifo.buffer[0][7] ),
    .I1(data_tx_i[7]),
    .S(_0559_),
    .Z(_0135_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1569_ (.I0(data_tx_i[0]),
    .I1(\u_fifo.i_fifo.buffer[1][0] ),
    .S(_0558_),
    .Z(_0136_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1570_ (.I0(data_tx_i[1]),
    .I1(\u_fifo.i_fifo.buffer[1][1] ),
    .S(_0558_),
    .Z(_0137_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1571_ (.I0(data_tx_i[2]),
    .I1(\u_fifo.i_fifo.buffer[1][2] ),
    .S(_0558_),
    .Z(_0138_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1572_ (.I0(data_tx_i[3]),
    .I1(\u_fifo.i_fifo.buffer[1][3] ),
    .S(_0558_),
    .Z(_0139_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1573_ (.I0(data_tx_i[4]),
    .I1(\u_fifo.i_fifo.buffer[1][4] ),
    .S(_0558_),
    .Z(_0140_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1574_ (.I0(data_tx_i[5]),
    .I1(\u_fifo.i_fifo.buffer[1][5] ),
    .S(_0558_),
    .Z(_0141_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1575_ (.I0(data_tx_i[6]),
    .I1(\u_fifo.i_fifo.buffer[1][6] ),
    .S(_0558_),
    .Z(_0142_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1576_ (.I0(data_tx_i[7]),
    .I1(\u_fifo.i_fifo.buffer[1][7] ),
    .S(_0558_),
    .Z(_0143_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1577_ (.A1(_0498_),
    .A2(_0549_),
    .Z(_0560_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1578_ (.A1(_0692_),
    .A2(_0560_),
    .Z(_0144_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1579_ (.A1(\u_fifo.i_fifo.elements[1] ),
    .A2(_0560_),
    .ZN(_0561_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1580_ (.A1(_0701_),
    .A2(_0499_),
    .A3(data_tx_valid_i),
    .A4(\u_fifo.i_fifo.elements[0] ),
    .ZN(_0562_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1581_ (.A1(_0549_),
    .A2(\u_fifo.i_fifo.elements[1] ),
    .A3(\u_fifo.i_fifo.elements[0] ),
    .A4(_0497_),
    .ZN(_0563_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1582_ (.A1(_0561_),
    .A2(_0562_),
    .A3(_0563_),
    .ZN(_0145_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1583_ (.A1(_0765_),
    .A2(cfg_data_i[5]),
    .A3(cfg_addr_i[4]),
    .A4(_0763_),
    .ZN(_0564_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1584_ (.I0(s_uart_stop_bits),
    .I1(cfg_data_i[3]),
    .S(_0564_),
    .Z(_0146_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1585_ (.I0(s_uart_parity_en),
    .I1(cfg_data_i[0]),
    .S(_0564_),
    .Z(_0147_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1586_ (.I0(\s_uart_div[0] ),
    .I1(cfg_data_i[16]),
    .S(_0564_),
    .Z(_0148_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1587_ (.I0(\s_uart_div[1] ),
    .I1(cfg_data_i[17]),
    .S(_0564_),
    .Z(_0149_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1588_ (.I0(\s_uart_div[2] ),
    .I1(cfg_data_i[18]),
    .S(_0564_),
    .Z(_0150_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1589_ (.I0(\s_uart_div[3] ),
    .I1(cfg_data_i[19]),
    .S(_0564_),
    .Z(_0151_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1590_ (.I0(\s_uart_div[4] ),
    .I1(cfg_data_i[20]),
    .S(_0564_),
    .Z(_0152_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1591_ (.I0(\s_uart_div[5] ),
    .I1(cfg_data_i[21]),
    .S(_0564_),
    .Z(_0153_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1592_ (.I0(\s_uart_div[6] ),
    .I1(cfg_data_i[22]),
    .S(_0564_),
    .Z(_0154_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1593_ (.I0(\s_uart_div[7] ),
    .I1(cfg_data_i[23]),
    .S(_0564_),
    .Z(_0155_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1594_ (.I0(\s_uart_div[8] ),
    .I1(cfg_data_i[24]),
    .S(_0564_),
    .Z(_0156_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1595_ (.I0(\s_uart_div[9] ),
    .I1(cfg_data_i[25]),
    .S(_0564_),
    .Z(_0157_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1596_ (.I0(\s_uart_div[10] ),
    .I1(cfg_data_i[26]),
    .S(_0564_),
    .Z(_0158_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1597_ (.I0(\s_uart_div[11] ),
    .I1(cfg_data_i[27]),
    .S(_0564_),
    .Z(_0159_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1598_ (.I0(\s_uart_div[12] ),
    .I1(cfg_data_i[28]),
    .S(_0564_),
    .Z(_0160_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1599_ (.I0(\s_uart_div[13] ),
    .I1(cfg_data_i[29]),
    .S(_0564_),
    .Z(_0161_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1600_ (.I0(\s_uart_div[14] ),
    .I1(cfg_data_i[30]),
    .S(_0564_),
    .Z(_0162_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1601_ (.I0(\s_uart_div[15] ),
    .I1(cfg_data_i[31]),
    .S(_0564_),
    .Z(_0163_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1602_ (.I0(\s_uart_bits[0] ),
    .I1(cfg_data_i[1]),
    .S(_0564_),
    .Z(_0164_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1603_ (.I0(\s_uart_bits[1] ),
    .I1(cfg_data_i[2]),
    .S(_0564_),
    .Z(_0165_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1604_ (.A1(_0758_),
    .A2(_0416_),
    .A3(_0697_),
    .A4(_0698_),
    .ZN(_0565_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1605_ (.I0(cfg_data_i[0]),
    .I1(cfg_rx_startaddr_o[0]),
    .S(_0565_),
    .Z(_0166_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1606_ (.I0(cfg_data_i[1]),
    .I1(cfg_rx_startaddr_o[1]),
    .S(_0565_),
    .Z(_0167_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1607_ (.I0(cfg_data_i[2]),
    .I1(cfg_rx_startaddr_o[2]),
    .S(_0565_),
    .Z(_0168_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1608_ (.I0(cfg_data_i[3]),
    .I1(cfg_rx_startaddr_o[3]),
    .S(_0565_),
    .Z(_0169_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1609_ (.I0(cfg_data_i[4]),
    .I1(cfg_rx_startaddr_o[4]),
    .S(_0565_),
    .Z(_0170_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1610_ (.I0(cfg_data_i[5]),
    .I1(cfg_rx_startaddr_o[5]),
    .S(_0565_),
    .Z(_0171_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1611_ (.I0(cfg_data_i[6]),
    .I1(cfg_rx_startaddr_o[6]),
    .S(_0565_),
    .Z(_0172_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1612_ (.I0(cfg_data_i[7]),
    .I1(cfg_rx_startaddr_o[7]),
    .S(_0565_),
    .Z(_0173_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1613_ (.I0(cfg_data_i[8]),
    .I1(cfg_rx_startaddr_o[8]),
    .S(_0565_),
    .Z(_0174_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1614_ (.I0(cfg_data_i[9]),
    .I1(cfg_rx_startaddr_o[9]),
    .S(_0565_),
    .Z(_0175_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1615_ (.I0(cfg_data_i[10]),
    .I1(cfg_rx_startaddr_o[10]),
    .S(_0565_),
    .Z(_0176_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1616_ (.I0(cfg_data_i[11]),
    .I1(cfg_rx_startaddr_o[11]),
    .S(_0565_),
    .Z(_0177_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1617_ (.A1(_0765_),
    .A2(cfg_addr_i[4]),
    .A3(cfg_addr_i[3]),
    .A4(cfg_addr_i[2]),
    .ZN(_0566_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1618_ (.I0(cfg_rx_size_o[0]),
    .I1(cfg_data_i[0]),
    .S(_0566_),
    .Z(_0178_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1619_ (.I0(cfg_rx_size_o[1]),
    .I1(cfg_data_i[1]),
    .S(_0566_),
    .Z(_0179_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1620_ (.I0(cfg_rx_size_o[2]),
    .I1(cfg_data_i[2]),
    .S(_0566_),
    .Z(_0180_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1621_ (.I0(cfg_rx_size_o[3]),
    .I1(cfg_data_i[3]),
    .S(_0566_),
    .Z(_0181_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1622_ (.I0(cfg_rx_size_o[4]),
    .I1(cfg_data_i[4]),
    .S(_0566_),
    .Z(_0182_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1623_ (.I0(cfg_rx_size_o[5]),
    .I1(cfg_data_i[5]),
    .S(_0566_),
    .Z(_0183_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1624_ (.I0(cfg_rx_size_o[6]),
    .I1(cfg_data_i[6]),
    .S(_0566_),
    .Z(_0184_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1625_ (.I0(cfg_rx_size_o[7]),
    .I1(cfg_data_i[7]),
    .S(_0566_),
    .Z(_0185_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1626_ (.I0(cfg_rx_size_o[8]),
    .I1(cfg_data_i[8]),
    .S(_0566_),
    .Z(_0186_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1627_ (.I0(cfg_rx_size_o[9]),
    .I1(cfg_data_i[9]),
    .S(_0566_),
    .Z(_0187_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1628_ (.I0(cfg_rx_size_o[10]),
    .I1(cfg_data_i[10]),
    .S(_0566_),
    .Z(_0188_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1629_ (.I0(cfg_rx_size_o[11]),
    .I1(cfg_data_i[11]),
    .S(_0566_),
    .Z(_0189_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1630_ (.I0(cfg_rx_size_o[12]),
    .I1(cfg_data_i[12]),
    .S(_0566_),
    .Z(_0190_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1631_ (.I0(cfg_rx_size_o[13]),
    .I1(cfg_data_i[13]),
    .S(_0566_),
    .Z(_0191_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1632_ (.I0(cfg_rx_size_o[14]),
    .I1(cfg_data_i[14]),
    .S(_0566_),
    .Z(_0192_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1633_ (.I0(cfg_rx_size_o[15]),
    .I1(cfg_data_i[15]),
    .S(_0566_),
    .Z(_0193_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1634_ (.I0(cfg_data_i[0]),
    .I1(cfg_rx_continuous_o),
    .S(_0759_),
    .Z(_0194_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1635_ (.A1(_0761_),
    .A2(cfg_addr_i[4]),
    .A3(cfg_addr_i[1]),
    .A4(cfg_addr_i[0]),
    .ZN(_0567_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1636_ (.I0(cfg_tx_startaddr_o[0]),
    .I1(cfg_data_i[0]),
    .S(_0567_),
    .Z(_0195_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1637_ (.I0(cfg_tx_startaddr_o[1]),
    .I1(cfg_data_i[1]),
    .S(_0567_),
    .Z(_0196_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1638_ (.I0(cfg_tx_startaddr_o[2]),
    .I1(cfg_data_i[2]),
    .S(_0567_),
    .Z(_0197_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1639_ (.I0(cfg_tx_startaddr_o[3]),
    .I1(cfg_data_i[3]),
    .S(_0567_),
    .Z(_0198_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1640_ (.I0(cfg_tx_startaddr_o[4]),
    .I1(cfg_data_i[4]),
    .S(_0567_),
    .Z(_0199_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1641_ (.I0(cfg_tx_startaddr_o[5]),
    .I1(cfg_data_i[5]),
    .S(_0567_),
    .Z(_0200_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1642_ (.I0(cfg_tx_startaddr_o[6]),
    .I1(cfg_data_i[6]),
    .S(_0567_),
    .Z(_0201_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1643_ (.I0(cfg_tx_startaddr_o[7]),
    .I1(cfg_data_i[7]),
    .S(_0567_),
    .Z(_0202_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1644_ (.I0(cfg_tx_startaddr_o[8]),
    .I1(cfg_data_i[8]),
    .S(_0567_),
    .Z(_0203_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1645_ (.I0(cfg_tx_startaddr_o[9]),
    .I1(cfg_data_i[9]),
    .S(_0567_),
    .Z(_0204_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1646_ (.I0(cfg_tx_startaddr_o[10]),
    .I1(cfg_data_i[10]),
    .S(_0567_),
    .Z(_0205_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1647_ (.I0(cfg_tx_startaddr_o[11]),
    .I1(cfg_data_i[11]),
    .S(_0567_),
    .Z(_0206_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1648_ (.A1(_0761_),
    .A2(_0765_),
    .A3(cfg_addr_i[4]),
    .ZN(_0568_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1649_ (.I0(cfg_tx_size_o[0]),
    .I1(cfg_data_i[0]),
    .S(_0568_),
    .Z(_0207_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1650_ (.I0(cfg_tx_size_o[1]),
    .I1(cfg_data_i[1]),
    .S(_0568_),
    .Z(_0208_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1651_ (.I0(cfg_tx_size_o[2]),
    .I1(cfg_data_i[2]),
    .S(_0568_),
    .Z(_0209_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1652_ (.I0(cfg_tx_size_o[3]),
    .I1(cfg_data_i[3]),
    .S(_0568_),
    .Z(_0210_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1653_ (.I0(cfg_tx_size_o[4]),
    .I1(cfg_data_i[4]),
    .S(_0568_),
    .Z(_0211_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1654_ (.I0(cfg_tx_size_o[5]),
    .I1(cfg_data_i[5]),
    .S(_0568_),
    .Z(_0212_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1655_ (.I0(cfg_tx_size_o[6]),
    .I1(cfg_data_i[6]),
    .S(_0568_),
    .Z(_0213_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1656_ (.I0(cfg_tx_size_o[7]),
    .I1(cfg_data_i[7]),
    .S(_0568_),
    .Z(_0214_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1657_ (.I0(cfg_tx_size_o[8]),
    .I1(cfg_data_i[8]),
    .S(_0568_),
    .Z(_0215_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1658_ (.I0(cfg_tx_size_o[9]),
    .I1(cfg_data_i[9]),
    .S(_0568_),
    .Z(_0216_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1659_ (.I0(cfg_tx_size_o[10]),
    .I1(cfg_data_i[10]),
    .S(_0568_),
    .Z(_0217_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1660_ (.I0(cfg_tx_size_o[11]),
    .I1(cfg_data_i[11]),
    .S(_0568_),
    .Z(_0218_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1661_ (.I0(cfg_tx_size_o[12]),
    .I1(cfg_data_i[12]),
    .S(_0568_),
    .Z(_0219_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1662_ (.I0(cfg_tx_size_o[13]),
    .I1(cfg_data_i[13]),
    .S(_0568_),
    .Z(_0220_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1663_ (.I0(cfg_tx_size_o[14]),
    .I1(cfg_data_i[14]),
    .S(_0568_),
    .Z(_0221_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1664_ (.I0(cfg_tx_size_o[15]),
    .I1(cfg_data_i[15]),
    .S(_0568_),
    .Z(_0222_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1665_ (.I0(cfg_data_i[0]),
    .I1(cfg_tx_continuous_o),
    .S(_0762_),
    .Z(_0223_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1666_ (.I0(s_uart_en_tx),
    .I1(cfg_data_i[8]),
    .S(_0564_),
    .Z(_0224_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1667_ (.I0(s_uart_en_rx),
    .I1(cfg_data_i[9]),
    .S(_0564_),
    .Z(_0225_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1668_ (.A1(_0441_),
    .A2(\u_reg_if.r_err_parity ),
    .ZN(_0569_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1669_ (.A1(_0752_),
    .A2(_0569_),
    .ZN(_0226_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1670_ (.A1(_0441_),
    .A2(\u_reg_if.r_err_overflow ),
    .ZN(_0570_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1671_ (.A1(_0751_),
    .A2(_0570_),
    .ZN(_0227_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1672_ (.I0(s_uart_rx_polling_en),
    .I1(cfg_data_i[4]),
    .S(_0564_),
    .Z(_0228_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1673_ (.A1(cfg_addr_i[0]),
    .A2(cfg_addr_i[1]),
    .A3(_0758_),
    .A4(_0766_),
    .ZN(_0571_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1674_ (.I0(cfg_data_i[1]),
    .I1(s_uart_err_irq_en),
    .S(_0571_),
    .Z(_0229_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1675_ (.I0(cfg_data_i[0]),
    .I1(s_uart_rx_irq_en),
    .S(_0571_),
    .Z(_0230_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1676_ (.A1(_0774_),
    .A2(_0494_),
    .ZN(_0572_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1677_ (.I0(\u_reg_if.r_uart_rx_data[0] ),
    .I1(data_rx_o[0]),
    .S(_0572_),
    .Z(_0231_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1678_ (.I0(\u_reg_if.r_uart_rx_data[1] ),
    .I1(data_rx_o[1]),
    .S(_0572_),
    .Z(_0232_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1679_ (.I0(\u_reg_if.r_uart_rx_data[2] ),
    .I1(data_rx_o[2]),
    .S(_0572_),
    .Z(_0233_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1680_ (.I0(\u_reg_if.r_uart_rx_data[3] ),
    .I1(data_rx_o[3]),
    .S(_0572_),
    .Z(_0234_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1681_ (.I0(\u_reg_if.r_uart_rx_data[4] ),
    .I1(data_rx_o[4]),
    .S(_0572_),
    .Z(_0235_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1682_ (.I0(\u_reg_if.r_uart_rx_data[5] ),
    .I1(data_rx_o[5]),
    .S(_0572_),
    .Z(_0236_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1683_ (.I0(\u_reg_if.r_uart_rx_data[6] ),
    .I1(data_rx_o[6]),
    .S(_0572_),
    .Z(_0237_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1684_ (.I0(\u_reg_if.r_uart_rx_data[7] ),
    .I1(data_rx_o[7]),
    .S(_0572_),
    .Z(_0238_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1685_ (.A1(_0425_),
    .A2(_0493_),
    .A3(\u_reg_if.r_uart_rx_data_valid ),
    .ZN(_0573_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1686_ (.A1(_0774_),
    .A2(_0494_),
    .B(_0573_),
    .ZN(_0239_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1687_ (.A1(\u_uart_rx.parity_bit ),
    .A2(\u_uart_rx.reg_rx_sync[2] ),
    .Z(_0574_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1688_ (.A1(_0722_),
    .A2(\u_uart_rx.bit_done ),
    .A3(\u_uart_rx.CS[0] ),
    .A4(\u_uart_rx.CS[1] ),
    .Z(_0575_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1689_ (.A1(_0574_),
    .A2(_0575_),
    .B(\u_uart_rx.r_error_parity ),
    .ZN(_0576_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1690_ (.A1(_0857_),
    .A2(_0576_),
    .ZN(_0240_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1691_ (.A1(_0750_),
    .A2(\u_uart_rx.CS[1] ),
    .B(\u_uart_rx.CS[0] ),
    .C(\u_uart_rx.CS[2] ),
    .ZN(_0577_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1692_ (.A1(_0325_),
    .A2(_0822_),
    .B(\u_uart_rx.bit_done ),
    .ZN(_0578_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1693_ (.A1(_0744_),
    .A2(\u_uart_rx.reg_bit_count[1] ),
    .ZN(_0579_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1694_ (.A1(_0745_),
    .A2(\r_uart_bits[0] ),
    .ZN(_0580_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1695_ (.A1(_0743_),
    .A2(\u_uart_rx.reg_bit_count[0] ),
    .B1(_0746_),
    .B2(\r_uart_bits[1] ),
    .ZN(_0581_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1696_ (.A1(_0579_),
    .A2(_0581_),
    .A3(_0580_),
    .A4(\u_uart_rx.reg_bit_count[2] ),
    .ZN(_0582_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1697_ (.A1(_0582_),
    .A2(_0324_),
    .B1(_0856_),
    .B2(_0837_),
    .C(_0578_),
    .ZN(_0583_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1698_ (.A1(_0583_),
    .A2(_0577_),
    .B1(\u_uart_rx.CS[0] ),
    .B2(_0578_),
    .ZN(_0584_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1699_ (.A1(_0584_),
    .A2(_0742_),
    .ZN(_0241_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1700_ (.A1(r_uart_parity_en),
    .A2(_0324_),
    .B(_0855_),
    .ZN(_0585_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1701_ (.A1(\u_uart_rx.CS[1] ),
    .A2(_0583_),
    .B(\r_uart_en_rx_sync[2] ),
    .ZN(_0586_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1702_ (.A1(_0583_),
    .A2(_0585_),
    .B(_0586_),
    .ZN(_0242_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1703_ (.A1(_0750_),
    .A2(\u_uart_rx.CS[0] ),
    .B(_0722_),
    .C(\u_uart_rx.CS[1] ),
    .ZN(_0587_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1704_ (.A1(\u_uart_rx.CS[2] ),
    .A2(_0583_),
    .B(\r_uart_en_rx_sync[2] ),
    .ZN(_0588_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1705_ (.A1(_0583_),
    .A2(_0587_),
    .B(_0588_),
    .ZN(_0243_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1706_ (.A1(_0720_),
    .A2(_0722_),
    .A3(\u_uart_rx.bit_done ),
    .A4(\u_uart_rx.CS[1] ),
    .ZN(_0589_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1707_ (.I0(\s_data_rx_dc[1] ),
    .I1(\s_data_rx_dc[0] ),
    .S(_0589_),
    .Z(_0244_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1708_ (.I0(\s_data_rx_dc[2] ),
    .I1(\s_data_rx_dc[1] ),
    .S(_0589_),
    .Z(_0245_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1709_ (.I0(\s_data_rx_dc[3] ),
    .I1(\s_data_rx_dc[2] ),
    .S(_0589_),
    .Z(_0246_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1710_ (.I0(\s_data_rx_dc[4] ),
    .I1(\s_data_rx_dc[3] ),
    .S(_0589_),
    .Z(_0247_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1711_ (.A1(\r_uart_bits[0] ),
    .A2(\r_uart_bits[1] ),
    .B(\s_data_rx_dc[5] ),
    .ZN(_0590_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1712_ (.A1(_0743_),
    .A2(_0744_),
    .A3(\u_uart_rx.reg_rx_sync[2] ),
    .ZN(_0591_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1713_ (.A1(_0590_),
    .A2(_0591_),
    .ZN(_0592_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1714_ (.I0(_0592_),
    .I1(\s_data_rx_dc[4] ),
    .S(_0589_),
    .Z(_0248_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1715_ (.A1(\u_uart_rx.reg_rx_sync[2] ),
    .A2(\r_uart_bits[0] ),
    .ZN(_0593_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1716_ (.A1(\s_data_rx_dc[6] ),
    .A2(\r_uart_bits[1] ),
    .ZN(_0594_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1717_ (.A1(_0593_),
    .A2(\r_uart_bits[1] ),
    .B(_0594_),
    .ZN(_0595_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1718_ (.I0(_0595_),
    .I1(\s_data_rx_dc[5] ),
    .S(_0589_),
    .Z(_0249_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1719_ (.A1(\u_uart_rx.reg_rx_sync[2] ),
    .A2(\r_uart_bits[0] ),
    .ZN(_0596_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1720_ (.A1(_0743_),
    .A2(\s_data_rx_dc[7] ),
    .B(\r_uart_bits[1] ),
    .ZN(_0597_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1721_ (.A1(_0589_),
    .A2(\s_data_rx_dc[6] ),
    .ZN(_0598_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1722_ (.A1(_0589_),
    .A2(_0596_),
    .A3(_0597_),
    .B(_0598_),
    .ZN(_0250_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1723_ (.A1(_0589_),
    .A2(\s_data_rx_dc[7] ),
    .ZN(_0599_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1724_ (.A1(_0744_),
    .A2(_0589_),
    .A3(_0593_),
    .B(_0599_),
    .ZN(_0251_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1725_ (.A1(\u_uart_rx.bit_done ),
    .A2(_0582_),
    .A3(_0323_),
    .A4(_0720_),
    .Z(_0600_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1726_ (.I0(_0600_),
    .I1(_0589_),
    .S(\u_uart_rx.reg_bit_count[0] ),
    .Z(_0252_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1727_ (.A1(\u_uart_rx.reg_bit_count[0] ),
    .A2(\u_uart_rx.reg_bit_count[1] ),
    .ZN(_0601_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1728_ (.A1(_0582_),
    .A2(_0601_),
    .A3(\u_uart_rx.bit_done ),
    .A4(_0324_),
    .Z(_0602_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1729_ (.A1(_0601_),
    .A2(_0600_),
    .B1(_0589_),
    .B2(\u_uart_rx.reg_bit_count[1] ),
    .ZN(_0603_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1730_ (.A1(_0745_),
    .A2(_0746_),
    .B(_0603_),
    .ZN(_0253_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1731_ (.A1(_0602_),
    .A2(_0589_),
    .B(\u_uart_rx.reg_bit_count[2] ),
    .ZN(_0604_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1732_ (.A1(\u_uart_rx.reg_bit_count[2] ),
    .A2(_0589_),
    .A3(_0601_),
    .B(_0604_),
    .ZN(_0254_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1733_ (.A1(\u_uart_rx.bit_done ),
    .A2(_0323_),
    .A3(_0574_),
    .A4(_0720_),
    .ZN(_0605_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1734_ (.A1(_0855_),
    .A2(_0324_),
    .B(\u_uart_rx.bit_done ),
    .ZN(_0606_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1735_ (.A1(_0606_),
    .A2(\u_uart_rx.parity_bit ),
    .ZN(_0607_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1736_ (.A1(_0605_),
    .A2(_0607_),
    .ZN(_0255_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1737_ (.A1(_0747_),
    .A2(\r_uart_bits[0] ),
    .ZN(_0608_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1738_ (.A1(_0743_),
    .A2(\u_uart_tx.reg_bit_count[0] ),
    .B1(_0748_),
    .B2(\r_uart_bits[1] ),
    .ZN(_0609_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1739_ (.A1(_0744_),
    .A2(\u_uart_tx.reg_bit_count[1] ),
    .B(_0749_),
    .ZN(_0610_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1740_ (.A1(_0609_),
    .A2(_0610_),
    .A3(_0608_),
    .ZN(_0611_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1741_ (.A1(\u_uart_tx.busy_o ),
    .A2(\u_uart_tx.bit_done ),
    .Z(_0612_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1742_ (.A1(\u_uart_tx.CS[2] ),
    .A2(\u_uart_tx.CS[1] ),
    .B(_0612_),
    .ZN(_0613_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1743_ (.A1(_0547_),
    .A2(_0613_),
    .B1(_0611_),
    .B2(_0413_),
    .ZN(_0614_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1744_ (.A1(\u_uart_tx.CS[1] ),
    .A2(r_uart_parity_en),
    .A3(_0818_),
    .ZN(_0615_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1745_ (.A1(\u_uart_tx.CS[2] ),
    .A2(r_uart_stop_bits),
    .A3(_0819_),
    .ZN(_0616_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1746_ (.A1(_0705_),
    .A2(r_uart_stop_bits),
    .B(_0819_),
    .ZN(_0617_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1747_ (.A1(_0614_),
    .A2(_0615_),
    .A3(_0617_),
    .Z(_0618_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1748_ (.A1(\u_uart_tx.CS[0] ),
    .A2(_0614_),
    .B(\r_uart_en_tx_sync[2] ),
    .ZN(_0619_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1749_ (.A1(_0618_),
    .A2(_0619_),
    .ZN(_0256_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1750_ (.A1(\u_uart_tx.CS[2] ),
    .A2(\u_uart_tx.CS[1] ),
    .ZN(_0620_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1751_ (.A1(r_uart_parity_en),
    .A2(_0413_),
    .B1(_0620_),
    .B2(\u_uart_tx.CS[0] ),
    .ZN(_0621_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1752_ (.A1(\u_uart_tx.CS[1] ),
    .A2(_0546_),
    .A3(_0612_),
    .ZN(_0622_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1753_ (.A1(_0614_),
    .A2(_0621_),
    .B(_0622_),
    .C(_0706_),
    .ZN(_0257_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1754_ (.A1(_0413_),
    .A2(_0750_),
    .B1(_0705_),
    .B2(_0414_),
    .ZN(_0623_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1755_ (.A1(_0623_),
    .A2(_0616_),
    .ZN(_0624_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1756_ (.A1(\u_uart_tx.CS[1] ),
    .A2(\u_uart_tx.bit_done ),
    .ZN(_0625_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1757_ (.A1(_0614_),
    .A2(_0624_),
    .B1(_0625_),
    .B2(\u_uart_tx.CS[2] ),
    .ZN(_0626_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1758_ (.A1(_0626_),
    .A2(_0706_),
    .ZN(_0258_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1759_ (.A1(\u_uart_tx.CS[1] ),
    .A2(\u_uart_tx.bit_done ),
    .A3(_0818_),
    .ZN(_0627_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1760_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.bit_done ),
    .Z(_0628_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1761_ (.A1(_0546_),
    .A2(_0628_),
    .ZN(_0629_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1762_ (.A1(\u_uart_tx.reg_data[0] ),
    .A2(_0629_),
    .ZN(_0630_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1763_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_data[1] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0631_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1764_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[24] ),
    .ZN(_0632_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1765_ (.A1(_0786_),
    .A2(_0788_),
    .A3(\u_dc_fifo_tx.u_din.buffer.data[16] ),
    .ZN(_0633_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1766_ (.A1(_0793_),
    .A2(_0632_),
    .A3(_0633_),
    .ZN(_0634_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1767_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[8] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[0] ),
    .B2(_0788_),
    .C(_0793_),
    .ZN(_0635_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1768_ (.A1(_0546_),
    .A2(_0634_),
    .ZN(_0636_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1769_ (.A1(_0635_),
    .A2(_0636_),
    .B(_0630_),
    .C(_0631_),
    .ZN(_0259_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1770_ (.A1(\u_uart_tx.reg_data[1] ),
    .A2(_0629_),
    .ZN(_0637_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1771_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_data[2] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0638_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1772_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[25] ),
    .ZN(_0639_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1773_ (.A1(_0786_),
    .A2(_0788_),
    .A3(\u_dc_fifo_tx.u_din.buffer.data[17] ),
    .ZN(_0640_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1774_ (.A1(_0793_),
    .A2(_0639_),
    .A3(_0640_),
    .ZN(_0641_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1775_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[9] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[1] ),
    .B2(_0788_),
    .C(_0793_),
    .ZN(_0642_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1776_ (.A1(_0546_),
    .A2(_0641_),
    .ZN(_0643_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1777_ (.A1(_0642_),
    .A2(_0643_),
    .B(_0637_),
    .C(_0638_),
    .ZN(_0260_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1778_ (.A1(\u_uart_tx.reg_data[2] ),
    .A2(_0629_),
    .ZN(_0644_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1779_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_data[3] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0645_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1780_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[26] ),
    .ZN(_0646_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1781_ (.A1(_0786_),
    .A2(_0788_),
    .A3(\u_dc_fifo_tx.u_din.buffer.data[18] ),
    .ZN(_0647_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1782_ (.A1(_0793_),
    .A2(_0646_),
    .A3(_0647_),
    .ZN(_0648_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1783_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[10] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[2] ),
    .B2(_0788_),
    .C(_0793_),
    .ZN(_0649_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1784_ (.A1(_0546_),
    .A2(_0648_),
    .ZN(_0650_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1785_ (.A1(_0649_),
    .A2(_0650_),
    .B(_0644_),
    .C(_0645_),
    .ZN(_0261_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1786_ (.A1(\u_uart_tx.reg_data[3] ),
    .A2(_0629_),
    .ZN(_0651_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1787_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_data[4] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0652_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1788_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[27] ),
    .ZN(_0653_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1789_ (.A1(_0786_),
    .A2(_0788_),
    .A3(\u_dc_fifo_tx.u_din.buffer.data[19] ),
    .ZN(_0654_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1790_ (.A1(_0793_),
    .A2(_0653_),
    .A3(_0654_),
    .ZN(_0655_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1791_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[11] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[3] ),
    .B2(_0788_),
    .C(_0793_),
    .ZN(_0656_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1792_ (.A1(_0546_),
    .A2(_0655_),
    .ZN(_0657_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1793_ (.A1(_0656_),
    .A2(_0657_),
    .B(_0651_),
    .C(_0652_),
    .ZN(_0262_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1794_ (.A1(\u_uart_tx.reg_data[4] ),
    .A2(_0629_),
    .ZN(_0658_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1795_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_data[5] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0659_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1796_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[28] ),
    .ZN(_0660_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1797_ (.A1(_0786_),
    .A2(_0788_),
    .A3(\u_dc_fifo_tx.u_din.buffer.data[20] ),
    .ZN(_0661_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1798_ (.A1(_0793_),
    .A2(_0660_),
    .A3(_0661_),
    .ZN(_0662_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1799_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[12] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[4] ),
    .B2(_0788_),
    .C(_0793_),
    .ZN(_0663_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1800_ (.A1(_0546_),
    .A2(_0662_),
    .ZN(_0664_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1801_ (.A1(_0663_),
    .A2(_0664_),
    .B(_0658_),
    .C(_0659_),
    .ZN(_0263_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1802_ (.A1(\u_uart_tx.reg_data[5] ),
    .A2(_0629_),
    .ZN(_0665_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1803_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_data[6] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0666_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1804_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[29] ),
    .ZN(_0667_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1805_ (.A1(_0786_),
    .A2(_0788_),
    .A3(\u_dc_fifo_tx.u_din.buffer.data[21] ),
    .ZN(_0668_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1806_ (.A1(_0793_),
    .A2(_0667_),
    .A3(_0668_),
    .ZN(_0669_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1807_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[13] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[5] ),
    .B2(_0788_),
    .C(_0793_),
    .ZN(_0670_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1808_ (.A1(_0546_),
    .A2(_0669_),
    .ZN(_0671_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1809_ (.A1(_0670_),
    .A2(_0671_),
    .B(_0665_),
    .C(_0666_),
    .ZN(_0264_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1810_ (.A1(\u_uart_tx.reg_data[6] ),
    .A2(_0629_),
    .ZN(_0672_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1811_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_data[7] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0673_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1812_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[30] ),
    .ZN(_0674_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1813_ (.A1(_0786_),
    .A2(_0788_),
    .A3(\u_dc_fifo_tx.u_din.buffer.data[22] ),
    .ZN(_0675_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1814_ (.A1(_0793_),
    .A2(_0674_),
    .A3(_0675_),
    .ZN(_0676_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1815_ (.A1(_0791_),
    .A2(\u_dc_fifo_tx.u_din.buffer.data[14] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[6] ),
    .B2(_0788_),
    .C(_0793_),
    .ZN(_0677_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1816_ (.A1(_0546_),
    .A2(_0676_),
    .ZN(_0678_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1817_ (.A1(_0677_),
    .A2(_0678_),
    .B(_0672_),
    .C(_0673_),
    .ZN(_0265_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1818_ (.A1(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .B1(\u_dc_fifo_tx.u_dout.read_token[2] ),
    .B2(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .C(\u_dc_fifo_tx.u_din.buffer.data[23] ),
    .ZN(_0679_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _1819_ (.A1(\u_dc_fifo_tx.u_dout.read_token[3] ),
    .A2(\u_dc_fifo_tx.u_dout.read_token[1] ),
    .B1(\u_dc_fifo_tx.u_din.buffer.data[31] ),
    .B2(_0790_),
    .C(\u_dc_fifo_tx.u_dout.read_token[0] ),
    .ZN(_0680_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1820_ (.A1(\u_dc_fifo_tx.u_din.buffer.data[15] ),
    .A2(_0790_),
    .Z(_0681_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1821_ (.A1(\u_dc_fifo_tx.u_din.buffer.data[7] ),
    .A2(_0791_),
    .B(_0681_),
    .C(_0792_),
    .ZN(_0682_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1822_ (.A1(_0679_),
    .A2(_0680_),
    .B(_0546_),
    .C(_0682_),
    .ZN(_0683_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1823_ (.I0(_0683_),
    .I1(\u_uart_tx.reg_data[7] ),
    .S(_0629_),
    .Z(_0266_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1824_ (.I0(_0628_),
    .I1(_0627_),
    .S(\u_uart_tx.reg_bit_count[0] ),
    .Z(_0267_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1825_ (.A1(\u_uart_tx.reg_bit_count[0] ),
    .A2(\u_uart_tx.reg_bit_count[1] ),
    .ZN(_0684_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1826_ (.A1(_0611_),
    .A2(_0684_),
    .B(_0627_),
    .ZN(_0685_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1827_ (.A1(_0611_),
    .A2(_0413_),
    .A3(\u_uart_tx.reg_bit_count[0] ),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0686_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1828_ (.A1(_0748_),
    .A2(_0686_),
    .B(_0685_),
    .ZN(_0268_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1829_ (.A1(_0749_),
    .A2(_0611_),
    .A3(_0413_),
    .A4(\u_uart_tx.bit_done ),
    .ZN(_0687_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _1830_ (.A1(_0747_),
    .A2(_0748_),
    .A3(_0687_),
    .B1(_0685_),
    .B2(_0749_),
    .ZN(_0269_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1831_ (.A1(\u_uart_tx.CS[1] ),
    .A2(\u_uart_tx.reg_data[0] ),
    .A3(\u_uart_tx.bit_done ),
    .A4(_0818_),
    .ZN(_0688_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1832_ (.A1(\u_uart_tx.CS[0] ),
    .A2(\u_uart_tx.bit_done ),
    .A3(_0620_),
    .ZN(_0689_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1833_ (.A1(_0688_),
    .A2(_0689_),
    .A3(\u_uart_tx.parity_bit ),
    .ZN(_0690_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1834_ (.A1(\u_uart_tx.parity_bit ),
    .A2(_0688_),
    .B(_0690_),
    .ZN(_0270_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1835_ (.A1(_0706_),
    .A2(\r_uart_en_tx_sync[1] ),
    .B1(_0742_),
    .B2(\r_uart_en_rx_sync[1] ),
    .ZN(_0691_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1836_ (.I0(s_uart_stop_bits),
    .I1(r_uart_stop_bits),
    .S(_0691_),
    .Z(_0271_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1837_ (.I0(s_uart_parity_en),
    .I1(r_uart_parity_en),
    .S(_0691_),
    .Z(_0272_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1838_ (.I0(\s_uart_div[0] ),
    .I1(\r_uart_div[0] ),
    .S(_0691_),
    .Z(_0273_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1839_ (.I0(\s_uart_div[1] ),
    .I1(\r_uart_div[1] ),
    .S(_0691_),
    .Z(_0274_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1840_ (.I0(\s_uart_div[2] ),
    .I1(\r_uart_div[2] ),
    .S(_0691_),
    .Z(_0275_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1841_ (.I0(\s_uart_div[3] ),
    .I1(\r_uart_div[3] ),
    .S(_0691_),
    .Z(_0276_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1842_ (.I0(\s_uart_div[4] ),
    .I1(\r_uart_div[4] ),
    .S(_0691_),
    .Z(_0277_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1843_ (.I0(\s_uart_div[5] ),
    .I1(\r_uart_div[5] ),
    .S(_0691_),
    .Z(_0278_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1844_ (.I0(\s_uart_div[6] ),
    .I1(\r_uart_div[6] ),
    .S(_0691_),
    .Z(_0279_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1845_ (.I0(\s_uart_div[7] ),
    .I1(\r_uart_div[7] ),
    .S(_0691_),
    .Z(_0280_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1846_ (.I0(\s_uart_div[8] ),
    .I1(\r_uart_div[8] ),
    .S(_0691_),
    .Z(_0281_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1847_ (.I0(\s_uart_div[9] ),
    .I1(\r_uart_div[9] ),
    .S(_0691_),
    .Z(_0282_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1848_ (.I0(\s_uart_div[10] ),
    .I1(\r_uart_div[10] ),
    .S(_0691_),
    .Z(_0283_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1849_ (.I0(\s_uart_div[11] ),
    .I1(\r_uart_div[11] ),
    .S(_0691_),
    .Z(_0284_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1850_ (.I0(\s_uart_div[12] ),
    .I1(\r_uart_div[12] ),
    .S(_0691_),
    .Z(_0285_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1851_ (.I0(\s_uart_div[13] ),
    .I1(\r_uart_div[13] ),
    .S(_0691_),
    .Z(_0286_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1852_ (.I0(\s_uart_div[14] ),
    .I1(\r_uart_div[14] ),
    .S(_0691_),
    .Z(_0287_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1853_ (.I0(\s_uart_div[15] ),
    .I1(\r_uart_div[15] ),
    .S(_0691_),
    .Z(_0288_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1854_ (.I0(\s_uart_bits[0] ),
    .I1(\r_uart_bits[0] ),
    .S(_0691_),
    .Z(_0289_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1855_ (.I0(\s_uart_bits[1] ),
    .I1(\r_uart_bits[1] ),
    .S(_0691_),
    .Z(_0290_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1856_ (.D(_0044_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1857_ (.D(_0045_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1858_ (.D(_0046_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1859_ (.D(_0047_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1860_ (.D(_0048_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1861_ (.D(_0049_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1862_ (.D(_0050_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1863_ (.D(_0051_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1864_ (.D(_0052_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1865_ (.D(_0053_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1866_ (.D(_0054_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1867_ (.D(_0055_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1868_ (.D(_0056_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1869_ (.D(_0057_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1870_ (.D(_0058_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1871_ (.D(_0059_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1872_ (.D(_0060_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[16] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1873_ (.D(_0061_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[17] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1874_ (.D(_0062_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[18] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1875_ (.D(_0063_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[19] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1876_ (.D(_0064_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[20] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1877_ (.D(_0065_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[21] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1878_ (.D(_0066_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[22] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1879_ (.D(_0067_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[23] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1880_ (.D(_0068_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[24] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1881_ (.D(_0069_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[25] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1882_ (.D(_0070_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[26] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1883_ (.D(_0071_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[27] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1884_ (.D(_0072_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[28] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1885_ (.D(_0073_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[29] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1886_ (.D(_0074_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[30] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1887_ (.D(_0075_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.buffer.data[31] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1888_ (.D(_0076_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.write_token[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1889_ (.D(_0077_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.write_token[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1890_ (.D(_0078_),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.write_token[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1891_ (.D(_0079_),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.write_token[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1892_ (.D(_0080_),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.read_token[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1893_ (.D(_0081_),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.read_token[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1894_ (.D(_0082_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.read_token[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1895_ (.D(_0083_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.read_token[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1896_ (.D(_0084_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1897_ (.D(_0085_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1898_ (.D(_0086_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1899_ (.D(_0087_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1900_ (.D(_0088_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1901_ (.D(_0089_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1902_ (.D(_0090_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1903_ (.D(_0091_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1904_ (.D(_0092_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1905_ (.D(_0093_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1906_ (.D(_0094_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1907_ (.D(_0095_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1908_ (.D(_0096_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1909_ (.D(_0097_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1910_ (.D(_0098_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1911_ (.D(_0099_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1912_ (.D(_0100_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[16] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1913_ (.D(_0101_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[17] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1914_ (.D(_0102_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[18] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1915_ (.D(_0103_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[19] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1916_ (.D(_0104_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[20] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1917_ (.D(_0105_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[21] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1918_ (.D(_0106_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[22] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1919_ (.D(_0107_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[23] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1920_ (.D(_0108_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[24] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1921_ (.D(_0109_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[25] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1922_ (.D(_0110_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[26] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1923_ (.D(_0111_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[27] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1924_ (.D(_0112_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[28] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1925_ (.D(_0113_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[29] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1926_ (.D(_0114_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[30] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1927_ (.D(_0115_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.buffer.data[31] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1928_ (.D(_0116_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.write_token[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1929_ (.D(_0117_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.write_token[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1930_ (.D(_0118_),
    .SETN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.write_token[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1931_ (.D(_0119_),
    .SETN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.write_token[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1932_ (.D(_0120_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.read_token[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1933_ (.D(_0121_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.read_token[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1934_ (.D(_0122_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.read_token[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1935_ (.D(_0123_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.read_token[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1936_ (.D(_0124_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.r_inflight[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1937_ (.D(_0125_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.r_inflight[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1938_ (.D(_0126_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.pointer_in[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1939_ (.D(_0127_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.pointer_out[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1940_ (.D(_0128_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1941_ (.D(_0129_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1942_ (.D(_0130_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1943_ (.D(_0131_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1944_ (.D(_0132_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1945_ (.D(_0133_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1946_ (.D(_0134_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1947_ (.D(_0135_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[0][7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1948_ (.D(_0136_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1949_ (.D(_0137_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1950_ (.D(_0138_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1951_ (.D(_0139_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1952_ (.D(_0140_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1953_ (.D(_0141_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1954_ (.D(_0142_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1955_ (.D(_0143_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.buffer[1][7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1956_ (.D(_0144_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.elements[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1957_ (.D(_0145_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_fifo.i_fifo.elements[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1958_ (.D(_0146_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_stop_bits));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1959_ (.D(_0147_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_parity_en));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1960_ (.D(_0148_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1961_ (.D(_0149_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1962_ (.D(_0150_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1963_ (.D(_0151_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1964_ (.D(_0152_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1965_ (.D(_0153_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1966_ (.D(_0154_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1967_ (.D(_0155_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1968_ (.D(_0156_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1969_ (.D(_0157_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1970_ (.D(_0158_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1971_ (.D(_0159_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1972_ (.D(_0160_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1973_ (.D(_0161_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1974_ (.D(_0162_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1975_ (.D(_0163_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_div[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1976_ (.D(_0164_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_bits[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1977_ (.D(_0165_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\s_uart_bits[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1978_ (.D(_0166_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1979_ (.D(_0167_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1980_ (.D(_0168_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1981_ (.D(_0169_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1982_ (.D(_0170_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1983_ (.D(_0171_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1984_ (.D(_0172_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1985_ (.D(_0173_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1986_ (.D(_0174_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1987_ (.D(_0175_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1988_ (.D(_0176_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1989_ (.D(_0177_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_startaddr_o[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1990_ (.D(_0178_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1991_ (.D(_0179_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1992_ (.D(_0180_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1993_ (.D(_0181_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1994_ (.D(_0182_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1995_ (.D(_0183_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1996_ (.D(_0184_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1997_ (.D(_0185_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1998_ (.D(_0186_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1999_ (.D(_0187_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2000_ (.D(_0188_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2001_ (.D(_0189_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2002_ (.D(_0190_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2003_ (.D(_0191_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2004_ (.D(_0192_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2005_ (.D(_0193_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_size_o[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2006_ (.D(_0194_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_continuous_o));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2007_ (.D(_0195_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2008_ (.D(_0196_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2009_ (.D(_0197_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2010_ (.D(_0198_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2011_ (.D(_0199_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2012_ (.D(_0200_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2013_ (.D(_0201_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2014_ (.D(_0202_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2015_ (.D(_0203_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2016_ (.D(_0204_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2017_ (.D(_0205_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2018_ (.D(_0206_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_startaddr_o[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2019_ (.D(_0207_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2020_ (.D(_0208_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2021_ (.D(_0209_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2022_ (.D(_0210_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2023_ (.D(_0211_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2024_ (.D(_0212_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2025_ (.D(_0213_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2026_ (.D(_0214_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2027_ (.D(_0215_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2028_ (.D(_0216_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2029_ (.D(_0217_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2030_ (.D(_0218_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2031_ (.D(_0219_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2032_ (.D(_0220_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2033_ (.D(_0221_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2034_ (.D(_0222_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_size_o[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2035_ (.D(_0223_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_continuous_o));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2036_ (.D(_0224_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_en_tx));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2037_ (.D(_0225_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_en_rx));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2038_ (.D(_0226_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_err_parity ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2039_ (.D(_0227_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_err_overflow ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2040_ (.D(_0228_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_rx_polling_en));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2041_ (.D(_0229_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_err_irq_en));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2042_ (.D(_0230_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_rx_irq_en));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2043_ (.D(_0231_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2044_ (.D(_0232_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2045_ (.D(_0233_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2046_ (.D(_0234_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2047_ (.D(_0235_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2048_ (.D(_0236_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2049_ (.D(_0237_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2050_ (.D(_0238_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2051_ (.D(_0239_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_reg_if.r_uart_rx_data_valid ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2052_ (.D(_0240_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.r_error_parity ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2053_ (.D(_0241_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.CS[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2054_ (.D(_0242_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.CS[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2055_ (.D(_0243_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.CS[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2056_ (.D(_0244_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2057_ (.D(_0245_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2058_ (.D(_0246_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2059_ (.D(_0247_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2060_ (.D(_0248_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2061_ (.D(_0249_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2062_ (.D(_0250_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2063_ (.D(_0251_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\s_data_rx_dc[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2064_ (.D(_0252_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.reg_bit_count[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2065_ (.D(_0253_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.reg_bit_count[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2066_ (.D(_0254_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.reg_bit_count[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2067_ (.D(_0255_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.parity_bit ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2068_ (.D(_0256_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.CS[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2069_ (.D(_0257_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.CS[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2070_ (.D(_0258_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.CS[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2071_ (.D(_0259_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2072_ (.D(_0260_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2073_ (.D(_0261_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2074_ (.D(_0262_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2075_ (.D(_0263_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2076_ (.D(_0264_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2077_ (.D(_0265_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2078_ (.D(_0266_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_data[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2079_ (.D(_0267_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_bit_count[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2080_ (.D(_0268_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_bit_count[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2081_ (.D(_0269_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.reg_bit_count[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2082_ (.D(_0270_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.parity_bit ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2083_ (.D(_0271_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(r_uart_stop_bits));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2084_ (.D(_0272_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(r_uart_parity_en));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2085_ (.D(_0273_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2086_ (.D(_0274_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2087_ (.D(_0275_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2088_ (.D(_0276_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2089_ (.D(_0277_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2090_ (.D(_0278_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2091_ (.D(_0279_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2092_ (.D(_0280_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2093_ (.D(_0281_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2094_ (.D(_0282_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2095_ (.D(_0283_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2096_ (.D(_0284_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2097_ (.D(_0285_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2098_ (.D(_0286_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2099_ (.D(_0287_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2100_ (.D(_0288_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_div[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2101_ (.D(_0289_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_bits[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2102_ (.D(_0290_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_bits[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2103_ (.D(s_uart_en_rx),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_en_rx_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2104_ (.D(\r_uart_en_rx_sync[0] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_en_rx_sync[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2105_ (.D(\r_uart_en_rx_sync[1] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_en_rx_sync[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2106_ (.D(s_uart_en_tx),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_en_tx_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2107_ (.D(\r_uart_en_tx_sync[0] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_en_tx_sync[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2108_ (.D(\r_uart_en_tx_sync[1] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\r_uart_en_tx_sync[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2109_ (.D(\u_uart_tx.busy_o ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\r_status_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2110_ (.D(\u_uart_rx.busy_o ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\r_status_sync[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2111_ (.D(\r_status_sync[0] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\r_status_sync[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2112_ (.D(\r_status_sync[1] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\r_status_sync[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2113_ (.D(_0004_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_clr_o));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2114_ (.D(_0005_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_tx_en_o));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2115_ (.D(_0002_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_clr_o));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2116_ (.D(_0006_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(s_uart_rx_clean_fifo));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2117_ (.D(_0003_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(cfg_rx_en_o));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2118_ (.D(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[0] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_out[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2119_ (.D(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[1] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_out[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2120_ (.D(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[2] ),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_out[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2121_ (.D(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[3] ),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_out[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2122_ (.D(\u_dc_fifo_tx.u_din.write_token[0] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2123_ (.D(\u_dc_fifo_tx.u_din.write_token[1] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2124_ (.D(\u_dc_fifo_tx.u_din.write_token[2] ),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2125_ (.D(\u_dc_fifo_tx.u_din.write_token[3] ),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_tx.u_dout.empty_synch.d_middle[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2126_ (.D(\u_dc_fifo_tx.u_din.full.full_synch.d_in[0] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.full.full_synch.d_middle[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2127_ (.D(\u_dc_fifo_tx.u_din.full.full_synch.d_middle[0] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.full.full_synch.d_out[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2128_ (.D(_0001_),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_tx.u_din.full.latched_full_s ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2129_ (.D(_0043_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.bit_done ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2130_ (.D(_0027_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2131_ (.D(_0034_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2132_ (.D(_0035_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2133_ (.D(_0036_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2134_ (.D(_0037_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2135_ (.D(_0038_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2136_ (.D(_0039_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2137_ (.D(_0040_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2138_ (.D(_0041_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2139_ (.D(_0042_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2140_ (.D(_0028_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2141_ (.D(_0029_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2142_ (.D(_0030_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2143_ (.D(_0031_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2144_ (.D(_0032_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2145_ (.D(_0033_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_tx.baud_cnt[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2146_ (.D(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[0] ),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_out[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2147_ (.D(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[1] ),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_out[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2148_ (.D(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[2] ),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_out[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2149_ (.D(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[3] ),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_out[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2150_ (.D(\u_dc_fifo_rx.u_din.write_token[0] ),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2151_ (.D(\u_dc_fifo_rx.u_din.write_token[1] ),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2152_ (.D(\u_dc_fifo_rx.u_din.write_token[2] ),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2153_ (.D(\u_dc_fifo_rx.u_din.write_token[3] ),
    .SETN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(sys_clk_i),
    .Q(\u_dc_fifo_rx.u_dout.empty_synch.d_middle[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2154_ (.D(\u_dc_fifo_rx.u_din.full.full_synch.d_in[0] ),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.full.full_synch.d_middle[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2155_ (.D(\u_dc_fifo_rx.u_din.full.full_synch.d_middle[0] ),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.full.full_synch.d_out[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2156_ (.D(_0000_),
    .RN(\u_dc_fifo_rx.dst_rstn_i ),
    .CLK(periph_clk_i),
    .Q(\u_dc_fifo_rx.u_din.full.latched_full_s ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2157_ (.D(_0024_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.reg_rx_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2158_ (.D(_0025_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.reg_rx_sync[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _2159_ (.D(_0026_),
    .SETN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.reg_rx_sync[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2160_ (.D(_0023_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.bit_done ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2161_ (.D(_0007_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2162_ (.D(_0014_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2163_ (.D(_0015_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2164_ (.D(_0016_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2165_ (.D(_0017_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2166_ (.D(_0018_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2167_ (.D(_0019_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2168_ (.D(_0020_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2169_ (.D(_0021_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2170_ (.D(_0022_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2171_ (.D(_0008_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2172_ (.D(_0009_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2173_ (.D(_0010_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2174_ (.D(_0011_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2175_ (.D(_0012_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2176_ (.D(_0013_),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\u_uart_rx.baud_cnt[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2177_ (.D(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.r_reg[1] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_err_overflow.i_sync_clkb.serial_o ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2178_ (.D(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.serial_i ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.r_reg[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2179_ (.D(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.r_reg[0] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.r_reg[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2180_ (.D(\i_ep_err_overflow.sync_a[1] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_err_overflow.sync_a[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2181_ (.D(\i_ep_err_overflow.i_sync_clkb.serial_o ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_err_overflow.sync_a[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2182_ (.D(\i_ep_err_overflow.s_input_reg_next ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_err_overflow.i_sync_clkb.i_pulp_sync.serial_i ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2183_ (.D(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.r_reg[1] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_err_parity.i_sync_clkb.serial_o ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2184_ (.D(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.serial_i ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.r_reg[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2185_ (.D(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.r_reg[0] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.r_reg[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2186_ (.D(\i_ep_err_parity.sync_a[1] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_err_parity.sync_a[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2187_ (.D(\i_ep_err_parity.i_sync_clkb.serial_o ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_err_parity.sync_a[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2188_ (.D(\i_ep_err_parity.s_input_reg_next ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_err_parity.i_sync_clkb.i_pulp_sync.serial_i ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2189_ (.D(\i_ep_event.i_sync_clkb.i_pulp_sync.r_reg[1] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_event.i_sync_clkb.serial_o ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2190_ (.D(\i_ep_event.i_sync_clkb.i_pulp_sync.serial_i ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_event.i_sync_clkb.i_pulp_sync.r_reg[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2191_ (.D(\i_ep_event.i_sync_clkb.i_pulp_sync.r_reg[0] ),
    .RN(rstn_i),
    .CLK(sys_clk_i),
    .Q(\i_ep_event.i_sync_clkb.i_pulp_sync.r_reg[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2192_ (.D(\i_ep_event.sync_a[1] ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_event.sync_a[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2193_ (.D(\i_ep_event.i_sync_clkb.serial_o ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_event.sync_a[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _2194_ (.D(\i_ep_event.s_input_reg_next ),
    .RN(rstn_i),
    .CLK(periph_clk_i),
    .Q(\i_ep_event.i_sync_clkb.i_pulp_sync.serial_i ));
 gf180mcu_fd_sc_mcu7t5v0__tieh _2195_ (.Z(cfg_ready_o));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2196_ (.ZN(cfg_rx_datasize_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2197_ (.ZN(cfg_rx_datasize_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2198_ (.ZN(cfg_tx_datasize_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2199_ (.ZN(cfg_tx_datasize_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2200_ (.ZN(data_rx_datasize_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2201_ (.ZN(data_rx_datasize_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2202_ (.ZN(data_rx_o[8]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2203_ (.ZN(data_rx_o[9]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2204_ (.ZN(data_rx_o[10]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2205_ (.ZN(data_rx_o[11]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2206_ (.ZN(data_rx_o[12]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2207_ (.ZN(data_rx_o[13]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2208_ (.ZN(data_rx_o[14]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2209_ (.ZN(data_rx_o[15]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2210_ (.ZN(data_rx_o[16]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2211_ (.ZN(data_rx_o[17]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2212_ (.ZN(data_rx_o[18]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2213_ (.ZN(data_rx_o[19]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2214_ (.ZN(data_rx_o[20]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2215_ (.ZN(data_rx_o[21]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2216_ (.ZN(data_rx_o[22]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2217_ (.ZN(data_rx_o[23]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2218_ (.ZN(data_rx_o[24]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2219_ (.ZN(data_rx_o[25]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2220_ (.ZN(data_rx_o[26]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2221_ (.ZN(data_rx_o[27]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2222_ (.ZN(data_rx_o[28]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2223_ (.ZN(data_rx_o[29]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2224_ (.ZN(data_rx_o[30]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2225_ (.ZN(data_rx_o[31]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2226_ (.ZN(data_tx_datasize_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__tiel _2227_ (.ZN(data_tx_datasize_o[1]));
endmodule
