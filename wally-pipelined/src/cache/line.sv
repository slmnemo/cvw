///////////////////////////////////////////
// line.sv
//
// Written: jaallen@g.hmc.edu 2021-03-23
// Modified: 
//
// Purpose: An implementation of a single cache line
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
// is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT 
// OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
///////////////////////////////////////////

`include "wally-config.vh"

// A read-only cache line ("write"ing to this line is loading new data, not writing to memory
module rocacheline #(parameter LINESIZE = 256, parameter TAGSIZE = 32, parameter WORDSIZE = `XLEN) (
    // Pipeline stuff
    input  logic clk,
    input  logic reset,
    // If flush is high, invalidate this word
    input  logic flush,
    // Select which word within the line
    input  logic [$clog2(LINESIZE/8)-1:0]   WordSelect,
    // Write new data to the line
    input  logic                            WriteEnable,
    input  logic [LINESIZE-1:0]             WriteData,
    input  logic [TAGSIZE-1:0]              WriteTag,
    // Output the word, as well as the tag and if it is valid
    output logic [WORDSIZE-1:0]             DataWord,
    output logic [TAGSIZE-1:0]              DataTag,
    output logic                            DataValid
);

    localparam integer OFFSETSIZE = $clog2(LINESIZE/8);
    localparam integer NUMWORDS = LINESIZE/WORDSIZE;

    logic [NUMWORDS-1:0][WORDSIZE-1:0]  DataLinesIn, DataLinesOut;

    flopenr #(1)        ValidBitFlop(clk, reset, WriteEnable | flush, ~flush, DataValid);
    flopenr #(TAGSIZE)  TagFlop(clk, reset, WriteEnable, WriteTag, DataTag);

    genvar i;
    generate
        for (i=0; i < NUMWORDS; i++) begin
            assign DataLinesIn[i] = WriteData[NUMWORDS*i+WORDSIZE-1:NUMWORDS*i];
            flopenr #(LINESIZE) LineFlop(clk, reset, WriteEnable, DataLinesIn[i], DataLinesOut[i]);
        end
    endgenerate


    always_comb begin
        DataWord = DataLinesOut[WordSelect[OFFSETSIZE-1:$clog2(WORDSIZE)]];
    end

endmodule
