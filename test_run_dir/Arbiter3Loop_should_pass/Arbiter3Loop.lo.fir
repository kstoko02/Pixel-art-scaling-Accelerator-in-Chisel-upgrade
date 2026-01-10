FIRRTL version 1.2.0
circuit Arbiter3Loop :
  module Arbiter3Loop :
    input clock : Clock
    input reset : UInt<1>
    input io_request : UInt<3> @[src/main/scala/arbiter.scala 52:14]
    output io_grant : UInt<3> @[src/main/scala/arbiter.scala 52:14]

    node _request_T = bits(io_request, 0, 0) @[src/main/scala/arbiter.scala 57:36]
    node _request_T_1 = bits(io_request, 1, 1) @[src/main/scala/arbiter.scala 57:36]
    node _request_T_2 = bits(io_request, 2, 2) @[src/main/scala/arbiter.scala 57:36]
    node request_0 = _request_T @[src/main/scala/arbiter.scala 57:{24,24}]
    node grant_0 = request_0 @[src/main/scala/arbiter.scala 61:30 64:12]
    node _notGranted_0_T = eq(grant_0, UInt<1>("h0")) @[src/main/scala/arbiter.scala 65:20]
    node request_1 = _request_T_1 @[src/main/scala/arbiter.scala 57:{24,24}]
    node notGranted_0 = _notGranted_0_T @[src/main/scala/arbiter.scala 62:35 65:17]
    node _grant_1_T = and(request_1, notGranted_0) @[src/main/scala/arbiter.scala 67:28]
    node grant_1 = _grant_1_T @[src/main/scala/arbiter.scala 61:30 67:14]
    node _notGranted_1_T = eq(grant_1, UInt<1>("h0")) @[src/main/scala/arbiter.scala 68:22]
    node _notGranted_1_T_1 = and(_notGranted_1_T, notGranted_0) @[src/main/scala/arbiter.scala 68:32]
    node request_2 = _request_T_2 @[src/main/scala/arbiter.scala 57:{24,24}]
    node notGranted_1 = _notGranted_1_T_1 @[src/main/scala/arbiter.scala 62:35 68:19]
    node _grant_2_T = and(request_2, notGranted_1) @[src/main/scala/arbiter.scala 67:28]
    node grant_2 = _grant_2_T @[src/main/scala/arbiter.scala 61:30 67:14]
    node _notGranted_2_T = eq(grant_2, UInt<1>("h0")) @[src/main/scala/arbiter.scala 68:22]
    node _notGranted_2_T_1 = and(_notGranted_2_T, notGranted_1) @[src/main/scala/arbiter.scala 68:32]
    node io_grant_hi = cat(grant_2, grant_1) @[src/main/scala/arbiter.scala 72:21]
    node _io_grant_T = cat(io_grant_hi, grant_0) @[src/main/scala/arbiter.scala 72:21]
    node notGranted_2 = _notGranted_2_T_1 @[src/main/scala/arbiter.scala 62:35 68:19]
    io_grant <= _io_grant_T @[src/main/scala/arbiter.scala 72:12]
