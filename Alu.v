// ALU module: supports ADD, SUB, AND, OR, AND-NOT
module alu (
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] alu_sel,
    output reg [3:0] result,
    output reg carry_out,
    output reg zero
);

always @(*) begin
    carry_out = 0;
    case (alu_sel)
        3'b000: {carry_out, result} = a + b;          // Addition
        3'b001: {carry_out, result} = a - b;          // Subtraction
        3'b010: result = a & b;                       // AND
        3'b011: result = a | b;                       // OR
        3'b100: result = a & ~b;                      // AND NOT
        default: result = 4'b0000;
    endcase
    zero = (result == 4'b0000) ? 1'b1 : 1'b0;
end

endmodule
