
 //-----------------------------------------------------
 // Design Name : gray_counter V2
 // File Name   : Gray_Counter.v
 // Function    : 4 bit gray counter
 // Coder       : Anthony Rizzuto
 //-----------------------------------------------------
module tt_um_GrayCounter_ariz207 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    // use bidirectionals as outputs
    assign uio_oe = 8'b11111111;
    assign uio_out = 8'b0;

    wire reset = ! rst_n;
    wire [3:0] out; 

   gray_counter g1(out,clk,reset); 
   
   
    assign uo_out = {4'b0,out}; 
endmodule 



module gray_counter(out, clk, rst);
 input clk, rst;
 output reg [3:0] out;
 
 reg q0, q1, q2; 
 reg [3:0] count; 
 
 always @ (posedge clk) 
 begin
  if (rst) begin
   count = 4'b0; 
   out = 4'b0;
	end
  else
	begin
   count = count + 1'b1;
   q2 = count[3] ^ count[2];
   q1 = count[2] ^ count[1];
   q0 = count[1] ^ count[0];
   out = {count[3], q2, q1, q0};
	end
 end
endmodule