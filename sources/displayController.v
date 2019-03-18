`timescale 1ns / 1ps

module displayController(clk, in0, in1, in2, in3, in4, in5, in6, in7, out, outan);
    input clk;
    input [3:0] in0, in1, in2, in3, in4, in5, in6, in7;
    output reg [6:0] out;
    output reg [7:0] outan;
    
    // declare working registers
    reg [3:0] anode;
    reg [17:0] counter = 0;
    reg [3:0] decoded;
    
    // generate clock for display refresh
    always@ (posedge clk) begin
        //250,000 for 400hz
        //lower is faster and less flicker
        if (counter == 100000) begin
            counter = 0;
            if (anode == 7) begin
                anode = 0;
            end
            else begin
                anode = anode + 1;
            end
        end
        else begin
            counter = counter + 1;
        end
    end
    
    // bcd to 7 segment
    always @* begin
        case (decoded)
            0: begin
                out = 7'b1000000;
            end
            1: begin
                out = 7'b1111001;
            end
            2: begin
                out = 7'b0100100;
            end
            3: begin
                out = 7'b0110000;
            end
            4: begin
                out = 7'b0011001;
            end
            5: begin
                out = 7'b0010010;
            end
            6: begin
                out = 7'b0000010;
            end
            7: begin
                out = 7'b1111000;
            end
            8: begin
                out = 7'b0000000;
            end
            9: begin
                out = 7'b0011000;
            end
            default: begin
                out = 7'b1111111;
            end
        endcase
    end
    
    // anode multiplexing
    always @* begin
        case (anode)
            0: begin
                outan = 8'b11111110;
                decoded = in0;
            end
            1: begin
                outan = 8'b11111101;
                decoded = in1;
            end
            2: begin
                outan = 8'b11111011;
                decoded = in2;
            end
            3: begin
                outan = 8'b11110111;
                decoded = in3;
            end
            4: begin
                outan = 8'b11101111;
                decoded = in4;
            end
            5: begin
                outan = 8'b11011111;
                decoded = in5;
            end
            6: begin
                outan = 8'b10111111;
                decoded = in6;
            end
            7: begin
                outan = 8'b01111111;
                decoded = in7;
            end
            default: begin
                outan = 8'b11111111;
                decoded = 7'b1111111;
            end
        endcase
    end
    
endmodule
