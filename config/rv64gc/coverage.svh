// coverage.svh
// David_Harris@hmc.edu 7 September 2024
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

// This file is needed in the config subdirectory for each config supporting coverage.
// It defines which extensions are enabled for that config.

// Define XLEN, used in covergroups
`define XLEN64 1

// Define relevant addresses
`define ACCESS_FAULT_ADDRESS 64'h00000000
`define CLINT_BASE 64'h02000000

// Unprivileged extensions
`include "RV64I_coverage.svh"
`include "RV64M_coverage.svh"
`include "RV64F_coverage.svh"
`include "RV64D_coverage.svh"
`include "RV64Zba_coverage.svh"
`include "RV64Zbb_coverage.svh"
`include "RV64Zbc_coverage.svh"
`include "RV64Zbs_coverage.svh"
`include "RV64ZfaF_coverage.svh"
`include "RV64ZfaD_coverage.svh"
`include "RV64ZfaZfh_coverage.svh"
`include "RV64ZfhD_coverage.svh"
`include "RV64Zfh_coverage.svh"
`include "RV64Zicond_coverage.svh"
`include "RV64Zca_coverage.svh"
`include "RV64Zcb_coverage.svh"
`include "RV64ZcbM_coverage.svh"
`include "RV64ZcbZbb_coverage.svh"
`include "RV64ZcbZba_coverage.svh"
`include "RV64Zcd_coverage.svh"
`include "RV64Zicsr_coverage.svh"

// Privileged extensions
`include "RV64VM_coverage.svh"
`include "ZicsrM_coverage.svh"
`include "ZicsrF_coverage.svh"
`include "ZicsrU_coverage.svh"
`include "EndianU_coverage.svh"
`include "EndianM_coverage.svh"
`include "EndianS_coverage.svh"
`include "ExceptionsM_coverage.svh"
`include "ExceptionsZc_coverage.svh"
// `include "RV64VM_PMP_coverage.svh"
// `include "RV64CBO_VM_coverage.svh"
// `include "RV64CBO_PMP_coverage.svh"
// `include "RV64Zicbom_coverage.svh"
