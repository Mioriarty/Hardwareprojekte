module stopwatch_de10_lite( input  logic       MAX10_CLK1_50,
                            input  logic [9:0] SW,
                            output logic [6:0] HEX0, HEX2, HEX3, HEX4, HEX5,
                            output logic [7:0] HEX1,
                            output logic [9:0] LEDR );
  logic [21:0] l_mod_s_01;
  logic [24:0] l_mod_s_1;
  logic [27:0] l_mod_s_10;
  logic [30:0] l_mod_m_1;
  logic [33:0] l_mod_m_10;

  logic l_reset;
  logic l_clk_50mhz;

  // rollover signals: 0.1s, 1s, 10s, 1m, 10m
  logic l_ro_s_01;
  logic l_ro_s_1;
  logic l_ro_s_10;
  logic l_ro_m_1;
  logic l_ro_m_10;
  
  // clock signals: 0.1s, 1s, 10s, 1m, 10m
  logic l_clk_s_01;
  logic l_clk_s_1;
  logic l_clk_s_10;
  logic l_clk_m_1;
  logic l_clk_m_10;
  
  // counter outputs: 0.1s, 1s, 10s, 1m, 10m
  logic [3:0] l_count_s_01;
  logic [3:0] l_count_s_1;
  logic [3:0] l_count_s_10;
  logic [3:0] l_count_m_1;
  logic [3:0] l_count_m_10;

  // assign input clock to internal signal
  assign l_clk_50mhz = MAX10_CLK1_50;
  
  // assign reset to disabled switch button 0
  assign l_reset = ~SW[0];

  // k for mod k computation w.r.t. 50Hz clock: 0.1s, 1s, 10s
  assign l_mod_s_01 = 22'd2500000;
  assign l_mod_s_1  = 25'd25000000;
  assign l_mod_s_10 = 28'd250000000;
  assign l_mod_m_1  = 31'd1500000000;
  assign l_mod_m_10 = 34'd15000000000;

  // 0.1s clock
  counter_mod_k_ro #(22) counter_over_01s( l_clk_50mhz,
                                           l_reset,
                                           l_mod_s_01,
                                           l_ro_s_01 );

  clock clock_01s( l_ro_s_01,
                   l_reset,
                   l_clk_s_01 );
                   
  counter_mod_k_count #(4) counter_dec_01s(l_clk_s_01, l_reset, 4'd10, l_count_s_01);
  
  decoder decode_01s(l_count_s_01, HEX0);
  
  
  

  // 1s clock
  counter_mod_k_ro #(25) counter_over_1s( l_clk_50mhz,
                                          l_reset,
                                          l_mod_s_1,
                                          l_ro_s_1 );

  clock clock_1s( l_ro_s_1,
                  l_reset,
                  l_clk_s_1 );
                  
  counter_mod_k_count #(4) counter_dec_1s(l_clk_s_1, l_reset, 4'd10, l_count_s_1);
  
  decoder decode_1s(l_count_s_1, HEX1[6:0]);
  assign HEX1[7] = 1'b1;

  // 10s clock
  counter_mod_k_ro #(28) counter_over_10s( l_clk_50mhz,
                                           l_reset,
                                           l_mod_s_10,
                                           l_ro_s_10 );

  clock clock_10s( l_ro_s_10,
                   l_reset,
                   l_clk_s_10 );
                   
  counter_mod_k_count #(4) counter_dec_10s(l_clk_s_10, l_reset, 4'd6, l_count_s_10);
  
  decoder decode_10s(l_count_s_10, HEX2);
  
  
  // 1m clock
  counter_mod_k_ro #(31) counter_over_1m( l_clk_50mhz,
                                           l_reset,
                                           l_mod_m_1,
                                           l_ro_m_1 );

  clock clock_1m( l_ro_m_1,
                   l_reset,
                   l_clk_m_1 );
                   
  counter_mod_k_count #(4) counter_dec_1m(l_clk_m_1, l_reset, 4'd10, l_count_m_1);
  
  decoder decode_1m(l_count_m_1, HEX4);
  
  
  // 10m clock
  counter_mod_k_ro #(34) counter_over_10m( l_clk_50mhz,
                                           l_reset,
                                           l_mod_m_10,
                                           l_ro_m_10 );

  clock clock_10m( l_ro_m_10,
                   l_reset,
                   l_clk_m_10 );
                   
  counter_mod_k_count #(4) counter_dec_10m(l_clk_m_10, l_reset, 4'd10, l_count_m_10);
  
  decoder decode_10m(l_count_m_10, HEX5);

  // assign LEDs to clocks: 0.1s, 1s, 10s
  assign LEDR[5] = l_clk_s_01;
  assign LEDR[6] = l_clk_s_1;
  assign LEDR[7] = l_clk_s_10;
  assign LEDR[8] = l_clk_m_1;
  assign LEDR[9] = l_clk_m_10;
  
  // blinking dash
  assign HEX3 = {l_clk_s_1, 5'b11111};
  
endmodule
