/**
 * Top-level module of the custom clocks.
 * The module displays a 10Hz clock signal through LEDR5, a 1Hz signal through LEDR6, and a 0.1Hz signal through LEDR7.
 * Switch button SW0 resets all resettable modules on low.
 *
 * @param MAX10_CLK1_50 MAX10_CLK1_50 clock signal available in the MAX 10 FPGA.
 * @param SW bits of ten switch buttons SW9 - SW0.
 * @param LEDR output bits corresponding to the board's ten leds LEDR9 - LEDR0.
 **/
module clocks_de10_lite( input  logic       MAX10_CLK1_50,
                         input  logic [9:0] SW,
                         output logic [9:0] LEDR );

  // 1 Hz
  logic roll_over1;
  counter_mod_k_ro #(25) counter1(MAX10_CLK1_50, SW[0], 25'd25000000, roll_over1);
  clock clock1(roll_over1, SW[0], LEDR[6]);
  
  // 10 Hz
  logic roll_over2;
  counter_mod_k_ro #(22) counter2(MAX10_CLK1_50, SW[0], 22'd2500000, roll_over2);
  clock clock2(roll_over2, SW[0], LEDR[5]);
  
  // 0.1 Hz
  logic roll_over3;
  counter_mod_k_ro #(28) counter3(MAX10_CLK1_50, SW[0], 28'd250000000, roll_over3);
  clock clock3(roll_over3, SW[0], LEDR[7]);
  
  
  
  
endmodule
