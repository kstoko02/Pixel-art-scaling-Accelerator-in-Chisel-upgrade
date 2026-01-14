// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VPhlabXbr2xPipelineRGB__pch.h"

//============================================================
// Constructors

VPhlabXbr2xPipelineRGB::VPhlabXbr2xPipelineRGB(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VPhlabXbr2xPipelineRGB__Syms(contextp(), _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_in_ready{vlSymsp->TOP.io_in_ready}
    , io_in_valid{vlSymsp->TOP.io_in_valid}
    , io_in_bits_sof{vlSymsp->TOP.io_in_bits_sof}
    , io_in_bits_eol{vlSymsp->TOP.io_in_bits_eol}
    , io_out_ready{vlSymsp->TOP.io_out_ready}
    , io_out_valid{vlSymsp->TOP.io_out_valid}
    , io_out_bits_sof{vlSymsp->TOP.io_out_bits_sof}
    , io_out_bits_eol{vlSymsp->TOP.io_out_bits_eol}
    , io_out_bits_x{vlSymsp->TOP.io_out_bits_x}
    , io_out_bits_y{vlSymsp->TOP.io_out_bits_y}
    , io_in_bits_pix{vlSymsp->TOP.io_in_bits_pix}
    , io_out_bits_block_0{vlSymsp->TOP.io_out_bits_block_0}
    , io_out_bits_block_1{vlSymsp->TOP.io_out_bits_block_1}
    , io_out_bits_block_2{vlSymsp->TOP.io_out_bits_block_2}
    , io_out_bits_block_3{vlSymsp->TOP.io_out_bits_block_3}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

VPhlabXbr2xPipelineRGB::VPhlabXbr2xPipelineRGB(const char* _vcname__)
    : VPhlabXbr2xPipelineRGB(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VPhlabXbr2xPipelineRGB::~VPhlabXbr2xPipelineRGB() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VPhlabXbr2xPipelineRGB___024root___eval_debug_assertions(VPhlabXbr2xPipelineRGB___024root* vlSelf);
#endif  // VL_DEBUG
void VPhlabXbr2xPipelineRGB___024root___eval_static(VPhlabXbr2xPipelineRGB___024root* vlSelf);
void VPhlabXbr2xPipelineRGB___024root___eval_initial(VPhlabXbr2xPipelineRGB___024root* vlSelf);
void VPhlabXbr2xPipelineRGB___024root___eval_settle(VPhlabXbr2xPipelineRGB___024root* vlSelf);
void VPhlabXbr2xPipelineRGB___024root___eval(VPhlabXbr2xPipelineRGB___024root* vlSelf);

void VPhlabXbr2xPipelineRGB::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VPhlabXbr2xPipelineRGB::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VPhlabXbr2xPipelineRGB___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VPhlabXbr2xPipelineRGB___024root___eval_static(&(vlSymsp->TOP));
        VPhlabXbr2xPipelineRGB___024root___eval_initial(&(vlSymsp->TOP));
        VPhlabXbr2xPipelineRGB___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VPhlabXbr2xPipelineRGB___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool VPhlabXbr2xPipelineRGB::eventsPending() { return false; }

uint64_t VPhlabXbr2xPipelineRGB::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* VPhlabXbr2xPipelineRGB::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VPhlabXbr2xPipelineRGB___024root___eval_final(VPhlabXbr2xPipelineRGB___024root* vlSelf);

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB::final() {
    VPhlabXbr2xPipelineRGB___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VPhlabXbr2xPipelineRGB::hierName() const { return vlSymsp->name(); }
const char* VPhlabXbr2xPipelineRGB::modelName() const { return "VPhlabXbr2xPipelineRGB"; }
unsigned VPhlabXbr2xPipelineRGB::threads() const { return 1; }
void VPhlabXbr2xPipelineRGB::prepareClone() const { contextp()->prepareClone(); }
void VPhlabXbr2xPipelineRGB::atClone() const {
    contextp()->threadPoolpOnClone();
}

//============================================================
// Trace configuration

VL_ATTR_COLD void VPhlabXbr2xPipelineRGB::trace(VerilatedVcdC* tfp, int levels, int options) {
    vl_fatal(__FILE__, __LINE__, __FILE__,"'VPhlabXbr2xPipelineRGB::trace()' called on model that was Verilated without --trace option");
}
