// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VPhlabXbr2xPipelineRGB.h for the primary calling header

#include "VPhlabXbr2xPipelineRGB__pch.h"
#include "VPhlabXbr2xPipelineRGB___024root.h"

VL_INLINE_OPT void VPhlabXbr2xPipelineRGB___024root___ico_sequent__TOP__0(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___ico_sequent__TOP__0\n"); );
    // Body
    vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn = ((IData)(vlSelf->io_in_ready) 
                                                  & (IData)(vlSelf->io_in_valid));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__do_deq 
        = ((IData)(vlSelf->io_out_valid) & (IData)(vlSelf->io_out_ready));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1 = 
        ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
          ? vlSelf->io_in_bits_pix : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1);
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

void VPhlabXbr2xPipelineRGB___024root___eval_ico(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_ico\n"); );
    // Body
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        VPhlabXbr2xPipelineRGB___024root___ico_sequent__TOP__0(vlSelf);
    }
}

void VPhlabXbr2xPipelineRGB___024root___eval_triggers__ico(VPhlabXbr2xPipelineRGB___024root* vlSelf);

bool VPhlabXbr2xPipelineRGB___024root___eval_phase__ico(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_phase__ico\n"); );
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    VPhlabXbr2xPipelineRGB___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelf->__VicoTriggered.any();
    if (__VicoExecute) {
        VPhlabXbr2xPipelineRGB___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void VPhlabXbr2xPipelineRGB___024root___eval_act(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_act\n"); );
}

VL_INLINE_OPT void VPhlabXbr2xPipelineRGB___024root___nba_sequent__TOP__0(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___nba_sequent__TOP__0\n"); );
    // Init
    CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid;
    PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid = 0;
    CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match;
    PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match = 0;
    CData/*0:0*/ __VdfgTmp_he5113679__0;
    __VdfgTmp_he5113679__0 = 0;
    CData/*7:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf4__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf4__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf4__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf4__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf4__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf4__v0 = 0;
    CData/*7:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf3__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf3__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf3__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf3__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf3__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf3__v0 = 0;
    CData/*7:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf0__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf0__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf0__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf0__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf0__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf0__v0 = 0;
    CData/*7:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf1__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf1__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf1__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf1__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf1__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf1__v0 = 0;
    CData/*7:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf2__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf2__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf2__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf2__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf2__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf2__v0 = 0;
    IData/*23:0*/ __Vdly__PhlabXbr2xPipelineRGB__DOT__sr1_3;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr1_3 = 0;
    CData/*2:0*/ __Vdly__PhlabXbr2xPipelineRGB__DOT__prev4Idx;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__prev4Idx = 0;
    IData/*23:0*/ __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3 = 0;
    IData/*23:0*/ __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_4;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_4 = 0;
    IData/*23:0*/ __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2 = 0;
    IData/*23:0*/ __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3 = 0;
    IData/*23:0*/ __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_4;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_4 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0 = 0;
    SData/*15:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0 = 0;
    SData/*15:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0 = 0;
    IData/*23:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0 = 0;
    CData/*0:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0 = 0;
    SData/*9:0*/ __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0;
    __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0 = 0;
    CData/*0:0*/ __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0;
    __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0 = 0;
    CData/*0:0*/ __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0 = 0;
    // Body
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf4__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf2__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf1__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf0__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf3__v0 = 0U;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_4 = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_4;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3 = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_3;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2 = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_2;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_4 = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_4;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3 = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_3;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__prev4Idx = vlSelf->PhlabXbr2xPipelineRGB__DOT__prev4Idx;
    __Vdly__PhlabXbr2xPipelineRGB__DOT__sr1_3 = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_3;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0 = 0U;
    __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0 = 0U;
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & ((0U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
            & ((1U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
               & ((2U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
                  & ((3U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
                     & (4U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))))))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_hf53e553c__0 
            = vlSelf->io_in_bits_pix;
        if ((0x80U >= (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x)))) {
            __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf4__v0 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_hf53e553c__0;
            __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf4__v0 = 1U;
            __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf4__v0 
                = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        }
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & ((0U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
            & ((1U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
               & (2U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_h3b0b4895__0 
            = vlSelf->io_in_bits_pix;
        if ((0x80U >= (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x)))) {
            __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf2__v0 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_h3b0b4895__0;
            __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf2__v0 = 1U;
            __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf2__v0 
                = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        }
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & ((0U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
            & (1U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx))))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_h2134906a__0 
            = vlSelf->io_in_bits_pix;
        if ((0x80U >= (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x)))) {
            __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf1__v0 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_h2134906a__0;
            __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf1__v0 = 1U;
            __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf1__v0 
                = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        }
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & (0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_hfa614da6__0 
            = vlSelf->io_in_bits_pix;
        if ((0x80U >= (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x)))) {
            __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf0__v0 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_hfa614da6__0;
            __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf0__v0 = 1U;
            __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf0__v0 
                = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        }
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & ((0U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
            & ((1U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
               & ((2U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)) 
                  & (3U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx))))))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_ha5303256__0 
            = vlSelf->io_in_bits_pix;
        if ((0x80U >= (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x)))) {
            __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf3__v0 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT____Vlvbound_ha5303256__0;
            __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf3__v0 = 1U;
            __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf3__v0 
                = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        }
    }
    if (vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en) {
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_eol;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_sof;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_2;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_0;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_yc;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_1;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_3;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_xc;
        __Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0 = 1U;
        __Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf4__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf4__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf4__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf2__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf2__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf2__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf1__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf1__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf1__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf0__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf0__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf0__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__buf3__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__buf3__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__buf3__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3__v0;
    }
    if (__Vdlyvset__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x[__Vdlyvdim0__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0] 
            = __Vdlyvval__PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x__v0;
    }
    if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v3))) {
        if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH) 
             & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_0 
                = ((0x10U >= (0xffU & (VL_GTES_III(9, (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16), (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16))
                                        ? ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16))
                                        : ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16)))))
                    ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L
                    : vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M);
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_1 
                = ((0x10U >= (0xffU & (VL_GTES_III(9, (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16), (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16))
                                        ? ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16))
                                        : ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_a16)))))
                    ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N
                    : vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M);
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_2 
                = ((0x10U >= (0xffU & (VL_GTES_III(9, (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16), (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16))
                                        ? ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16))
                                        : ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_a16)))))
                    ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L
                    : vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M);
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_3 
                = ((0x10U >= (0xffU & (VL_GTES_III(9, (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16), (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16))
                                        ? ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16))
                                        : ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__dNeqF_b16) 
                                           - (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__bNeqH_b16)))))
                    ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N
                    : vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M);
        } else {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_0 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_1 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_2 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_block_3 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M;
        }
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_xc = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_xc;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_yc = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_yc;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_sof 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_sof;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_eol 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_eol;
    }
    if (vlSelf->reset) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value = 0U;
    } else {
        if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en) 
             != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__do_deq))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en;
        }
        if (vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__do_deq) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_3;
        }
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_3 
        = (0x3ffU & ((IData)(1U) + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value)));
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
    if (vlSelf->reset) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value = 0U;
    } else if (vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_1;
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_1 
        = (0x3ffU & ((IData)(1U) + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value)));
    PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match 
        = ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value) 
           == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value));
    if (vlSelf->reset) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__v4 = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_emit = 0U;
    } else {
        if (vlSelf->io_in_ready) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__v4 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__v3;
        }
        if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v3))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_emit 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_emit;
        }
    }
    PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid = 
        ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s4_emit) 
         & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v4));
    if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v2))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_H 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_H;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_L 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_M 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_N 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_N;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_win_R 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_R;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_xc = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_xc;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_yc = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_yc;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_sof 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_sof;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_eol 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_eol;
    }
    vlSelf->io_out_valid = (1U & (~ ((~ (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full)) 
                                     & (IData)(PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match))));
    __VdfgTmp_he5113679__0 = ((IData)(PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ptr_match) 
                              & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__do_deq 
        = ((IData)(vlSelf->io_out_valid) & (IData)(vlSelf->io_out_ready));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en 
        = ((~ (IData)(__VdfgTmp_he5113679__0)) & (IData)(PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid));
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
    if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v1))) {
        if ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_R 
                = ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                    ? vlSelf->io_in_bits_pix : ((4U 
                                                 == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
                                                 ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_data
                                                 : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m1_T_27));
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_H 
                = ((2U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                    ? ((1U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                        ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1
                        : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m2)
                    : ((4U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx))
                        ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_data
                        : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m3_T_27));
            if ((1U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))) {
                if ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))) {
                    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L 
                        = vlSelf->io_in_bits_pix;
                    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M 
                        = vlSelf->io_in_bits_pix;
                } else {
                    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L 
                        = vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1;
                    vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M 
                        = vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1;
                }
            } else if ((4U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))) {
                vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data;
                vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data;
            } else {
                vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27;
                vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27;
            }
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_N 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m2;
        } else if ((1U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_R 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_4;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_H 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_4;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_3;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_4;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_N 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m2;
        } else {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_R 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_3;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_H 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_3;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_2;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_3;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_win_reg_N 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_4;
        }
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_xc = 
            (0xffffU & ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x) 
                        - (IData)(2U)));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_yc = vlSelf->PhlabXbr2xPipelineRGB__DOT___s2_yc_T_1;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_sof 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_sof;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_eol 
            = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_eol;
    }
    if (vlSelf->reset) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__v3 = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_emit = 0U;
        __Vdly__PhlabXbr2xPipelineRGB__DOT__sr1_3 = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__v2 = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_emit = 0U;
    } else {
        if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v2))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s3_emit 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_emit;
        }
        if (vlSelf->io_in_ready) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__v3 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__v2;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__v2 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__v1;
        }
        if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v1))) {
            __Vdly__PhlabXbr2xPipelineRGB__DOT__sr1_3 
                = ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x))
                    ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1
                    : ((1U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x))
                        ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1
                        : vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_4));
            vlSelf->PhlabXbr2xPipelineRGB__DOT__s2_emit 
                = ((2U <= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x)) 
                   & (2U <= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_y)));
        }
    }
    if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_y = vlSelf->PhlabXbr2xPipelineRGB__DOT__y;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_sof 
            = vlSelf->io_in_bits_sof;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_eol 
            = vlSelf->io_in_bits_eol;
    }
    if (vlSelf->reset) {
        __Vdly__PhlabXbr2xPipelineRGB__DOT__prev4Idx = 4U;
        __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3 = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_4 = 0U;
        __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_4 = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx = 3U;
        __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2 = 0U;
        __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3 = 0U;
    } else {
        if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v1))) {
            if ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x))) {
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m3;
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2 
                    = ((1U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                        ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1
                        : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m2);
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m2;
            } else if ((1U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x))) {
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m3;
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_4;
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m2;
            } else {
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_4;
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_3;
                __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_4;
            }
            vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_4 
                = ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                    ? vlSelf->io_in_bits_pix : ((4U 
                                                 == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
                                                 ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_data
                                                 : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m1_T_27));
            __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_4 
                = ((2U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                    ? ((1U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                        ? vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1
                        : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m2)
                    : ((4U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx))
                        ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_data
                        : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m3_T_27));
        }
        if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
             & (IData)(vlSelf->io_in_bits_sof))) {
            __Vdly__PhlabXbr2xPipelineRGB__DOT__prev4Idx = 4U;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx = 3U;
        } else if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
                    & (IData)(vlSelf->io_in_bits_eol))) {
            __Vdly__PhlabXbr2xPipelineRGB__DOT__prev4Idx 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__prev3Idx 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx;
        }
    }
    if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_x = vlSelf->PhlabXbr2xPipelineRGB__DOT__x;
    }
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
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr1_3 = __Vdly__PhlabXbr2xPipelineRGB__DOT__sr1_3;
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_3 = __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_3;
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr3_4 = __Vdly__PhlabXbr2xPipelineRGB__DOT__sr3_4;
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_2 = __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_2;
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_3 = __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_3;
    if (vlSelf->reset) {
        __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_4 = 0U;
    } else if (((IData)(vlSelf->io_in_ready) & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__v1))) {
        __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_4 = 
            ((1U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
              ? ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
                  ? vlSelf->io_in_bits_pix : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1)
              : ((4U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))
                  ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data
                  : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27));
    }
    vlSelf->PhlabXbr2xPipelineRGB__DOT__sr2_4 = __Vdly__PhlabXbr2xPipelineRGB__DOT__sr2_4;
    vlSelf->PhlabXbr2xPipelineRGB__DOT___s2_yc_T_1 
        = (0xffffU & ((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_y) 
                      - (IData)(2U)));
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & (0U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m1_MPORT_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m2_MPORT_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf0_raw_m3_MPORT_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & (1U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m1_MPORT_1_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m2_MPORT_1_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf1_raw_m3_MPORT_1_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & (2U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m1_MPORT_2_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m2_MPORT_2_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf2_raw_m3_MPORT_2_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & (3U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m1_MPORT_3_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m2_MPORT_3_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf3_raw_m3_MPORT_3_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
    }
    if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
         & (4U != (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx)))) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
        vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_addr_pipe_0 
            = (0xffU & (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x));
    }
    if (vlSelf->reset) {
        vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx = 2U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__v1 = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__y = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx = 1U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx = 0U;
        vlSelf->PhlabXbr2xPipelineRGB__DOT__x = 0U;
    } else {
        if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
             & (IData)(vlSelf->io_in_bits_sof))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx = 2U;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx = 1U;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx = 0U;
        } else if (((IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) 
                    & (IData)(vlSelf->io_in_bits_eol))) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx;
            vlSelf->PhlabXbr2xPipelineRGB__DOT__curIdx 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__prev4Idx;
        }
        if (vlSelf->io_in_ready) {
            vlSelf->PhlabXbr2xPipelineRGB__DOT__v1 
                = vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn;
        }
        if (vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn) {
            if (vlSelf->io_in_bits_sof) {
                vlSelf->PhlabXbr2xPipelineRGB__DOT__y = 0U;
                vlSelf->PhlabXbr2xPipelineRGB__DOT__x 
                    = (1U & (~ (IData)(vlSelf->io_in_bits_eol)));
            } else if (vlSelf->io_in_bits_eol) {
                vlSelf->PhlabXbr2xPipelineRGB__DOT__y 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT___y_T_1;
                vlSelf->PhlabXbr2xPipelineRGB__DOT__x = 0U;
            } else {
                vlSelf->PhlabXbr2xPipelineRGB__DOT__x 
                    = vlSelf->PhlabXbr2xPipelineRGB__DOT___x_T_2;
            }
        }
    }
    vlSelf->io_in_ready = (1U & (~ ((IData)(__VdfgTmp_he5113679__0) 
                                    & (IData)(PhlabXbr2xPipelineRGB__DOT__outQ_io_enq_valid))));
    vlSelf->PhlabXbr2xPipelineRGB__DOT___y_T_1 = (0xffffU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y)));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_data 
        = ((0x80U >= (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_addr_pipe_0))
            ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4
           [vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_addr_pipe_0]
            : 0U);
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
    vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m2 = ((4U 
                                                   == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev2Idx))
                                                   ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data
                                                   : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1 = ((4U 
                                                   == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__prev1Idx))
                                                   ? vlSelf->PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_data
                                                   : vlSelf->PhlabXbr2xPipelineRGB__DOT___raw_m1_T_27);
    vlSelf->PhlabXbr2xPipelineRGB__DOT__prev4Idx = __Vdly__PhlabXbr2xPipelineRGB__DOT__prev4Idx;
    vlSelf->PhlabXbr2xPipelineRGB__DOT__fireIn = ((IData)(vlSelf->io_in_ready) 
                                                  & (IData)(vlSelf->io_in_valid));
    vlSelf->PhlabXbr2xPipelineRGB__DOT__s1_row_m1 = 
        ((0U == (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__y))
          ? vlSelf->io_in_bits_pix : vlSelf->PhlabXbr2xPipelineRGB__DOT__raw_m1);
    vlSelf->PhlabXbr2xPipelineRGB__DOT___x_T_2 = (0xffffU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelf->PhlabXbr2xPipelineRGB__DOT__x)));
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

