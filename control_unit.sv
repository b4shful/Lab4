module control_unit(
    input   logic       EQ,
    input   logic       instr[31:0],           
    output  logic       RegWrite,
    output  logic       ALUctrl[2:0],
    output  logic       ALUsrc,
    output  logic       ImmSrc,
    output  logic       PCsrc     

);

always_comb
    RegWrite = 0; ALUctrl = 000; ALUsrc = 1; ImmSrc = 0; PCsrc = 0;

    inputinstr = {{instr[6:0]}, {instr[14:12]}}
    case(inputinstr):
        10'b0010011000 : RegWrite = 1;
        10'b1100011001 : PCsrc = 1; ImmSrc = 1;
    endcase
endmodule        
