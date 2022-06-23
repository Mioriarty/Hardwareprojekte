/**
 * Testbench of the clock derived from a counter's rollover signal.
 **/
module clock_tb;
  logic l_reset;
  logic l_roll_over;
  logic l_clk;

  // reset
  initial
    begin
      l_reset <= 0;
      #3;
      l_reset <= 1;
    end

  clock dut( l_roll_over,
             l_reset,
             l_clk );

  initial begin
    $dumpfile("dump_clock.vcd");
    $dumpvars;
    
    l_roll_over = 1'b0;
    #5;
    assert( l_clk === 1'b1 );
    
    l_roll_over = 1'b1;
    #10;
    assert( l_clk === 1'b0 );
    
    l_roll_over = 1'b0;
    #10;
    assert( l_clk === 1'b0 );
    
    l_roll_over = 1'b1;
    #10;
    assert( l_clk === 1'b1 );
    
    l_roll_over = 1'b0;
    #10;
    assert( l_clk === 1'b1 );
    
    l_roll_over = 1'b1;
    #10;
    assert( l_clk === 1'b0 );
    
    l_roll_over = 1'b0;
    #10;
    assert( l_clk === 1'b0 );
    
    l_roll_over = 1'b1;
    #10;
    assert( l_clk === 1'b1 );
    
    l_roll_over = 1'b0;
    #10;
    assert( l_clk === 1'b1 );
    
    l_roll_over = 1'b1;
    l_reset = 1'b0;
    #10;
    assert( l_clk === 1'b1 );
    

    $finish;
  end
endmodule
