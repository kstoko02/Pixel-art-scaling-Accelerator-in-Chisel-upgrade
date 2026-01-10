
//- start v_adder
module adder(
  input  [7:0] a,
  input  [7:0] b,
  output [7:0] sum
);

  assign sum = a + b;

endmodule
//- end

module UseAdder(
      input  [7:0] a,
      input  [7:0] b,
      output [7:0] sum
    );

//- start v_use_adder
    wire [7:0] in1;
    wire [7:0] in2;
    wire [7:0] result;

    adder m(.a(in1), .b(in2), .sum(result));
//- end

    assign in1 = a;
    assign in2 = b;

    assign sum = result;
endmodule
