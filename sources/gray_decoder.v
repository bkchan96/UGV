`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 12:51:05 PM
// Design Name: 
// Module Name: gray_decoder
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


module gray_decoder(in, out);
    input [7:0] in;
    output reg [7:0] out;

    // reverse bit order for input
    wire [7:0] in_reverse;
    assign in_reverse = {
        in[0],
        in[1],
        in[2],
        in[3],
        in[4],
        in[5],
        in[6],
        in[7]};
    
    // create ROM block
    always @* begin
        case (in_reverse)
            8'b01111111: out = 0  ; // 127
            8'b00111111: out = 1  ; // 63
            8'b00111110: out = 2  ; // 62
            8'b00111010: out = 3  ; // 58
            8'b00111000: out = 4  ; // 56
            8'b10111000: out = 5  ; // 184
            8'b10011000: out = 6  ; // 152
            8'b00011000: out = 7  ; // 24
            8'b00001000: out = 8  ; // 8
            8'b01001000: out = 9  ; // 72
            8'b01001001: out = 10 ; // 73
            8'b01001101: out = 11 ; // 77
            8'b01001111: out = 12 ; // 79
            8'b00001111: out = 13 ; // 15
            8'b00101111: out = 14 ; // 47
            8'b10101111: out = 15 ; // 175
            8'b10111111: out = 16 ; // 191
            8'b10011111: out = 17 ; // 159
            8'b00011111: out = 18 ; // 31
            8'b00011101: out = 19 ; // 29
            8'b00011100: out = 20 ; // 28
            8'b01011100: out = 21 ; // 92
            8'b01001100: out = 22 ; // 76
            8'b00001100: out = 23 ; // 12
            8'b00000100: out = 24 ; // 4
            8'b00100100: out = 25 ; // 36
            8'b10100100: out = 26 ; // 164
            8'b10100110: out = 27 ; // 166
            8'b10100111: out = 28 ; // 167
            8'b10000111: out = 29 ; // 135
            8'b10010111: out = 30 ; // 151
            8'b11010111: out = 31 ; // 215
            8'b11011111: out = 32 ; // 223
            8'b11001111: out = 33 ; // 207
            8'b10001111: out = 34 ; // 143
            8'b10001110: out = 35 ; // 142
            8'b00001110: out = 36 ; // 14
            8'b00101110: out = 37 ; // 46
            8'b00100110: out = 38 ; // 38
            8'b00000110: out = 39 ; // 6
            8'b00000010: out = 40 ; // 2
            8'b00010010: out = 41 ; // 18
            8'b01010010: out = 42 ; // 82
            8'b01010011: out = 43 ; // 83
            8'b11010011: out = 44 ; // 211
            8'b11000011: out = 45 ; // 195
            8'b11001011: out = 46 ; // 203
            8'b11101011: out = 47 ; // 235
            8'b11101111: out = 48 ; // 239
            8'b11100111: out = 49 ; // 231
            8'b11000111: out = 50 ; // 199
            8'b01000111: out = 51 ; // 71
            8'b00000111: out = 52 ; // 7
            8'b00010111: out = 53 ; // 23
            8'b00010011: out = 54 ; // 19
            8'b00000011: out = 55 ; // 3
            8'b00000001: out = 56 ; // 1
            8'b00001001: out = 57 ; // 9
            8'b00101001: out = 58 ; // 41
            8'b10101001: out = 59 ; // 169
            8'b11101001: out = 60 ; // 233
            8'b11100001: out = 61 ; // 225
            8'b11100101: out = 62 ; // 229
            8'b11110101: out = 63 ; // 245
            8'b11110111: out = 64 ; // 247
            8'b11110011: out = 65 ; // 243
            8'b11100011: out = 66 ; // 227
            8'b10100011: out = 67 ; // 163
            8'b10000011: out = 68 ; // 131
            8'b10001011: out = 69 ; // 139
            8'b10001001: out = 70 ; // 137
            8'b10000001: out = 71 ; // 129
            8'b10000000: out = 72 ; // 128
            8'b10000100: out = 73 ; // 132
            8'b10010100: out = 74 ; // 148
            8'b11010100: out = 75 ; // 212
            8'b11110100: out = 76 ; // 244
            8'b11110000: out = 77 ; // 240
            8'b11110010: out = 78 ; // 242
            8'b11111010: out = 79 ; // 250
            8'b11111011: out = 80 ; // 251
            8'b11111001: out = 81 ; // 249
            8'b11110001: out = 82 ; // 241
            8'b11010001: out = 83 ; // 209
            8'b11000001: out = 84 ; // 193
            8'b11000101: out = 85 ; // 197
            8'b11000100: out = 86 ; // 196
            8'b11000000: out = 87 ; // 192
            8'b01000000: out = 88 ; // 64
            8'b01000010: out = 89 ; // 66
            8'b01001010: out = 90 ; // 74
            8'b01101010: out = 91 ; // 106
            8'b01111010: out = 92 ; // 122
            8'b01111000: out = 93 ; // 120
            8'b01111001: out = 94 ; // 121
            8'b01111101: out = 95 ; // 125
            8'b11111101: out = 96 ; // 253
            8'b11111100: out = 97 ; // 252
            8'b11111000: out = 98 ; // 248
            8'b11101000: out = 99 ; // 232
            8'b11100000: out = 100; // 224
            8'b11100010: out = 101; // 226
            8'b01100010: out = 102; // 98
            8'b01100000: out = 103; // 96
            8'b00100000: out = 104; // 32
            8'b00100001: out = 105; // 33
            8'b00100101: out = 106; // 37
            8'b00110101: out = 107; // 53
            8'b00111101: out = 108; // 61
            8'b00111100: out = 109; // 60
            8'b10111100: out = 110; // 188
            8'b10111110: out = 111; // 190
            8'b11111110: out = 112; // 254
            8'b01111110: out = 113; // 126
            8'b01111100: out = 114; // 124
            8'b01110100: out = 115; // 116
            8'b01110000: out = 116; // 112
            8'b01110001: out = 117; // 113
            8'b00110001: out = 118; // 49
            8'b00110000: out = 119; // 48
            8'b00010000: out = 120; // 16
            8'b10010000: out = 121; // 144
            8'b10010010: out = 122; // 146
            8'b10011010: out = 123; // 154
            8'b10011110: out = 124; // 158
            8'b00011110: out = 125; // 30
            8'b01011110: out = 126; // 94
            8'b01011111: out = 127; // 95
            default:     out = 255; // error case
        endcase
    end
    
endmodule
