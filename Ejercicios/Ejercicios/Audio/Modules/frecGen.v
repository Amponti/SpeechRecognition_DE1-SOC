`timescale 1ns / 1ps
module frecGen(clock,IN,OUT);

input clock;
input [31:0]IN;
output OUT;

reg [31:0]conteo;
reg out_tmp;

always @(posedge clock)
	begin
		if (conteo >=IN) conteo<= 0;
		else conteo <= conteo+1;
	end

always @(posedge clock)
	begin
		if (conteo >=IN) out_tmp<=!out_tmp;
		else out_tmp <= out_tmp;
		end

assign OUT = out_tmp;


endmodule
