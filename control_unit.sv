module control_unit(
    input  logic        EQ,
    // input  logic [31:0] instr,           
    input logic [9:0]   instr,      // equals {func3, opcode}
    output logic        RegWrite,
    output logic [2:0]  ALUctrl,
    output logic        ALUsrc,
    output logic        ImmSrc,
    output logic        PCsrc     

);

always_comb
    // RegWrite = 0; 
    // ALUctrl = 000; 
    // ALUsrc = 1; 
    // ImmSrc = 0; 
    // PCsrc = 0;

    // inputinstr = {{instr[6:0]}, {instr[14:12]}}
    case(instr)
        10'b0000010011: begin   // addi
            RegWrite = 1;   // Write the result to register
            ALUsrc = 1;     // The second operand for the alu comes from the sign extend unit
            ALUctrl = 3'b000;    // The ALU operation will be an addition
            ImmSrc = 0;     // This tells the sign extend unit that the immediate value will come from {20'b0, instr[31:20]}
            PCsrc = 0;
        end
        10'b0011100011: begin   // bne
            RegWrite = 0;   // The register doens't need to be written to for a bne instruction
            ImmSrc = 1;     // This tells the sign extend unit that the immediate value will come from {19'b0, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0}
            ALUctrl = 3'b110;    // The operation will be a comparison
            ALUsrc = 0;
            if(EQ == 0) PCsrc = 1;  // Since two operands aren't equal we branch
            else PCsrc = 0;
        end
        default: begin
            RegWrite = 0;   // If the instruction is unknown this ensures we don't overwrite the register file
            PCsrc = 0;      // And this ensures that program counter just moves onto the next instruction rather than randomly branching
            ALUctrl = 3'b0;
            ALUsrc = 0;
            ImmSrc = 0;
        end
    endcase
endmodule       
