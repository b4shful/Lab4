module inst_mem  #(
    parameter   ADDRESS_WIDTH = 32,
                DATA_WIDTH = 32
)(
    input  logic    [ADDRESS_WIDTH-1:0]    PC,
    output logic    [DATA_WIDTH-1:0]       instr
);

logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];

initial begin
        $display("Loading rom.");
        $readmemh("instr_mem.mem", rom_array);
end;

always_comb
    //output combinational
    instr <= rom_array [PC];
    instr = addr[PC];

endmodule
