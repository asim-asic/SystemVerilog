typedef enum {
  ADD,
  SUB,
  MUL,
  DIV,
  SL,
  SR
} opcode_t;

typedef enum {
  UNSIGNED,
  SIGNED
} operand_type_t;

typedef union packed {
  logic [31:0] u_data;
  bit signed [31:0] s_data;
} data_t;

typedef struct packed {
  opcode_t opc;
  operand_type_t op_type;
  data_t op_a;
  data_t op_b;
} instr_t;

module instruction_register (
    output instr_t [31:0] instr_reg,  // packed array of structures
    input data_t operand_a,
    input data_t operand_b,
    input operand_type_t op_type,
    input opcode_t opcode,
    input logic [4:0] write_pointer
);

  always @(write_pointer) begin
    instr_reg[write_pointer].op_type = op_type;
    instr_reg[write_pointer].opc = opcode;

    // use op_type to determine the operand data type stored in the input operand union
    if (op_type == SIGNED) begin
      instr_reg[write_pointer].op_a.s_data = operand_a.s_data;
      instr_reg[write_pointer].op_b.s_data = operand_b.s_data;
    end else begin
      instr_reg[write_pointer].op_a.u_data = operand_a.u_data;
      instr_reg[write_pointer].op_b.u_data = operand_b.u_data;
    end
  end
endmodule
