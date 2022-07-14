module extend(input logic [31:7] instr, 
              input logic [1:0] immsrc,
              output logic [31:0] immext);
  always_comb 
    case(immsrc)
   // тип I
  2'b00: immext = {{20{instr[31]}},
                       instr[31:20]};
  // тип S (запись в память)
  2'b01: immext = {{20{instr[31]}}, 
                       instr[31:25], 
							  instr[11:7]};
  // тип B (условный переход)
  2'b10: immext = {{20{instr[31]}},
                       instr[7], 
							  instr[30:25], 
						     instr[11:8], 1'b0};
// тип J (jal)
2'b11: immext = {{12{instr[31]}},
                     instr[19:12], 
							instr[20], 
							instr[30:21], 1'b0};
default: immext = 32'bx; 
// не определено
  endcase 
endmodule