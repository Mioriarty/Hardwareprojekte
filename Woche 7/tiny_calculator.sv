/**
 * Top-level entry of the tiny calculator.
 * The calculator adds the 4-bit binary numbers in SW[3:0] and SW[7:4].
 * The two inputs are shown on displays HEX0 and HEX1.
 * The result of the addition is shown on displays HEX2 and HEX3.
 *
 * @param SW bits of switch buttons SW7, SW6, SW5, SW4, SW3, SW2, SW1 and SW0.
 * @param HEX0 output bits which drive the seven-segment display HEX0.
 * @param HEX1 output bits which drive the seven-segment display HEX1.
 * @param HEX2 output bits which drive the seven-segment display HEX2.
 * @param HEX3 output bits which drive the seven-segment display HEX3.
 **/
module tiny_calculator( input  logic [7:0] SW,
                        output logic [6:0] HEX0,
                        output logic [6:0] HEX1,
                        output logic [6:0] HEX2,
                        output logic [6:0] HEX3 );
     
     decoder dec1(SW[3:0], HEX0);
     decoder dec2(SW[7:4], HEX1);     
     
     logic       inp_carry;
     logic [3:0] out_carry;
     logic [3:0] result;
     
     assign inp_carry = 1'b0;
     assign out_carry[3:1] = 3'b000;
     
     ripple_carry_adder_4 rca(SW[3:0], SW[7:4], inp_carry, result, out_carry[0:0]);
     
     decoder dec3(result, HEX2);
     
     decoder dec4(out_carry, HEX3);
                        
  
endmodule
