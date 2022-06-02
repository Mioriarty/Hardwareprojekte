/**
 * Testbench of 4:1 multiplexer.
 **/
module mux_4_tb;
  logic [3:0] l_a, l_b, l_c, l_d, l_o;
  logic [1:0]      l_s;
  mux_4 #(4) dut ( l_a,
                   l_b,
                   l_c,
                   l_d,
                   l_s,
                   l_o );
  initial begin
  
    l_a = 4'b0000;
    l_b = 4'b0001;
    l_c = 4'b0010;
    l_d = 4'b0011;
    l_s = 2'b00;
    #10;
    assert( l_o === 4'b0000 );
    
    l_a = 4'b0000;
    l_b = 4'b0001;
    l_c = 4'b0010;
    l_d = 4'b0011;
    l_s = 2'b01;
    #10;
    assert( l_o === 4'b0001 );
    
    l_a = 4'b0000;
    l_b = 4'b0001;
    l_c = 4'b0010;
    l_d = 4'b0011;
    l_s = 2'b10;
    #10;
    assert( l_o === 4'b0010 );
    
    l_a = 4'b0000;
    l_b = 4'b0001;
    l_c = 4'b0010;
    l_d = 4'b0011;
    l_s = 2'b11;
    #10;
    assert( l_o === 4'b0011 );
    
  end
endmodule
