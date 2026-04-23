module tb_alu;

  instr_t iw;
  data_t  alu_out;

  // DUT
  alu dut (
    .iw(iw),
    .alu_out(alu_out)
  );

  initial begin
    // ---------- SIGNED TESTS ----------
    iw.op_type = SIGNED;

    iw.opc = ADD;
    iw.op_a.s_data = 10;
    iw.op_b.s_data = 5;
    #5;
    $display("A = %0d | B = %0d | SIGNED ADD = %0d", iw.op_a.s_data, iw.op_b.s_data, alu_out.s_data);

    iw.opc = SUB;
    iw.op_a.s_data = 10;
    iw.op_b.s_data = 5;
    #5;
    $display("A = %0d | B = %0d | SIGNED ADD = %0d", iw.op_a.s_data, iw.op_b.s_data, alu_out.s_data);

    iw.opc = MUL;
    iw.op_a.s_data = -3;
    iw.op_b.s_data = 4;
    #5;
    $display("A = %0d | B = %0d | SIGNED ADD = %0d", iw.op_a.s_data, iw.op_b.s_data, alu_out.s_data);

    iw.opc = DIV;
    iw.op_a.s_data = 20;
    iw.op_b.s_data = 4;
    #5;
    $display("A = %0d | B = %0d | SIGNED ADD = %0d", iw.op_a.s_data, iw.op_b.s_data, alu_out.s_data);

    iw.opc = SL;
    iw.op_a.s_data = 2;
    #5;
    $display("A = %0d | B = %0d | SIGNED ADD = %0d", iw.op_a.s_data, iw.op_b.s_data, alu_out.s_data);

    iw.opc = SR;
    iw.op_a.s_data = 8;
    #5;
    $display("A = %0d | B = %0d | SIGNED ADD = %0d", iw.op_a.s_data, iw.op_b.s_data, alu_out.s_data);


    // ---------- UNSIGNED TESTS ----------
    iw.op_type = UNSIGNED;

    iw.opc = ADD;
    iw.op_a.u_data = 10;
    iw.op_b.u_data = 5;
    #5;
    $display("A = %0d | B = %0d | UNSIGNED ADD = %0d", iw.op_a.u_data, iw.op_b.u_data, alu_out.u_data);

    iw.opc = SUB;
    iw.op_a.u_data = 10;
    iw.op_b.u_data = 5;
    #5;
    $display("A = %0d | B = %0d | UNSIGNED ADD = %0d", iw.op_a.u_data, iw.op_b.u_data, alu_out.u_data);

    iw.opc = MUL;
    iw.op_a.u_data = 3;
    iw.op_b.u_data = 4;
    #5;
    $display("A = %0d | B = %0d | UNSIGNED ADD = %0d", iw.op_a.u_data, iw.op_b.u_data, alu_out.u_data);

    iw.opc = DIV;
    iw.op_a.u_data = 20;
    iw.op_b.u_data = 4;
    #5;
    $display("A = %0d | B = %0d | UNSIGNED ADD = %0d", iw.op_a.u_data, iw.op_b.u_data, alu_out.u_data);

    iw.opc = SL;
    iw.op_a.u_data = 2;
    #5;
    $display("A = %0d | B = %0d | UNSIGNED ADD = %0d", iw.op_a.u_data, iw.op_b.u_data, alu_out.u_data);

    iw.opc = SR;
    iw.op_a.u_data = 8;
    #5;
    $display("A = %0d | B = %0d | UNSIGNED ADD = %0d", iw.op_a.u_data, iw.op_b.u_data, alu_out.u_data);

    $finish;
  end

endmodule
