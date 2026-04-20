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

module alu (
    input  instr_t iw,
    output data_t  alu_out
);

  always @(iw) begin
    if (iw.op_type == SIGNED) begin
      case (iw.opc)
        ADD: alu_out.s_data = iw.op_a.s_data + iw.op_b.s_data;
        SUB: alu_out.s_data = iw.op_a.s_data - iw.op_b.s_data;
        MUL: alu_out.s_data = iw.op_a.s_data * iw.op_b.s_data;
        DIV: alu_out.s_data = iw.op_a.s_data / iw.op_b.s_data;
        SL: alu_out.s_data = iw.op_a.s_data <<< 2;
        SR: alu_out.s_data = iw.op_a.s_data >>> 2;
        default: alu_out.s_data = 0;
      endcase
    end else begin
      case (iw.opc)
        ADD: alu_out.u_data = iw.op_a.u_data + iw.op_b.u_data;
        SUB: alu_out.u_data = iw.op_a.u_data - iw.op_b.u_data;
        MUL: alu_out.u_data = iw.op_a.u_data * iw.op_b.u_data;
        DIV: alu_out.u_data = iw.op_a.u_data / iw.op_b.u_data;
        SL: alu_out.u_data = iw.op_a.u_data << 2;
        SR: alu_out.u_data = iw.op_a.u_data >>> 2;
        default: alu_out.u_data = 0;
      endcase
    end
  end
endmodule
