module alu #(parameter N=64) ( input  logic [N-1:0] i_a,
                                                 i_b,
                            input  logic [1:0]   i_alu_ctrl,
                            output logic [N-1:0] o_result,
                            output logic         o_carry_out );

	logic [N-1:0] l_and_result, l_or_result, l_neg_b, l_transform_b, l_sum_result;
	
	assign l_and_result = i_a & i_b;
	assign l_or_result = i_a | i_b;
	assign l_neg_b = ~i_b;
	mux_2 #(N) transform_mux (i_b, l_neg_b, i_alu_ctrl[0], l_transform_b);
	adder #(N) adder(i_a, l_transform_b, i_alu_ctrl[0], l_sum_result, o_carry_out);
	
	mux_4 #(N) mux4 (l_sum_result, l_sum_result, l_and_result, l_or_result, 		i_alu_ctrl, o_result);
	
                            
endmodule
