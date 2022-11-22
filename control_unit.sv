module control_unit(
    input   logic       EQ,
    input   logic       instr[31:0],           
    output  logic       RegWrite,
    output  logic       ALUctrl,
    output  logic       ALUsrc,
    output  logic       ImmSrc,
    output  logic       PCsrc     

);

always_comb
    RegWrite = 0; ALUctrl = 0; ALUsrc = 1; ImmSrc = 0; PCsrc = 0;

    case(instr[6:0], instr[14:12]):
        7'b0010011 && 3'b000 : RegWrite = 1;
        7'b1100011 && 3'b001 : PCsrc = 1; ImmSrc = 1;
endmodule        
