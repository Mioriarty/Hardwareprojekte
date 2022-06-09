/**
 * ALU NZCV
 **/
module alu_nzcv #(parameter N=64) ( input  logic [N-1:0] i_a,
                                                         i_b,
                                    input  logic [1:0]   i_alu_ctrl,
                                    output logic [N-1:0] o_result,
                                    output logic [3:0]   o_nzcv );
  logic [N-1:0] l_b_tmp;
  logic [N-1:0] l_sum;
  logic [N-1:0] l_res_10;
  logic [N-1:0] l_res_11;
  logic         l_adder_carry;
  logic         l_compared_signs;
  logic         l_disable_ov;

  mux_2 #(N) mux_b( i_b,
                    ~i_b,
                    i_alu_ctrl[0],
                    l_b_tmp );
                    

  adder #(N) adder_ab( i_a,
                       l_b_tmp,
                       i_alu_ctrl[0],
                       l_sum,
                       l_adder_carry );

  assign l_res_10 = i_a & i_b;
  assign l_res_11 = i_a | i_b;

  mux_4 #(N) mux_result( l_sum,
                         l_sum,
                         l_res_10,
                         l_res_11,
                         i_alu_ctrl,
                         o_result );
                         
  assign o_nzcv[2] = &(~o_result);
  assign o_nzcv[3] = o_result[N-1];
  assign o_nzcv[1] = l_adder_carry & ~i_alu_ctrl[1];
  
  assign l_compared_signs = l_sum[N-1] ^ i_a[N-1];
  xor_3 ov_xor (i_a[N-1], i_b[N-1], i_alu_ctrl[0], l_disable_ov);
  
  assign o_nzcv[0] = ~i_alu_ctrl[1] & l_compared_signs & ~l_disable_ov;
  
endmodule
