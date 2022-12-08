module sign_extend #(
    parameter WIDTH = 32
)(  
    // input  logic [WIDTH-1:0]    instr,      
    input   logic [16:0]        instr,
    input  logic                ImmSrc,
    output logic [WIDTH-1:0]    ImmOp
);

always_comb begin
    case(ImmSrc)
        // 1'b0: ImmOp = {{20{instr[31]}}, instr[31:20]};                   // addi
        // 1'b1: ImmOp = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};    // branch
        1'b0: ImmOp = {{20{instr[16]}}, instr[16:5]};                                //add
        1'b1: ImmOp = {{20{instr[16]}}, instr[0], instr[15:10], instr[4:1], 1'b0};   //branch
    endcase
end
endmodule
