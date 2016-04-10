module delayer(reset, data, en, dataout,clock);
input reset;
input [15:0]data;
input en;
input clock;
wire sampler;
output  [15:0]dataout;
wire  [15:0]dataout1;


wire  [15:0]dataoutd=	({dataout1[15],dataout1[15:1]})+({data[15],data[15:1]});

assign  dataout[15:0]=dataoutd[15:0];
											
generate1 generate2(.data(data[15:0]),
						  .clock(sampler),
						  .dataout(dataout1[15:0]));
						  
freq_gen freq_gen3(.clock(clock),//Reloj de 1 bit
						 .IN(32'd383),//Entrada de 32 bits IN=((Freq_IN/(2*OUTCLK)))-1
						 .OUTCLK(sampler),//Frecuencia de salida 1 bit
						 .reset(reset));//Reset activo en bajo 1 bit
endmodule
