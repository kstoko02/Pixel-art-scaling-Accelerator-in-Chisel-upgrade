FIRRTL version 1.2.0
circuit FunctionCounter :
  module FunctionCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8> @[src/main/scala/Counter.scala 18:14]
    output io_tick : UInt<1> @[src/main/scala/Counter.scala 18:14]

    reg count10 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), count10) @[src/main/scala/Counter.scala 77:25]
    node _count10_cntReg_T = eq(count10, UInt<4>("ha")) @[src/main/scala/Counter.scala 78:26]
    node _count10_cntReg_T_1 = add(count10, UInt<1>("h1")) @[src/main/scala/Counter.scala 78:47]
    node _count10_cntReg_T_2 = tail(_count10_cntReg_T_1, 1) @[src/main/scala/Counter.scala 78:47]
    node _count10_cntReg_T_3 = mux(_count10_cntReg_T, UInt<1>("h0"), _count10_cntReg_T_2) @[src/main/scala/Counter.scala 78:18]
    reg count99 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), count99) @[src/main/scala/Counter.scala 77:25]
    node _count99_cntReg_T = eq(count99, UInt<7>("h63")) @[src/main/scala/Counter.scala 78:26]
    node _count99_cntReg_T_1 = add(count99, UInt<1>("h1")) @[src/main/scala/Counter.scala 78:47]
    node _count99_cntReg_T_2 = tail(_count99_cntReg_T_1, 1) @[src/main/scala/Counter.scala 78:47]
    node _count99_cntReg_T_3 = mux(_count99_cntReg_T, UInt<1>("h0"), _count99_cntReg_T_2) @[src/main/scala/Counter.scala 78:18]
    reg testCounter : UInt<8>, clock with :
      reset => (UInt<1>("h0"), testCounter) @[src/main/scala/Counter.scala 77:25]
    node _testCounter_cntReg_T = eq(testCounter, UInt<3>("h7")) @[src/main/scala/Counter.scala 78:26]
    node _testCounter_cntReg_T_1 = add(testCounter, UInt<1>("h1")) @[src/main/scala/Counter.scala 78:47]
    node _testCounter_cntReg_T_2 = tail(_testCounter_cntReg_T_1, 1) @[src/main/scala/Counter.scala 78:47]
    node _testCounter_cntReg_T_3 = mux(_testCounter_cntReg_T, UInt<1>("h0"), _testCounter_cntReg_T_2) @[src/main/scala/Counter.scala 78:18]
    node _io_tick_T = eq(testCounter, UInt<3>("h7")) @[src/main/scala/Counter.scala 89:26]
    io_cnt <= testCounter @[src/main/scala/Counter.scala 90:10]
    io_tick <= _io_tick_T @[src/main/scala/Counter.scala 89:11]
    count10 <= mux(reset, UInt<8>("h0"), _count10_cntReg_T_3) @[src/main/scala/Counter.scala 77:{25,25} 78:12]
    count99 <= mux(reset, UInt<8>("h0"), _count99_cntReg_T_3) @[src/main/scala/Counter.scala 77:{25,25} 78:12]
    testCounter <= mux(reset, UInt<8>("h0"), _testCounter_cntReg_T_3) @[src/main/scala/Counter.scala 77:{25,25} 78:12]
