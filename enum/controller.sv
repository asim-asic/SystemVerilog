typedef enum {
  FETCH,
  WRITE,
  ADD,
  SUB,
  MUL,
  DIV,
  SHIFT,
  NOP
} instr_t;

module controller (
    output logic read,
    write,
    input instr_t instruction,
    input clk,
    rst
);

  typedef enum {
    WAIT,
    LOAD,
    STORE
  } state_t;

  state_t state, next_state;

  always_ff @(posedge clk, negedge rst) begin
    if (!rst) state <= WAIT;
    else state <= next_state;
  end

  always_comb
    case (state)
      WAIT:  next_state = LOAD;
      LOAD:  next_state = STORE;
      STORE: next_state = WAIT;
      default: next_state = WAIT;
    endcase

  always_comb begin
    read  = 0;
    write = 0;
    if (state == LOAD && instruction == FETCH) read = 1;
    else if (state == STORE && instruction == WRITE) write = 1;
  end
endmodule
