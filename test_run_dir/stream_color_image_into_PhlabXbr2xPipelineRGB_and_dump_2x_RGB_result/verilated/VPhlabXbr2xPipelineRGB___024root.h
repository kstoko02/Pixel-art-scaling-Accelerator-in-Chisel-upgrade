// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VPhlabXbr2xPipelineRGB.h for the primary calling header

#ifndef VERILATED_VPHLABXBR2XPIPELINERGB___024ROOT_H_
#define VERILATED_VPHLABXBR2XPIPELINERGB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_cov.h"


class VPhlabXbr2xPipelineRGB__Syms;

class alignas(VL_CACHE_LINE_BYTES) VPhlabXbr2xPipelineRGB___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        VL_IN8(clock,0,0);
        VL_IN8(reset,0,0);
        VL_OUT8(io_in_ready,0,0);
        VL_IN8(io_in_valid,0,0);
        VL_IN8(io_in_bits_sof,0,0);
        VL_IN8(io_in_bits_eol,0,0);
        VL_IN8(io_out_ready,0,0);
        VL_OUT8(io_out_valid,0,0);
        VL_OUT8(io_out_bits_sof,0,0);
        VL_OUT8(io_out_bits_eol,0,0);
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf0_raw_m1_MPORT_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf0_raw_m2_MPORT_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf0_raw_m3_MPORT_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf1_raw_m1_MPORT_1_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf1_raw_m2_MPORT_1_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf1_raw_m3_MPORT_1_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf2_raw_m1_MPORT_2_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf2_raw_m2_MPORT_2_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf2_raw_m3_MPORT_2_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf3_raw_m1_MPORT_3_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf3_raw_m2_MPORT_3_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf3_raw_m3_MPORT_3_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_addr_pipe_0;
        CData/*7:0*/ PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_addr_pipe_0;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__v1;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__v2;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__v3;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__v4;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s2_emit;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s3_emit;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s4_emit;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s4_sof;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s4_eol;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__fireIn;
        CData/*2:0*/ PhlabXbr2xPipelineRGB__DOT__curIdx;
        CData/*2:0*/ PhlabXbr2xPipelineRGB__DOT__prev1Idx;
        CData/*2:0*/ PhlabXbr2xPipelineRGB__DOT__prev2Idx;
        CData/*2:0*/ PhlabXbr2xPipelineRGB__DOT__prev3Idx;
        CData/*2:0*/ PhlabXbr2xPipelineRGB__DOT__prev4Idx;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s1_sof;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s1_eol;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s2_sof;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s2_eol;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s3_sof;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__s3_eol;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__bNeqH;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__dNeqF;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0_MPORT_en;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT__maybe_full;
        CData/*0:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT__do_deq;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __VicoFirstIteration;
        CData/*0:0*/ __Vtrigprevexpr___TOP__clock__0;
        CData/*0:0*/ __VactContinue;
        VL_OUT16(io_out_bits_x,15,0);
        VL_OUT16(io_out_bits_y,15,0);
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s4_xc;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s4_yc;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__x;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__y;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT___y_T_1;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT___x_T_2;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s1_x;
    };
    struct {
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s1_y;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s2_xc;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s2_yc;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT___s2_yc_T_1;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s3_xc;
        SData/*15:0*/ PhlabXbr2xPipelineRGB__DOT__s3_yc;
        SData/*8:0*/ PhlabXbr2xPipelineRGB__DOT__bNeqH_a16;
        SData/*8:0*/ PhlabXbr2xPipelineRGB__DOT__bNeqH_b16;
        SData/*8:0*/ PhlabXbr2xPipelineRGB__DOT__dNeqF_a16;
        SData/*8:0*/ PhlabXbr2xPipelineRGB__DOT__dNeqF_b16;
        SData/*9:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT__enq_ptr_value;
        SData/*9:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT__deq_ptr_value;
        SData/*9:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_1;
        SData/*9:0*/ PhlabXbr2xPipelineRGB__DOT__outQ__DOT___value_T_3;
        VL_IN(io_in_bits_pix,23,0);
        VL_OUT(io_out_bits_block_0,23,0);
        VL_OUT(io_out_bits_block_1,23,0);
        VL_OUT(io_out_bits_block_2,23,0);
        VL_OUT(io_out_bits_block_3,23,0);
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__buf4_raw_m1_MPORT_4_data;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__buf4_raw_m2_MPORT_4_data;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__buf4_raw_m3_MPORT_4_data;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s4_block_0;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s4_block_1;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s4_block_2;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s4_block_3;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT___raw_m1_T_27;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__raw_m1;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT___raw_m2_T_27;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__raw_m2;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT___raw_m3_T_27;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s1_row_m1;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s1_row_m2;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s1_row_m3;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__sr3_3;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__sr3_4;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__sr2_2;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__sr2_3;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__sr2_4;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__sr1_3;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__sr1_4;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s2_win_reg_H;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s2_win_reg_L;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s2_win_reg_M;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s2_win_reg_N;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s2_win_reg_R;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s3_win_H;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s3_win_L;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s3_win_M;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s3_win_N;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT__s3_win_R;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT____Vlvbound_hfa614da6__0;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT____Vlvbound_h2134906a__0;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT____Vlvbound_h3b0b4895__0;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT____Vlvbound_ha5303256__0;
        IData/*23:0*/ PhlabXbr2xPipelineRGB__DOT____Vlvbound_hf53e553c__0;
        IData/*31:0*/ __VactIterCount;
        VlUnpacked<IData/*23:0*/, 129> PhlabXbr2xPipelineRGB__DOT__buf0;
        VlUnpacked<IData/*23:0*/, 129> PhlabXbr2xPipelineRGB__DOT__buf1;
        VlUnpacked<IData/*23:0*/, 129> PhlabXbr2xPipelineRGB__DOT__buf2;
        VlUnpacked<IData/*23:0*/, 129> PhlabXbr2xPipelineRGB__DOT__buf3;
        VlUnpacked<IData/*23:0*/, 129> PhlabXbr2xPipelineRGB__DOT__buf4;
        VlUnpacked<IData/*23:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_0;
        VlUnpacked<IData/*23:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_1;
    };
    struct {
        VlUnpacked<IData/*23:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_2;
        VlUnpacked<IData/*23:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_block_3;
        VlUnpacked<SData/*15:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_x;
        VlUnpacked<SData/*15:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_y;
        VlUnpacked<CData/*0:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_sof;
        VlUnpacked<CData/*0:0*/, 1024> PhlabXbr2xPipelineRGB__DOT__outQ__DOT__ram_eol;
    };
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    VPhlabXbr2xPipelineRGB__Syms* const vlSymsp;

    // CONSTRUCTORS
    VPhlabXbr2xPipelineRGB___024root(VPhlabXbr2xPipelineRGB__Syms* symsp, const char* v__name);
    ~VPhlabXbr2xPipelineRGB___024root();
    VL_UNCOPYABLE(VPhlabXbr2xPipelineRGB___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
    void __vlCoverInsert(uint32_t* countp, bool enable, const char* filenamep, int lineno, int column,
        const char* hierp, const char* pagep, const char* commentp, const char* linescovp);
};


#endif  // guard
