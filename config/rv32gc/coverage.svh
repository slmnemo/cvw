// coverage.svh
// David_Harris@hmc.edu 7 September 2024
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

// This file is needed in the config subdirectory for each config supporting coverage.
// It defines which extensions are enabled for that config.

// Define XLEN, used in covergroups
`define XLEN32 1

// Define relevant addresses
`define ACCESS_FAULT_ADDRESS 32'h0000
`define CLINT_BASE 64'h02000000

// Unprivileged extensions
`include "RV32I_coverage.svh"
`include "RV32M_coverage.svh"
`include "RV32F_coverage.svh"
`include "RV32D_coverage.svh"
`include "RV32Zba_coverage.svh"
`include "RV32Zbb_coverage.svh"
`include "RV32Zbc_coverage.svh"
`include "RV32Zbs_coverage.svh"
`include "RV32ZfaF_coverage.svh"
`include "RV32ZfaD_coverage.svh"
`include "RV32ZfaZfh_coverage.svh"
`include "RV32ZfhD_coverage.svh"
`include "RV32Zfh_coverage.svh"
`include "RV32Zicond_coverage.svh"
`include "RV32Zca_coverage.svh"
`include "RV32Zcb_coverage.svh"
`include "RV32ZcbM_coverage.svh"
`include "RV32ZcbZbb_coverage.svh"
`include "RV32Zcf_coverage.svh"
`include "RV32Zcd_coverage.svh"
`include "RV32Zicsr_coverage.svh"

// Privileged extensions
`include "ZicsrM_coverage.svh"
`include "ZicsrF_coverage.svh"
`include "ZicsrU_coverage.svh"
`include "RV32VM_coverage.svh"
`include "RV32VM_PMP_coverage.svh"
`include "EndianU_coverage.svh"
`include "EndianM_coverage.svh"
`include "EndianS_coverage.svh"
`include "ExceptionsM_coverage.svh"
`include "ExceptionsZc_coverage.svh"
