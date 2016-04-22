
module generate1(data, clock, dataout);

input clock;
input [15:0]data;
output [15:0]dataout;

localparam NUMBER_OF=2400*2;
localparam BUS_SIZE=16;
reg [BUS_SIZE-1:0]fp_delay[0:NUMBER_OF-1];

assign dataout[15:0]=fp_delay[NUMBER_OF-1][BUS_SIZE-1:0];

always@(posedge clock)
begin
	fp_delay[0][BUS_SIZE-1:0]<=data[15:0];
end

genvar index;
generate

for (index=NUMBER_OF-1; index >= 1; index=index-1)
	begin: delay_generate
			always@(posedge clock)
				begin
					fp_delay[index][BUS_SIZE-1:0]<=fp_delay[index-1][BUS_SIZE-1:0];
				end
	
	end
endgenerate


endmodule	