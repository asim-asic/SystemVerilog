module tb_instruction_register();

	data_t operand_a, operand_b;
	operand_type_t op_type;
	opcode_t opcode;
	logic [4:0] write_pointer;

	instr_t instr_reg [31:0];
	
	instruction_register uut(.instr_reg(instr_reg), .operand_a(operand_a), .operand_b(operand_b), .op_type(op_type), .opcode(opcode), .write_pointer(write_pointer));

	task print_entry(int idx);
		$display("\nIndex = %0d", idx);
		$display("Opcode = %0d | Type = %0d", instr_reg[idx].opc, instr_reg[idx].op_type);
		if(instr_reg[idx].op_type == SIGNED) begin
			$display("A = %0d | B = %0d", $signed(instr_reg[idx].op_a.s_data), $signed(instr_reg[idx].op_b.s_data));
		end else begin
			$display("A = %0d | B = %0d", $signed(instr_reg[idx].op_a.s_data), $signed(instr_reg[idx].op_b.s_data));
		end
	endtask

	initial begin
		// ----------------- TEST 1 (SIGNED) ----------------
		write_pointer = 5;
		op_type = SIGNED;
		opcode = ADD;

		operand_a.s_data = -10;
		operand_b.s_data = 4;

		#1
		print_entry(write_pointer);

		// ----------------- TEST 2 (UNSIGNED) ----------------
		write_pointer = 10;
		op_type = UNSIGNED;
		opcode = MUL;

		operand_a.s_data = 7;
		operand_b.s_data = 3;

		#1
		print_entry(write_pointer);
	
		// ----------------- TEST 3 (SIGNED different op) ----------------
		write_pointer = 2;
		op_type = SIGNED;
		opcode = SUB;

		operand_a.s_data = 20;
		operand_b.s_data = 50;

		#1
		print_entry(write_pointer);
		$finish();
	end
endmodule

