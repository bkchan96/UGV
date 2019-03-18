`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2019 09:21:09 PM
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test();
    reg clk, reset_n, ena, rw;
    reg [6:0] addr;
    reg [7:0] data_wr;
    wire busy, ack_error;
    wire sda, scl;
    wire [6:0] cathode;
    wire [7:0] anode;
    wire dp;
    
    // instantiate DUT
    top DUT(clk, reset_n, ena, addr, rw, data_wr, busy, ack_error, sda, scl, cathode, anode, dp);
    
    // loop clock
    initial begin clk = 1; forever #5 clk = !clk; end
    
    // test
    initial begin
        reset_n = 1;    // no reset
        ena = 0;        // no command latched in
        rw = 1;         // read
        addr = 7'h20;   // target slave is 0x20
        data_wr = 0;    // nothing to write
        #10
        reset_n = 0;    // reset
        #20
        reset_n = 1;    // no reset
        #2500
        ena = 1;        // latch command to read from address 0x20
        #20
        ena = 0;        // unlatch command
    end
    
endmodule
