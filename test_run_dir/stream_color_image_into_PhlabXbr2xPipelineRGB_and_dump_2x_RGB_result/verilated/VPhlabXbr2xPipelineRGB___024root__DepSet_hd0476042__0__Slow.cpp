// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VPhlabXbr2xPipelineRGB.h for the primary calling header

#include "VPhlabXbr2xPipelineRGB__pch.h"
#include "VPhlabXbr2xPipelineRGB___024root.h"

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___eval_static(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_static\n"); );
}

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___eval_initial(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vtrigprevexpr___TOP__clock__0 = vlSelf->clock;
}

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___eval_final(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_final\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__stl(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool VPhlabXbr2xPipelineRGB___024root___eval_phase__stl(VPhlabXbr2xPipelineRGB___024root* vlSelf);

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___eval_settle(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_settle\n"); );
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelf->__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            VPhlabXbr2xPipelineRGB___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("PhlabXbr2xPipelineRGB.sv", 297, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (VPhlabXbr2xPipelineRGB___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelf->__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__stl(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___stl_sequent__TOP__0(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___stl_sequent__TOP__0\n"); );
    // Init
    CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid;
    PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid = 0;
    CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match;
    PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match = 0;
    CData/*0:0*/ __VdfgTmp_he5113679__0;
    __VdfgTmp_he5113679__0 = 0;
    // Body
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_1 
        = (0x3ffU & ((IData)(1U) + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value)));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_3 
        = (0x3ffU & ((IData)(1U) + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value)));
    vlSelf->PhlabXbr2xPipelineRGB__DOT___y_T_1 = (0xffffU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y)));
    vlSelf->PhlabXbr2xPipelineRGB__DOT___x_T_2 = (0xffffU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x)));
    vlSelf->PhlabXbr2xPipelineRGB__DOT___s2_yc_T_1 
        = (0xffffU & ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_y) 
                      - (IData)(2U)));
    vlSelf->io_out_bits_block_0 = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->io_out_bits_block_1 = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->io_out_bits_block_2 = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->io_out_bits_block_3 = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->io_out_bits_x = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->io_out_bits_y = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->io_out_bits_sof = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->io_out_bits_eol = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol
        [vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value];
    vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16 = 
        (0xffU & ((((0x20000U & (VL_MULS_III(17, (IData)(0x4dU), 
                                             (0x1ffffU 
                                              & VL_EXTENDS_II(17,9, 
                                                              (0xffU 
                                                               & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_H 
                                                                  >> 0x10U))))) 
                                 << 1U)) | (0x1ffffU 
                                            & VL_MULS_III(17, (IData)(0x4dU), 
                                                          (0x1ffffU 
                                                           & VL_EXTENDS_II(17,9, 
                                                                           (0xffU 
                                                                            & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_H 
                                                                               >> 0x10U))))))) 
                   + (VL_MULS_III(18, (IData)(0x96U), 
                                  (0x3ffffU & VL_EXTENDS_II(18,9, 
                                                            (0xffU 
                                                             & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_H 
                                                                >> 8U))))) 
                      + ((0x38000U & ((- (IData)((1U 
                                                  & (VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_H)))) 
                                                     >> 0xeU)))) 
                                      << 0xfU)) | (0x7fffU 
                                                   & VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_H)))))))) 
                  >> 8U));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16 = 
        (0xffU & ((((0x20000U & (VL_MULS_III(17, (IData)(0x4dU), 
                                             (0x1ffffU 
                                              & VL_EXTENDS_II(17,9, 
                                                              (0xffU 
                                                               & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_R 
                                                                  >> 0x10U))))) 
                                 << 1U)) | (0x1ffffU 
                                            & VL_MULS_III(17, (IData)(0x4dU), 
                                                          (0x1ffffU 
                                                           & VL_EXTENDS_II(17,9, 
                                                                           (0xffU 
                                                                            & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_R 
                                                                               >> 0x10U))))))) 
                   + (VL_MULS_III(18, (IData)(0x96U), 
                                  (0x3ffffU & VL_EXTENDS_II(18,9, 
                                                            (0xffU 
                                                             & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_R 
                                                                >> 8U))))) 
                      + ((0x38000U & ((- (IData)((1U 
                                                  & (VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_R)))) 
                                                     >> 0xeU)))) 
                                      << 0xfU)) | (0x7fffU 
                                                   & VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_R)))))))) 
                  >> 8U));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16 = 
        (0xffU & ((((0x20000U & (VL_MULS_III(17, (IData)(0x4dU), 
                                             (0x1ffffU 
                                              & VL_EXTENDS_II(17,9, 
                                                              (0xffU 
                                                               & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L 
                                                                  >> 0x10U))))) 
                                 << 1U)) | (0x1ffffU 
                                            & VL_MULS_III(17, (IData)(0x4dU), 
                                                          (0x1ffffU 
                                                           & VL_EXTENDS_II(17,9, 
                                                                           (0xffU 
                                                                            & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L 
                                                                               >> 0x10U))))))) 
                   + (VL_MULS_III(18, (IData)(0x96U), 
                                  (0x3ffffU & VL_EXTENDS_II(18,9, 
                                                            (0xffU 
                                                             & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L 
                                                                >> 8U))))) 
                      + ((0x38000U & ((- (IData)((1U 
                                                  & (VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L)))) 
                                                     >> 0xeU)))) 
                                      << 0xfU)) | (0x7fffU 
                                                   & VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L)))))))) 
                  >> 8U));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16 = 
        (0xffU & ((((0x20000U & (VL_MULS_III(17, (IData)(0x4dU), 
                                             (0x1ffffU 
                                              & VL_EXTENDS_II(17,9, 
                                                              (0xffU 
                                                               & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N 
                                                                  >> 0x10U))))) 
                                 << 1U)) | (0x1ffffU 
                                            & VL_MULS_III(17, (IData)(0x4dU), 
                                                          (0x1ffffU 
                                                           & VL_EXTENDS_II(17,9, 
                                                                           (0xffU 
                                                                            & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N 
                                                                               >> 0x10U))))))) 
                   + (VL_MULS_III(18, (IData)(0x96U), 
                                  (0x3ffffU & VL_EXTENDS_II(18,9, 
                                                            (0xffU 
                                                             & (vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N 
                                                                >> 8U))))) 
                      + ((0x38000U & ((- (IData)((1U 
                                                  & (VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N)))) 
                                                     >> 0xeU)))) 
                                      << 0xfU)) | (0x7fffU 
                                                   & VL_MULS_III(15, (IData)(0x1dU), 
                                                                 (0x7fffU 
                                                                  & VL_EXTENDS_II(15,9, 
                                                                                (0xffU 
                                                                                & vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N)))))))) 
                  >> 8U));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_data 
        = ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_addr_pipe_0))
            ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4
           [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_addr_pipe_0]
            : 0U);
    PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid = 
        ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_emit) 
         & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v4));
    vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m3_T_27 
        = ((3U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx))
            ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m3_MPORT_3_addr_pipe_0))
                ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3
               [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m3_MPORT_3_addr_pipe_0]
                : 0U) : ((2U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx))
                          ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m3_MPORT_2_addr_pipe_0))
                              ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2
                             [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m3_MPORT_2_addr_pipe_0]
                              : 0U) : ((1U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx))
                                        ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m3_MPORT_1_addr_pipe_0))
                                            ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1
                                           [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m3_MPORT_1_addr_pipe_0]
                                            : 0U) : 
                                       ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx))
                                         ? ((0x80U 
                                             >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m3_MPORT_addr_pipe_0))
                                             ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0
                                            [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m3_MPORT_addr_pipe_0]
                                             : 0U) : 0U))));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data 
        = ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_addr_pipe_0))
            ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4
           [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_addr_pipe_0]
            : 0U);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_data 
        = ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_addr_pipe_0))
            ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4
           [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_addr_pipe_0]
            : 0U);
    PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match 
        = ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value) 
           == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value));
    vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27 
        = ((3U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))
            ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m2_MPORT_3_addr_pipe_0))
                ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3
               [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m2_MPORT_3_addr_pipe_0]
                : 0U) : ((2U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))
                          ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m2_MPORT_2_addr_pipe_0))
                              ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2
                             [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m2_MPORT_2_addr_pipe_0]
                              : 0U) : ((1U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))
                                        ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m2_MPORT_1_addr_pipe_0))
                                            ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1
                                           [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m2_MPORT_1_addr_pipe_0]
                                            : 0U) : 
                                       ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))
                                         ? ((0x80U 
                                             >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m2_MPORT_addr_pipe_0))
                                             ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0
                                            [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m2_MPORT_addr_pipe_0]
                                             : 0U) : 0U))));
    vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m1_T_27 
        = ((3U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
            ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m1_MPORT_3_addr_pipe_0))
                ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3
               [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m1_MPORT_3_addr_pipe_0]
                : 0U) : ((2U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
                          ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m1_MPORT_2_addr_pipe_0))
                              ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2
                             [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m1_MPORT_2_addr_pipe_0]
                              : 0U) : ((1U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
                                        ? ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m1_MPORT_1_addr_pipe_0))
                                            ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1
                                           [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m1_MPORT_1_addr_pipe_0]
                                            : 0U) : 
                                       ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
                                         ? ((0x80U 
                                             >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m1_MPORT_addr_pipe_0))
                                             ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0
                                            [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m1_MPORT_addr_pipe_0]
                                             : 0U) : 0U))));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH = (0x10U 
                                                 < 
                                                 (0xffU 
                                                  & (VL_GTES_III(9, (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16), (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16))
                                                      ? 
                                                     ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16) 
                                                      - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16))
                                                      : 
                                                     ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16) 
                                                      - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16)))));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF = (0x10U 
                                                 < 
                                                 (0xffU 
                                                  & (VL_GTES_III(9, (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16), (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16))
                                                      ? 
                                                     ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16) 
                                                      - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16))
                                                      : 
                                                     ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16) 
                                                      - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16)))));
    vlSelf->io_out_valid = (1U & (~ ((~ (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full)) 
                                     & (IData)(PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match))));
    __VdfgTmp_he5113679__0 = ((IData)(PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match) 
                              & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m2 = ((4U 
                                                   == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))
                                                   ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data
                                                   : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1 = ((4U 
                                                   == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
                                                   ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_data
                                                   : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m1_T_27);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__do_deq 
        = ((IData)(vlSelf->io_out_valid) & (IData)(vlSelf->io_out_ready));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en 
        = ((~ (IData)(__VdfgTmp_he5113679__0)) & (IData)(PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid));
    vlSelf->io_in_ready = (1U & (~ ((IData)(__VdfgTmp_he5113679__0) 
                                    & (IData)(PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid))));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1 = 
        ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
          ? vlSelf->io_in_bits_pix : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn = ((IData)(vlSelf->io_in_ready) 
                                                  & (IData)(vlSelf->io_in_valid));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m2 = 
        ((1U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
          ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1
          : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m2);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m3 = 
        ((2U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
          ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m2
          : ((4U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx))
              ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_data
              : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m3_T_27));
}

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___eval_stl(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_stl\n"); );
    // Body
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VPhlabXbr2xPipelineRGB___024root___stl_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___eval_triggers__stl(VPhlabXbr2xPipelineRGB___024root* vlSelf);

VL_ATTR_COLD bool VPhlabXbr2xPipelineRGB___024root___eval_phase__stl(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_phase__stl\n"); );
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    VPhlabXbr2xPipelineRGB___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelf->__VstlTriggered.any();
    if (__VstlExecute) {
        VPhlabXbr2xPipelineRGB___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__ico(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VicoTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__act(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clock)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__nba(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clock)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___ctor_var_reset(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_in_ready = VL_RAND_RESET_I(1);
    vlSelf->io_in_valid = VL_RAND_RESET_I(1);
    vlSelf->io_in_bits_pix = VL_RAND_RESET_I(24);
    vlSelf->io_in_bits_sof = VL_RAND_RESET_I(1);
    vlSelf->io_in_bits_eol = VL_RAND_RESET_I(1);
    vlSelf->io_out_ready = VL_RAND_RESET_I(1);
    vlSelf->io_out_valid = VL_RAND_RESET_I(1);
    vlSelf->io_out_bits_block_0 = VL_RAND_RESET_I(24);
    vlSelf->io_out_bits_block_1 = VL_RAND_RESET_I(24);
    vlSelf->io_out_bits_block_2 = VL_RAND_RESET_I(24);
    vlSelf->io_out_bits_block_3 = VL_RAND_RESET_I(24);
    vlSelf->io_out_bits_x = VL_RAND_RESET_I(16);
    vlSelf->io_out_bits_y = VL_RAND_RESET_I(16);
    vlSelf->io_out_bits_sof = VL_RAND_RESET_I(1);
    vlSelf->io_out_bits_eol = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 129; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0[__Vi0] = VL_RAND_RESET_I(24);
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m1_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m2_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m3_MPORT_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 129; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1[__Vi0] = VL_RAND_RESET_I(24);
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m1_MPORT_1_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m2_MPORT_1_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m3_MPORT_1_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 129; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2[__Vi0] = VL_RAND_RESET_I(24);
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m1_MPORT_2_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m2_MPORT_2_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m3_MPORT_2_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 129; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3[__Vi0] = VL_RAND_RESET_I(24);
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m1_MPORT_3_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m2_MPORT_3_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m3_MPORT_3_addr_pipe_0 = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 129; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4[__Vi0] = VL_RAND_RESET_I(24);
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_data = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_data = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_addr_pipe_0 = VL_RAND_RESET_I(8);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__v1 = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__v2 = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__v3 = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__v4 = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_emit = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_emit = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_emit = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_0 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_1 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_2 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_3 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_xc = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_yc = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_sof = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_eol = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__x = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__y = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT___y_T_1 = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT___x_T_2 = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx = VL_RAND_RESET_I(3);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx = VL_RAND_RESET_I(3);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx = VL_RAND_RESET_I(3);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx = VL_RAND_RESET_I(3);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__prev4Idx = VL_RAND_RESET_I(3);
    vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m1_T_27 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m2 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m3_T_27 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m2 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m3 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_sof = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_eol = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_y = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_3 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_4 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_2 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_3 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_4 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_3 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_4 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_H = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_N = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_R = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_xc = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_yc = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_sof = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_eol = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT___s2_yc_T_1 = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_H = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_R = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_xc = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_yc = VL_RAND_RESET_I(16);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_sof = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_eol = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16 = VL_RAND_RESET_I(9);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16 = VL_RAND_RESET_I(9);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16 = VL_RAND_RESET_I(9);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16 = VL_RAND_RESET_I(9);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_hfa614da6__0 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_h2134906a__0 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_h3b0b4895__0 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_ha5303256__0 = VL_RAND_RESET_I(24);
    vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_hf53e553c__0 = VL_RAND_RESET_I(24);
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0[__Vi0] = VL_RAND_RESET_I(24);
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1[__Vi0] = VL_RAND_RESET_I(24);
    }
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2[__Vi0] = VL_RAND_RESET_I(24);
    }
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3[__Vi0] = VL_RAND_RESET_I(24);
    }
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x[__Vi0] = VL_RAND_RESET_I(16);
    }
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y[__Vi0] = VL_RAND_RESET_I(16);
    }
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof[__Vi0] = VL_RAND_RESET_I(1);
    }
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol[__Vi0] = VL_RAND_RESET_I(1);
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value = VL_RAND_RESET_I(10);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value = VL_RAND_RESET_I(10);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__do_deq = VL_RAND_RESET_I(1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_1 = VL_RAND_RESET_I(10);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_3 = VL_RAND_RESET_I(10);
    vlSelf->__Vtrigprevexpr___TOP__clock__0 = VL_RAND_RESET_I(1);
}

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___configure_coverage(VPhlabXbr2xPipelineRGB___024root* vlSelf, bool first) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___configure_coverage\n"); );
    // Body
    if (false && first) {}  // Prevent unused
}
