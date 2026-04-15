module tb_controller();

	logic read, write;
	logic clk, rst;

	typedef enum {FETCH, WRITE, ADD, SUB, MUL, DIV, SHIFT, NOP} instr_t;
	instr_t instruction;
	
	string instr_str;

	controller uut(.read(read), .write(write), .instruction(instruction), .clk(clk), .rst(rst));
	always #5 clk = ~clk;

	initial
	begin
		clk = 0;
		rst = 0;
		instruction = FETCH;

		#10
		rst = 1;

		#10 instruction = FETCH;
		#20 instruction = WRITE;
		#20 instruction = ADD;
		#20 instruction = WRITE;
		#20 instruction = FETCH;

		#50
		$finish();
	end
	
	always@(posedge clk)
	begin
		case(instruction)
			FETCH: $display("Time=%3t | instr=FETCH | read=%0b | write=%0b",$time, read, write); 
			WRITE: $display("Time=%3t | instr=WRITE | read=%0b | write=%0b",$time, read, write); 
			ADD:   $display("Time=%3t | instr=ADD   | read=%0b | write=%0b",$time, read, write); 
			SUB: $display("Time=%3t | instr=SUB | read=%0b | write=%0b",$time, read, write); 
			MUL: $display("Time=%3t | instr=MUL | read=%0b | write=%0b",$time, read, write); 
			DIV: $display("Time=%3t | instr=DIV | read=%0b | write=%0b",$time, read, write); 
			SHIFT: $display("Time=%3t | instr=SHIFT | read=%0b | write=%0b",$time, read, write); 
			NOP: $display("Time=%3t | instr=NOP | read=%0b | write=%0b",$time, read, write); 
		endcase
	end
endmodule

