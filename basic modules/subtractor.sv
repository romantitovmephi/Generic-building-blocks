module subtractor #(parameter N = 8)
                  (input logic [Nā1:0] a, b,
                   output logic [Nā1:0] y);
assign y = a ā b; 
endmodule