`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    09:24:29 09/08/2014
// Design Name:
// Module Name:    multiplicador_Booth
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////
module multiplicador_Booth(
        input [3:0] a,
        input [3:0] x,
        output [7:0] p
        );

    reg [3:0] _a;
    reg [7:0] A, _A;
    reg [7:0] pReg;

    always @(a) begin
        _a = -a;
        A = {a, 4'b0000};
        _A = {_a,4'b0000};
    end

    always @(a or x) begin
        pReg = 0;
        operacion({x[0],1'b0});
        operacion(x[1:0]);
        operacion(x[2:1]);
        operacion(x[3:2]);
    end

    assign p = pReg;

    task operacion;

        input [1:0] bits;

        case (bits)
            2'b00: begin
                pReg = $signed(pReg)>>>1;
            end
            2'b01: begin
                pReg = pReg + A;
                pReg = $signed(pReg)>>>1;
            end
            2'b10: begin
                pReg = pReg + _A;
                pReg = $signed(pReg)>>>1;
            end
            2'b11: begin
                pReg = $signed(pReg)>>>1;
            end
        endcase

    endtask

endmodule
