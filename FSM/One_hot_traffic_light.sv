module traffic_light (
    output bit green_light,
    yellow_light,
    red_light,
    input sensor,
    input [15:0] green_downcut,
    yellow_downcut,
    input clk,
    rst
);

  enum {
    R_BIT = 0,  // index of RED state in state register
    G_BIT = 1,  // index of GREEN state in state register
    Y_BIT = 2   // index of YELLOW state in state register
  } state_bit;
  enum {
    RED = 1 << R_BIT,  // shift a 1 to that state's bit,
    GREEN = 1 << G_BIT,
    YELLOW = 1 << Y_BIT
  }
      state, next_state;

  always_ff @(posedge clk, negedge rst)
    if (!rst) state <= RED;  // reset to red light
    else state <= next_state;

  always_comb begin : set_next_state
    next_state = state;
    unique case (1'b1)  // revered case statement
      state[R_BIT]: if (sensor) next = GREEN;
      state[G_BIT]: if (green_downcut == 0) next = YELLOW;
      state[Y_BIT]: if (yellow_downcut == 0) next = RED;
    endcase
  end : set_next_state

  always_comb begin : set_ouputs
    {green_light, yellow_light, red_light} = 3'b000;
    unique case (1'b1)  // revered case statement
      state[R_BIT]: red_light = 1'b1;
      state[G_BIT]: green_light = 1'b1;
      state[Y_BIT]: yellow_light = 1'b1;
    endcase
  end : set_outputs
endmodule

