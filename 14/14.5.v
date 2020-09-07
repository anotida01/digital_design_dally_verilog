// binary state encoding definitions
`define SWIDTH 3
`define GNS 3'b000
`define YNS 3'b001
`define RNS 3'b010
`define GEW 3'b011
`define YEW 3'b100
`define REW 3'b101

// light encodings for each state
`define GNSL 6'b100_001
`define YNSL 6'b010_001
`define RNSL 6'b001_001
`define GEWL 6'b001_100
`define YEWL 6'b001_010
`define REWL 6'b001_001

// variable input width D Flip-Flop
module DFF (clk, in, out);
	parameter k = 1;
	input clk;
	input [k-1:0] in;
	output [k-1:0] out;
	reg [k-1:0] out;

	always @(posedge clk) begin
		out = in;
	end
endmodule

module Traffic_Light_FSM (clk, rst, carew, lights);
	input clk, rst, carew;
	wire [`SWIDTH-1:0] state, next; // next state
	reg [`SWIDTH-1:0] next1;
	
	output [5:0] lights;
	reg [5:0] lights;

	DFF #(`SWIDTH) state_register(clk, next, state);

	always @(*) begin
		case (state)
			`GNS : {next1, lights} = {(carew ? `YNS : `GNS), `GNSL};
			`YNS : {next1, lights} = {`RNS, `YNSL};
			`RNS : {next1, lights} = {`GEW, `RNSL};
			`GEW : {next1, lights} = {`YEW, `GEWL};
			`YEW : {next1, lights} = {`REW, `YEWL};
			`REW : {next1, lights} = {`GNS, `REWL};
			default : {next1, lights} = {`SWIDTH+6{1'bx}};
		endcase
	end

	assign next = (rst ? `GNS : next1);

endmodule

module Traffic_Light_FSM_TB ();
	
	reg clk, rst, carew;
	wire [5:0] lights;

	Traffic_Light_FSM tl1(clk, rst, carew, lights);

	initial begin
		clk = 1; #5 clk = 0; // first half cycle
		forever begin
			$display("rst:%b carew:%b tl.state:%b lights:%b", rst, carew, tl1.state, lights);
			#5 clk = 1; #5 clk = 0; // cycle with period of 10
		end
	end

	initial begin
		rst = 0; carew = 0;
		#15 rst = 1; carew = 0;
		#10 rst = 0;
		#20 carew = 1;
		#30 carew = 0;
		#20 carew = 1;
		#60
		$stop;
	end

endmodule
