
module if_else(
  input wire c1,
  input wire c2,
  input wire [7:0] in1,
  input wire [7:0] in2,
  input wire [7:0] in3,
  output reg [7:0] out
);
//- start v_if_else
  always @(*) begin
    if (c1)
      out = in1;
    else if (c2)
      out = in2;
    else
      out = in3;
  end
//- end

endmodule
