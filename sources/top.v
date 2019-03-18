`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2019 08:50:38 PM
// Design Name: 
// Module Name: top
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


module top(clk, reset_n, ena, addr, rw, data_wr, busy, ack_error, sda, scl, cathode, anode, dp);
    input clk, reset_n, ena, rw;
    input [6:0] addr;
    input [7:0] data_wr;
    output busy, ack_error;
    inout sda, scl;
    output [6:0] cathode;
    output [7:0] anode;
    output dp;
    
    // declare intermediate signal
    wire [7:0] data_rd;
    wire [7:0] decoded_gray;
    wire [11:0] BCD;
    
    // instantiate i2c master controller
    i2c_master #(
        .input_clk(100_000_000), //input clock speed from user logic in Hz
        .bus_clk(100_000))      //speed the i2c bus (scl) will run at in Hz
        u_i2c_master (   
        .clk(clk),              //system clock
        .reset_n(reset_n),      //active low reset
        .ena(ena),              //latch in command
        .addr(addr),            //address of target slave
        .rw(rw),                //'0' is write, '1' is read
        .data_wr(data_wr),      //data to write to slave
        .busy(busy),            //indicates transaction in progress
        .data_rd(data_rd),      //data read from slave
        .ack_error(ack_error),  //flag if improper acknowledge from slave
        .sda(sda),              //serial data output of i2c bus
        .scl(scl));             //serial clocl output of i2c bus
    
    // decode the gray code from the encoder
    gray_decoder u_gray_decoder(.in(data_rd), .out(decoded_gray));
    
    // Convert binary to BCD
    B2BCD u_B2BCD(.clk(clk), .B(decoded_gray), .BCD(BCD));
    
    // instantiate 7 segment display for display data read from slave
    displayController u_displayController(
        .clk(clk),
        .in0(BCD[3:0]),
        .in1(BCD[7:4]),
        .in2(BCD[11:8]),
        .in3(4'b1111),
        .in4(4'b1111),
        .in5(4'b1111),
        .in6(4'b1111),
        .in7(4'b1111),
        .out(cathode),
        .outan(anode));
    
    // turn off dp on 7 segment displays
    assign dp = 1'b1;
    
endmodule