void VPhlabXbr2xPipelineRGB___024root___eval_nba(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VPhlabXbr2xPipelineRGB___024root___nba_sequent__TOP__0(vlSelf);
    }
}

void VPhlabXbr2xPipelineRGB___024root___eval_triggers__act(VPhlabXbr2xPipelineRGB___024root* vlSelf);

bool VPhlabXbr2xPipelineRGB___024root___eval_phase__act(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    VPhlabXbr2xPipelineRGB___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        VPhlabXbr2xPipelineRGB___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VPhlabXbr2xPipelineRGB___024root___eval_phase__nba(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        VPhlabXbr2xPipelineRGB___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__ico(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__nba(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VPhlabXbr2xPipelineRGB___024root___dump_triggers__act(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG

void VPhlabXbr2xPipelineRGB___024root___eval(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VicoIterCount;
    CData/*0:0*/ __VicoContinue;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VicoIterCount = 0U;
    vlSelf->__VicoFirstIteration = 1U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        if (VL_UNLIKELY((0x64U < __VicoIterCount))) {
#ifdef VL_DEBUG
            VPhlabXbr2xPipelineRGB___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("PhlabXbr2xPipelineRGB.sv", 297, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (VPhlabXbr2xPipelineRGB___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelf->__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            VPhlabXbr2xPipelineRGB___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("PhlabXbr2xPipelineRGB.sv", 297, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                VPhlabXbr2xPipelineRGB___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("PhlabXbr2xPipelineRGB.sv", 297, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (VPhlabXbr2xPipelineRGB___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (VPhlabXbr2xPipelineRGB___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void VPhlabXbr2xPipelineRGB___024root___eval_debug_assertions(VPhlabXbr2xPipelineRGB___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VPhlabXbr2xPipelineRGB__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VPhlabXbr2xPipelineRGB___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_in_valid & 0xfeU))) {
        Verilated::overWidthError("io_in_valid");}
    if (VL_UNLIKELY((vlSelf->io_in_bits_pix & 0xff000000U))) {
        Verilated::overWidthError("io_in_bits_pix");}
    if (VL_UNLIKELY((vlSelf->io_in_bits_sof & 0xfeU))) {
        Verilated::overWidthError("io_in_bits_sof");}
    if (VL_UNLIKELY((vlSelf->io_in_bits_eol & 0xfeU))) {
        Verilated::overWidthError("io_in_bits_eol");}
    if (VL_UNLIKELY((vlSelf->io_out_ready & 0xfeU))) {
        Verilated::overWidthError("io_out_ready");}
}
#endif  // VL_DEBUG
