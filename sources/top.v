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
    
    // instantiate 7 segment display for display data read from slave
    displayController u_displayController(
        .clk(clk),
        .in0(data_rd[0]),
        .in1(data_rd[1]),
        .in2(data_rd[2]),
        .in3(data_rd[3]),
        .in4(data_rd[4]),
        .in5(data_rd[5]),
        .in6(data_rd[6]),
        .in7(data_rd[7]),
        .out(cathode),
        .outan(anode));
    
    // turn off dp on 7 segment displays
    assign dp = 1'b1;
    
endmodule
