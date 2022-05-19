/**
 * Testbench of the 4-bit ripple-carry adder.
 */
module ripple_carry_adder_4_tb;
  logic [3:0] l_switches;
  logic [6:0] l_lights;

  decoder dut( l_switches, l_lights);

  initial begin
    $dumpfile("dump_decoder.vcd");
    $dumpvars;

    l_switches = 4'b0010;
    #10;
    assert( l_lights === 7'b010_0100 );
    
    l_switches = 4'b1111;
    #10;
    assert( l_lights === 7'b000_1110 );

    // TODO: add additional unit tests

    $finish;
  end
endmodule
