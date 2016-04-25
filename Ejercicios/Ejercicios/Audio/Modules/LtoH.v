`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:58 09/28/2009 
// Design Name: 
// Module Name:    LtoH 
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
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:52 09/28/2009 
// Design Name: 
// Module Name:    Lfrec_to_Hfrec 
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
//////////////////////////////////////////////////////////////////////////////////
module LtoH(LCLK,HCLK,Din,Dout);
parameter datos=16;
input LCLK;
input HCLK;
input [datos-1:0]Din;
output [datos-1:0]Dout;


reg Q1;
reg Q2;
always@(negedge HCLK)
begin
 Q1<=LCLK;
 
end
always@(negedge HCLK)
begin
 Q2<=Q1;
 
end

reg [datos-1:0]q3;

always@(posedge LCLK)
begin
 q3<=Din;
end

reg [datos-1:0]q4;
always@(posedge HCLK)
begin
	if(Q2)
		begin
		q4<=q3;
		end
	else
	   begin
		q4<=q4;
		end

end

reg [datos-1:0]out;
always@(posedge HCLK)
begin
	out<=q4;
end

assign Dout=out;




endmodule

