module register_file #(
    parameter ADDRESS_WIDTH = 5, // 5 bits required to store registers x0 up to x31
              DATA_WIDTH = 32 // each register contains 32 bits
)(
    input logic                     clk,
    input logic                     we3,
    input logic [ADDRESS_WIDTH-1:0] a1, // RD1 address
    input logic [ADDRESS_WIDTH-1:0] a2, // RD2 address
    input logic [ADDRESS_WIDTH-1:0] a3, // WD3 address
    input logic [DATA_WIDTH-1:0]    wd3, // wd3 data input
    output logic [DATA_WIDTH-1:0]   rd1, // rd1 data output
    output logic [DATA_WIDTH-1:0]   rd2  // rd2 data output
    output logic [DATA_WIDTH-1:0]   a0 // permanent access to x10 register for the purposes of this lab    
);

/* 
create array which essentially is the register file
line below creates an array with (2^ADDRESS_WIDTH)-1 registers each having [DATA_WIDTH-1] bit outputs
in SystemVerilog x**y is x to power of y (can't use ^ for powers as ^ represents XOR)
for parameter defaults address_width = 5 and data_width = 32:
    array created with 32 entries with address bits [4:0], each entry has data bits [31:0]
*/
logic [DATA_WIDTH-1:0] regfile_array [2**ADDRESS_WIDTH-1:0];

// PICK ONE FROM THIS SECTION ====

    // assign all register values to 0
    // initial regfile_array = '{default:0};
  
    // assign register x0 to 0
    initial regfile_array[0] = {DATA_WIDTH{1'b0}};   

// ===============================

// "All read ports in both instruction, register file and data memory are asynchronous
// meaning that the read data is available as soon as the address is presented"
// read logic is therefore combinational

// combinational, asynchronous
// assign read ports
assign rd1 = regfile_array[a1];
assign rd2 = regfile_array[a2];
assign a0 = regfile_array[10]; // a0 output will show contents of x10 register for purposes of this lab

// write assignments happen on positive clock edge
always_ff @(posedge clk) begin
    // if write enabled
    if (we3 == 1'b1)
        // only write if not writing to register x0
        if(a3 != {DATA_WIDTH{1'b0}}) 
            // synchronous assignment of write data input to register specified in a3
            regfile_array[a3] <= wd3;
end

endmodule
