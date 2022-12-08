module ALU #(
    parameter CONTROL_BITS = 3,
              DATA_WIDTH = 32
)(
    input logic  [CONTROL_BITS-1:0]  alu_control,
    input logic  [DATA_WIDTH-1:0]   operand_a,
    input logic  [DATA_WIDTH-1:0]   operand_b,
    output logic [DATA_WIDTH-1:0]   result,
    output                          result_eq_zero   
);

// assign result_eq_zero = (result == {DATA_WIDTH{1'b0}});     // This needs looking into

always_comb begin
    result = {DATA_WIDTH{1'b0}};
    case (alu_control)
        //the below width casts should work to allow CONTROL_BITS to be changed later on
        //these might need changed if it turns out it doesn't produce the right number
        {CONTROL_BITS'('b000)}: result = operand_a + operand_b; // ADD
        {CONTROL_BITS'('b001)}: result = operand_a - operand_b; // SUBTRACT
        {CONTROL_BITS'('b010)}: result = operand_a & operand_b; // AND
        {CONTROL_BITS'('b011)}: result = operand_a | operand_b; // OR
        // {CONTROL_BITS'('b100)}:
        {CONTROL_BITS'('b101)}: result = {{DATA_WIDTH-1{1'b0}}, operand_a < operand_b}; // SLT
        // {CONTROL_BITS'('b110)}:
        // {CONTROL_BITS'('b111)}:
        3'b110: begin
            if(operand_a == operand_b) result_eq_zero = 1;
            else result_eq_zero = 0;
        end
        default: result = {DATA_WIDTH{1'b0}}; // OUTPUT ZERO

    endcase

end

endmodule
