module xor_3_tb;

	logic l_in0, l_in1, l_in2, l_res;
	xor_3 dut ( l_in0, l_in1, l_in2, l_res);

	initial begin
	$dumpfile("dump_xor_3.vcd");
	$dumpvars;
	
	l_in0 = 1'b0;
	l_in1 = 1'b0;
	l_in2 = 1'b0;
	#10;
	assert( l_res === 1'b0 );
	
	l_in0 = 1'b1;
	l_in1 = 1'b0;
	l_in2 = 1'b0;
	#10;
	assert( l_res === 1'b1 );
	
	l_in0 = 1'b0;
	l_in1 = 1'b1;
	l_in2 = 1'b0;
	#10;
	assert( l_res === 1'b1 );
	
	l_in0 = 1'b0;
	l_in1 = 1'b0;
	l_in2 = 1'b1;
	#10;
	assert( l_res === 1'b1 );
	
	l_in0 = 1'b1;
	l_in1 = 1'b1;
	l_in2 = 1'b0;
	#10;
	assert( l_res === 1'b0 );
	
	l_in0 = 1'b0;
	l_in1 = 1'b1;
	l_in2 = 1'b1;
	#10;
	assert( l_res === 1'b0 );
	
	l_in0 = 1'b1;
	l_in1 = 1'b0;
	l_in2 = 1'b1;
	#10;
	assert( l_res === 1'b0 );
	
	l_in0 = 1'b1;
	l_in1 = 1'b1;
	l_in2 = 1'b1;
	#10;
	assert( l_res === 1'b1 );
	
	$finish;
	end
endmodule
	
	

