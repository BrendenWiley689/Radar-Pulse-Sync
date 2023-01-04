//ja[0] = pulse output on pmod pin
// btn[0] = reset button on fpga
//sysclk = internal clock

module syncdelay (output reg [0:0] ja, input sysclk, input [0:0] btn);

//Counter
reg [11:0] count = 0;

always @(posedge sysclk) begin

    if(count >= 2400) begin
         count <= 0;
    end
    //Reset Logic
 else if (btn[0]) begin
    count <= 0;
  end 
  
    else begin
    count <= count + 1;
  end
end

always @* begin

    //PMT Sync Pulse 
  if (count < 480) begin
    ja[0] = 1;
   end 
    //Waiting Time
   else if (count < 2395 && count >= 480) begin
   ja[0] = 0;
   
   end 
   //Initiate Switch
   else if (count < 2400 && count >= 2395) begin
    ja[0] = 0;
    end
    
  end
endmodule