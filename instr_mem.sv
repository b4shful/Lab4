module instr_mem  #(
    parameter   ADDRESS_WIDTH = 32,
                DATA_WIDTH = 8
)(
    input  logic [ADDRESS_WIDTH-1:0]    PC,
    output logic [ADDRESS_WIDTH-1:0]    instr
);

logic [DATA_WIDTH-1:0] instr_mem [27:0];

initial begin
        $display("Loading rom.");
        $readmemh("instr_mem.mem", instr_mem);
end;

assign instr = {{instr_mem[PC]}, {instr_mem[PC+1]}, {instr_mem[PC+2]}, {instr_mem[PC+3]}};

endmodule
