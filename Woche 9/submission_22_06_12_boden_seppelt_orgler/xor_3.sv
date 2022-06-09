module xor_3 ( input  logic i_in0,
                            i_in1,
                            i_in2,
               output logic o_res );
               
	logic l_res1;
               
	assign l_res1 = i_in0 ^ i_in1;

	assign o_res = l_res1 ^ i_in2;

endmodule


               
