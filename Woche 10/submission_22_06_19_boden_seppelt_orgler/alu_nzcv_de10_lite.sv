/**
 * Top-level module of the extended alu with condition flags.
 * The alu operates on the 4-bit binary numbers in SW[3:0] and SW[7:4].
 * The two input numbers are shown on displays HEX0 and HEX1.
 * The control signal is shown using LEDR1 and LEDR0.
 * The result is shown on display HEX2.
 * The NZCV flags are shown on the leds LEDR9, LEDR8, LEDR7 and LEDR6.
 *
 * @param SW bits of ten switch buttons SW9 - SW0.
 * @param LEDR output bits corresponding to the board's ten leds LEDR9 - LEDR0.
 * @param HEX0 output bits which drive the seven-segment display HEX0.
 * @param HEX1 output bits which drive the seven-segment display HEX1.
 * @param HEX2 output bits which drive the seven-segment display HEX2.
 **/
module alu_nzcv_de10_lite( input  logic [9:0] SW,
                           output logic [9:0] LEDR,
                           output logic [6:0] HEX0,
                           output logic [6:0] HEX1,
                           output logic [6:0] HEX2 );
  
  decoder decoder0 (SW[3:0], HEX0);
  decoder decoder1 (SW[7:4], HEX1);
  
  assign LEDR[1:0] = SW[9:8];
  
  logic [3:0] alu_result;
  logic [3:0] nzcv;
  
  alu_nzcv #(4) alu (SW[3:0], SW[7:4], SW[9:8], alu_result, nzcv);
  
  assign LEDR[9:6] = nzcv;  
  
  
  decoder decoder2 (alu_result, HEX2); 
endmodule
