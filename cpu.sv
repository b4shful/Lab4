module cpu #(
    parameter DATA_WIDTH = 32
) (
    input logic         clk,
    input logic         rst,
    output logic [31:0] a0
);

logic [DATA_WIDTH-1:0] pc;
logic [DATA_WIDTH-1:0] branch_pc;
logic [DATA_WIDTH-1:0] inc_pc;
logic [DATA_WIDTH-1:0] next_pc;
logic                  pc_src;
logic [DATA_WIDTH-1:0] instr;
logic                  eq;
logic                  reg_write;
logic                  alu_ctrl;
logic                  alu_src;
logic                  imm_src;
logic [DATA_WIDTH-1:0] imm_op;
logic [4:0]            rs1;
logic [4:0]            rs2;
logic [4:0]            rd;
logic [DATA_WIDTH-1:0] alu_out;
logic [DATA_WIDTH-1:0] alu_op1;
logic [DATA_WIDTH-1:0] alu_op2;
logic [DATA_WIDTH-1:0] reg_op2;

always_comb begin
    inc_pc = pc + 4;
    branch_pc = pc + imm_op;
    next_pc = pc_src ? branch_pc : inc_pc;
    rs1 = instr[19:15];
    rs2 = instr[24:20];
    rd = instr[11:7];
    // alu_op2 = alu_src ? imm_op : reg_op2;
end

pc_reg prog_counter_reg(
    .clk (clk),
    .rst (rst),
    .pc (pc),
    .next_pc (next_pc)
);
instr_mem instruction_mem(
    .PC (pc),
    .instr (instr)
);
control_unit contr_unit(
    .EQ (eq),
    .instr (instr),
    .RegWrite (reg_write),
    .ALUctrl (alu_ctrl),
    .ALUsrc (alu_src),
    .ImmSrc (imm_src),
    .PCsrc (pc_src)
);
sign_extend sgn_ext(
    .intr (instr),
    .ImmSrc (imm_src),
    .ImmOp (imm_op)
);
reg_file register_file(
    .clk (clk),
    .a1 (rs1),
    .a2 (rs2),
    .a3 (rd),
    .we3 (reg_write),
    .wd3 (alu_out),
    .rd1 (alu_op1),
    .rd2 (reg_op2),
    .a0 (a0)
);
ALU_op2source_mux alu_mux(
    .sel (alu_src),
    .in0 (reg_op2),
    .in1 (imm_op),
    .out (alu_op2)
);
ALU alu(
    .operand_a (alu_op1),
    .operand_b (alu_op2),
    .alu_control (alu_ctrl),
    .result (alu_out),
    .result_eq_zero (eq)
);

endmodule
