module sign_extend #(
    parameter WIDTH = 32,
)(  
    input   logic       intr[WIDTH-1:20],      
    input   logic       ImmSrc,
    output  logic       ImmOp
);

always_comb
    case(ImmSrc):
        //add
        1b'0: ImmOp = {20*instr[31], instr[30:0]}
        //branch
        1b'1: ImmOp = {31*instr[31], instr[7], instr[30:25], instr[11:8]}

endmodule
