module ALU #(
    parameter CONTROL_BITS = 3,
              DATA_WIDTH = 32
)(
    input logic  [MUX_BITS-1:0]      alu_control,
    input logic  [DATA_WIDTH-1:0]    operand_a,
    input logic  [DATA_WIDTH-1:0]    operand_b,
    output logic [DATA_WIDTH-1:0]    result,
    output                           result_eq_zero   
);

assign result_eq_zero = (result == {DATA_WIDTH{1'b0}});

always_comb begin
    result = {DATA_WIDTH{1'b0}};
    case (alu_control)
        //the below width casts should work to allow mux_bits to be changed later on
        //these might need changed if it turns out it doesn't produce the right number
        {MUX_BITS'('b000)}: result = operand_a + operand_b; // ADD
        {MUX_BITS'('b001)}: result = operand_a - operand_b; // SUBTRACT
        {MUX_BITS'('b010)}: result = operand_a & operand_b; // AND
        {MUX_BITS'('b011)}: result = operand_a | operand_b; // OR
        // {MUX_BITS'('b100)}:
        {MUX_BITS'('b101)}: result = {{DATA_WIDTH-1{1'b0}}, operand_a < operand_b}; // SLT
        // {MUX_BITS'('b110)}:
        // {MUX_BITS'('b111)}:
        default:
            result = {DATA_WIDTH{1'b0}}; // OUTPUT ZERO
    endcase
end

endmodule
