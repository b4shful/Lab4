module ALU_tester_toplevel #(
    parameter CONTROL_BITS = 3,
              DATA_WIDTH = 32,
              ADDRESS_WIDTH = 5
)(
    input logic [DATA_WIDTH-1:0]    ImmOp,
    input logic                     ALUSrc,
    input logic [CONTROL_BITS-1:0]  ALUControl,
    input logic                     RegWrite,
    input logic [ADDRESS_WIDTH-1:0] rs1, // register source 1 (read)
    input logic [ADDRESS_WIDTH-1:0] rs2, // register source 2 (read)
    input logic [ADDRESS_WIDTH-1:0] rd, // register destination (write)
    input logic                     clk,

    output logic [DATA_WIDTH-1:0]   ALUout,
    output logic [DATA_WIDTH-1:0]   a0,
    output logic                    result_eq_zero
);

logic [DATA_WIDTH-1:0] ALUop1; // same line as regOp1
logic [DATA_WIDTH-1:0] ALUop2;
logic [DATA_WIDTH-1:0] regOp2;

register_file #(ADDRESS_WIDTH, DATA_WIDTH) regfile (
    .clk (clk),
    .we3 (RegWrite),
    .a1 (rs1),
    .a2 (rs2),
    .a3 (rd),
    .wd3 (ALUout),
    .rd1 (ALUop1),
    .rd2 (regOp2),
    .a0 (a0)
);

ALU_op2source_mux #(DATA_WIDTH) mux (
    .sel (ALUSrc),
    .in0 (regOp2),
    .in1 (ImmOp),
    .out (ALUop2)
);

ALU #(CONTROL_BITS, DATA_WIDTH) alu (
    .alu_control (ALUControl),
    .operand_a (ALUop1),
    .operand_b (ALUop2),
    .result (ALUout),
    .result_eq_zero (result_eq_zero)
);

endmodule
