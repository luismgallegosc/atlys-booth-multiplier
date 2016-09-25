`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   10:10:45 09/08/2014
// Design Name:   multiplicador_Booth
// Module Name:   C:/Users/Luis/XilinxWorkspace/Lab_03/multiplicador_Booth_tf.v
// Project Name:  Lab_03
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: multiplicador_Booth
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////

module multiplicador_Booth_tf;

    // Inputs
    reg [3:0] a;
    reg [3:0] x;

    // Outputs
    wire [7:0] p;

    // Instantiate the Unit Under Test (UUT)
    multiplicador_Booth uut (
        .a(a),
        .x(x),
        .p(p)
    );

    initial begin
        // Initialize Inputs
        a = 0;
        x = 0;

        // Wait 100 ns for global reset to finish
        #10;

        // Add stimulus here
            a <= 7;
            x <= 3;
        #10 a <= 4;
            x <= -4;
        #10 a <= -3;
            x <= 5;
        #10 a <= -5;
            x <= -6;

        #10 $finish(0);
    end

endmodule
