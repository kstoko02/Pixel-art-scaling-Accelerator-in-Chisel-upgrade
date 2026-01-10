
module Register(
      input wire clk,
      input wire reset,
      input wire enable,
      input wire [7:0] data,
      output wire [7:0] out
    );

//- start v_register
  reg [7:0] reg_data;

  always @(posedge clk) begin
    if (reset)
      reg_data <= 8'b0;
    else if (enable)
      reg_data <= data;
  end
//- end

  assign out = reg_data;
endmodule
