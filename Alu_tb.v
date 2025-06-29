// Testbench for ALU
`timescale 1ns/1ps

module alu_tb;

reg  [3:0] a, b;
reg  [2:0] alu_sel;
wire [3:0] result;
wire carry_out;
wire zero;

alu uut (
    .a(a),
    .b(b),
    .alu_sel(alu_sel),
    .result(result),
    .carry_out(carry_out),
    .zero(zero)
);

initial begin
    $display("OP |   A  |   B  | RESULT | CARRY | ZERO");
    $display("----------------------------------------");
    // Test ADD
    a = 4'd7; b = 4'd6; alu_sel = 3'b000; #10;
    $display("ADD|  %d  |  %d  |   %d   |   %b   |  %b", a, b, result, carry_out, zero);

    // Test SUB
    a = 4'd9; b = 4'd4; alu_sel = 3'b001; #10;
    $display("SUB|  %d  |  %d  |   %d   |   %b   |  %b", a, b, result, carry_out, zero);

    // Test AND
    a = 4'b1100; b = 4'b1010; alu_sel = 3'b010; #10;
    $display("AND| %b | %b |   %b   |   %b   |  %b", a, b, result, carry_out, zero);

    // Test OR
    a = 4'b1100; b = 4'b1010; alu_sel = 3'b011; #10;
    $display("OR | %b | %b |   %b   |   %b   |  %b", a, b, result, carry_out, zero);

    // Test AND-NOT
    a = 4'b1100; b = 4'b1010; alu_sel = 3'b100; #10;
    $display("A&~B| %b | %b |   %b   |   %b   |  %b", a, b, result, carry_out, zero);

    // Test zero flag
    a = 4'b0101; b = 4'b0101; alu_sel = 3'b001; #10; // SUB: result=0
    $display("SUB| %b | %b |   %b   |   %b   |  %b", a, b, result, carry_out, zero);

    $stop;
end

endmodule
