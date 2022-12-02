module sign_extend #(
    parameter WIDTH = 32,
)(  
    input   logic       intr[WIDTH-1:20],      
    input   logic       ImmSrc,
    output  logic       ImmOp[WIDTH-1:0]
);

always_comb
    case(ImmSrc):

        default: ImmOp = 32b'0
        //add
        1b'0: ImmOp = {{21instr[31]}, instr[30:25], instr[24:20]}
        //branch
        1b'1: ImmOp = {{31instr[31]}, instr[7], instr[30:25], instr[11:8], 1'b0}

    endcase
endmodule
