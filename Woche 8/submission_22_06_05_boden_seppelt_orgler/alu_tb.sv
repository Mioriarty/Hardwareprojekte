/**
 * Testbench of ALU.
 **/
module alu_tb;
  logic [7:0] l_a, l_b, l_result;
  logic [1:0]      l_alu_ctrl;
  logic		   l_carry_out;
  alu #(8) dut ( l_a,
                   l_b,
                   l_alu_ctrl,
                   l_result,
                   l_carry_out);
  initial begin
    $dumpfile("dump_alu.vcd");
    $dumpvars;
  
    l_a = 8'b0000_0000;
    l_b = 8'b0000_0000;
    l_alu_ctrl = 2'b00;
    #10;
    assert( l_result === 8'b0000_0000 );
    assert( l_carry_out === 1'b0 );
    
    l_a = 8'b1011_1101;
    l_b = 8'b1010_0101;
    l_alu_ctrl = 2'b00;
    #10;
    assert( l_result === 8'b0110_0010 );
    assert( l_carry_out === 1'b1 );

    l_a = 8'b1011_1101;
    l_b = 8'b1010_0101;
    l_alu_ctrl = 2'b01;
    #10;
    assert( l_result === 8'b0001_1000 );
    assert( l_carry_out === 1'b1 );
    
    l_a = 8'b1011_1101;
    l_b = 8'b1010_0101;
    l_alu_ctrl = 2'b10;
    #10;
    assert( l_result === 8'b1010_0101 );
    assert( l_carry_out === 1'b1 );
    
    l_a = 8'b1011_1101;
    l_b = 8'b1010_0101;
    l_alu_ctrl = 2'b11;
    #10;
    assert( l_result === 8'b1011_1101 );
    assert( l_carry_out === 1'b1 );
    
    $finish;
  end
endmodule
