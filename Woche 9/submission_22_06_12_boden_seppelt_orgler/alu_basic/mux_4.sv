/**
 * Multiplexer with four inputs.
 *
 * @param i_in0 first input.
 * @param i_in1 second input.
 * @param i_in2 third input.
 * @param i_in3 fourth input.
 * @param i_s control signal,
              if 00: in0 is output.
              if 01: in1 is output.
              if 10: in2 is output.
              if 11: in3 is output.
 * @param o_out output.
 **/
module mux_4 #(parameter N=64) ( input  logic [N-1:0] i_in0,
                                                      i_in1,
                                                      i_in2,
                                                      i_in3,
                                 input  logic [1:0]   i_s,
                                 output logic [N-1:0] o_out );
  logic [N-1:0] l_low, l_high;

  mux_2 #(N) mux_low( i_in0,
                      i_in1,
                      i_s[0],
                      l_low );

  mux_2 #(N) mux_high( i_in2,
                       i_in3,
                       i_s[0],
                       l_high );

  mux_2 #(N) mux_final( l_low,
                        l_high,
                        i_s[1],
                        o_out );
endmodule