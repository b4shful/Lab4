module PC #(
    parameter WIDTH = 32
)(
    //interface signals
    input logic clk,
    input logic rst,
    input logic pcsrc,
    input logic [WIDTH-1:0] ImmOp,
    output logic [WIDTH-1:0] count
);

always_ff @ (posedge clk)
    if (rst) count <= {WIDTH{1'b0}};

    else if (pcsrc == 1'b1) count <= count + {ImmOp};
    else if (pcsrc == 1'b0) count <= count + 32'b100;

endmodule 

