// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VPhlabXbr2xPipelineRGB.h for the primary calling header

#include "VPhlabXbr2xPipelineRGB__pch.h"
#include "VPhlabXbr2xPipelineRGB__Syms.h"
#include "VPhlabXbr2xPipelineRGB___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__stl(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___eval_triggers__stl(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_triggers__stl\n"); );
    // Body
    vlSelf->__VstlTriggered.set(0U, (IData)(vlSelf->__VstlFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VPhlabXbr2xPipelineRGB___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
