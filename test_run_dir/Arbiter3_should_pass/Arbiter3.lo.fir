FIRRTL version 1.2.0
circuit Arbiter3 :
  module Arbiter3 :
    input clock : Clock
    input reset : UInt<1>
    input io_request : UInt<3> @[src/main/scala/arbiter.scala 6:14]
    output io_grant : UInt<3> @[src/main/scala/arbiter.scala 6:14]

    node _request_T = bits(io_request, 0, 0) @[src/main/scala/arbiter.scala 11:36]
    node _request_T_1 = bits(io_request, 1, 1) @[src/main/scala/arbiter.scala 11:36]
    node _request_T_2 = bits(io_request, 2, 2) @[src/main/scala/arbiter.scala 11:36]
    node request_0 = _request_T @[src/main/scala/arbiter.scala 11:{24,24}]
    node grant_0 = request_0 @[src/main/scala/arbiter.scala 14:22 17:12]
    node _notGranted_0_T = eq(grant_0, UInt<1>("h0")) @[src/main/scala/arbiter.scala 18:20]
    node request_1 = _request_T_1 @[src/main/scala/arbiter.scala 11:{24,24}]
    node notGranted_0 = _notGranted_0_T @[src/main/scala/arbiter.scala 15:27 18:17]
    node _grant_1_T = and(request_1, notGranted_0) @[src/main/scala/arbiter.scala 19:26]
    node grant_1 = _grant_1_T @[src/main/scala/arbiter.scala 14:22 19:12]
    node _notGranted_1_T = eq(grant_1, UInt<1>("h0")) @[src/main/scala/arbiter.scala 20:20]
    node _notGranted_1_T_1 = and(_notGranted_1_T, notGranted_0) @[src/main/scala/arbiter.scala 20:30]
    node request_2 = _request_T_2 @[src/main/scala/arbiter.scala 11:{24,24}]
    node notGranted_1 = _notGranted_1_T_1 @[src/main/scala/arbiter.scala 15:27 20:17]
    node _grant_2_T = and(request_2, notGranted_1) @[src/main/scala/arbiter.scala 21:26]
    node grant_2 = _grant_2_T @[src/main/scala/arbiter.scala 14:22 21:12]
    node io_grant_hi = cat(grant_2, grant_1) @[src/main/scala/arbiter.scala 24:21]
    node _io_grant_T = cat(io_grant_hi, grant_0) @[src/main/scala/arbiter.scala 24:21]
    io_grant <= _io_grant_T @[src/main/scala/arbiter.scala 24:12]
