FIRRTL version 1.2.0
circuit NocRouter :
  module NocRouter :
    input clock : Clock
    input reset : UInt<1>
    input io_inPort_0_data : UInt<16> @[src/main/scala/NocRouter.scala 12:13]
    input io_inPort_0_flag : UInt<1> @[src/main/scala/NocRouter.scala 12:13]
    input io_inPort_1_data : UInt<16> @[src/main/scala/NocRouter.scala 12:13]
    input io_inPort_1_flag : UInt<1> @[src/main/scala/NocRouter.scala 12:13]
    input io_address_0 : UInt<8> @[src/main/scala/NocRouter.scala 12:13]
    input io_address_1 : UInt<8> @[src/main/scala/NocRouter.scala 12:13]
    output io_outPort_0_data : UInt<16> @[src/main/scala/NocRouter.scala 12:13]
    output io_outPort_0_flag : UInt<1> @[src/main/scala/NocRouter.scala 12:13]
    output io_outPort_1_data : UInt<16> @[src/main/scala/NocRouter.scala 12:13]
    output io_outPort_1_flag : UInt<1> @[src/main/scala/NocRouter.scala 12:13]

    io_outPort_0_data <= io_inPort_1_data @[src/main/scala/NocRouter.scala 22:17]
    io_outPort_0_flag <= io_inPort_1_flag @[src/main/scala/NocRouter.scala 22:17]
    io_outPort_1_data <= io_inPort_0_data @[src/main/scala/NocRouter.scala 23:17]
    io_outPort_1_flag <= io_inPort_0_flag @[src/main/scala/NocRouter.scala 23:17]
