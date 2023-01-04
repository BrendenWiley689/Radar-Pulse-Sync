`timescale 1ns / 1ps

module syncdelay_tb;

// Inputs
reg sysclk;
reg [0:0] btn;

// Outputs
wire [0:0] ja;


syncdelay uut (
  .ja(ja),
  .sysclk(sysclk),
  .btn(btn)
);

// Initialize input signals
initial begin
  sysclk = 0;
  btn[0] = 0;
end
// Generate clock
always begin
   #1 sysclk = !sysclk;
end

initial begin
btn[0] = 0;

  // Wait
  #200000;

  //Reset
  btn[0] = 1;

  // Wait
  #200000;

  btn = 0;

  #200000;

  btn[0] = 1;

  #200000;
end

endmodule