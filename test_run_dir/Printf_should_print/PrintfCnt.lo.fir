FIRRTL version 1.2.0
circuit PrintfCnt :
  module PrintfCnt :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<4> @[src/main/scala/PrintfCnt.scala 4:14]

    reg cnt : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cnt) @[src/main/scala/PrintfCnt.scala 8:20]
    node _cnt_T = add(cnt, UInt<1>("h1")) @[src/main/scala/PrintfCnt.scala 9:14]
    node _cnt_T_1 = tail(_cnt_T, 1) @[src/main/scala/PrintfCnt.scala 9:14]
    node _T = eq(reset, UInt<1>("h0")) @[src/main/scala/PrintfCnt.scala 11:9]
    io_out <= cnt @[src/main/scala/PrintfCnt.scala 13:10]
    cnt <= mux(reset, UInt<4>("h0"), _cnt_T_1) @[src/main/scala/PrintfCnt.scala 8:{20,20} 9:7]
    printf(clock, and(and(UInt<1>("h1"), _T), UInt<1>("h1")), "printf: %d\n", cnt) : printf @[src/main/scala/PrintfCnt.scala 11:9]
