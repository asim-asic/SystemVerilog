module traffic_light (output bit green_light,
				 yellow_light,
				 red_light,
			   input sensor,
			   input [15:0] green_downcut,
			   	yellow_downcut,
				input clk, rst);


	enum {RED, GREEN, YELLOW} state, next_state;

	always_ff @(posedge clk, negedge rst)
		if(!rst) 
			state <= RED; // reset to red light
	        else 
			state <= next_state;

		always_comb begin: set_next_state
			next_state = state;
			unique case(state)
				RED: if(sensor) next = GREEN;
				GREEN: if(green_downcut == 0) next = YELLOW;
				YELLOW: if(yellow_downcut == 0) next = RED;
			endcase
	end: set_next_state

	always_comb begin: set_ouputs
		{green_light, yellow_light, red_light} = 3'b000;
		unique case (state)
			RED: red_light = 1'b1;
			GREEN: red_light = 1'b1;
			YELLOW: red_light = 1'b1;
		endcase
	end: set_outputs
endmodule	
			
