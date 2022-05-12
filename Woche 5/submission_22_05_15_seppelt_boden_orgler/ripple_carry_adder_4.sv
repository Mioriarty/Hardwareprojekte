/**
 * 4-bit ripple-carry adder.
 *
 * @param i_a input A.
 * @param i_b input B.
 * @param i_carry_in carry in.
 * @param o_s sum.
 * @param o_carry_out carry out.
 **/
module ripple_carry_adder_4( input  logic [3:0] i_a,
                             input  logic [3:0] i_b,
                             input  logic       i_carry_in,
                             output logic [3:0] o_s,
                             output logic       o_carry_out );
  logic l_carry_1;
  logic l_carry_2;
  logic l_carry_3;
  full_adder_1 adder_0( i_a[0:0],
                        i_b[0:0],
                        i_carry_in,
                        o_s[0:0],
                        l_carry_1 );
                        
  full_adder_1 adder_1( i_a[1:1],
                        i_b[1:1],
                        l_carry_1,
                        o_s[1:1],
                        l_carry_2 );
                        
  full_adder_1 adder_2( i_a[2:2],
                        i_b[2:2],
                        l_carry_2,
                        o_s[2:2],
                        l_carry_3 );
                        
  full_adder_1 adder_3( i_a[3:3],
                        i_b[3:3],
                        l_carry_3,
                        o_s[3:3],
                        o_carry_out );
endmodule
