// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VPHLABXBR2XPIPELINERGB__SYMS_H_
#define VERILATED_VPHLABXBR2XPIPELINERGB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VPhlabXbr2xPipelineRGB.h"

// INCLUDE MODULE CLASSES
#include "VPhlabXbr2xPipelineRGB___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)VPhlabXbr2xPipelineRGB__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VPhlabXbr2xPipelineRGB* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VPhlabXbr2xPipelineRGB___024root TOP;

    // CONSTRUCTORS
    VPhlabXbr2xPipelineRGB__Syms(VerilatedContext* contextp, const char* namep, VPhlabXbr2xPipelineRGB* modelp);
    ~VPhlabXbr2xPipelineRGB__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
