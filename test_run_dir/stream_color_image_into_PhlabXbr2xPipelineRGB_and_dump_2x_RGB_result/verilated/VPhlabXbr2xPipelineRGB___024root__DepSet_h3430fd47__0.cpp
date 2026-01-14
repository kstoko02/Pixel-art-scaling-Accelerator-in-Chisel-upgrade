// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VPhlabXbr2xPipelineRGB.h for the primary calling header

#include "VPhlabXbr2xPipelineRGB__pch.h"
#include "VPhlabXbr2xPipelineRGB__Syms.h"
#include "VPhlabXbr2xPipelineRGB___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__ico(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG

void VPhlabXbr2xPipelineRGB___024root___eval_triggers__ico(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_triggers__ico\n"); );
    // Body
    vlSelf->__VicoTriggered.set(0U, (IData)(vlSelf->__VicoFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VPhlabXbr2xPipelineRGB___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__act(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG

void VPhlabXbr2xPipelineRGB___024root___eval_triggers__act(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.set(0U, ((IData)(vlSelf->clock) 
                                     & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__clock__0))));
    vlSelf->__Vtrigprevexpr___TOP__clock__0 = vlSelf->clock;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VPhlabXbr2xPipelineRGB___024root___dump_triggers__act(vlSelf);
    }
#endif
}
