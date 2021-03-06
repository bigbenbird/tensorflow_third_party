; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mcpu=skx | FileCheck %s --check-prefix=CHECK --check-prefix=SKX

declare void @f()
define <4 x i1> @test_4i1(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: test_4i1:
; CHECK:       ## BB#0:
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:  Lcfi0:
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    vpcmpnleud %xmm1, %xmm0, %k0
; CHECK-NEXT:    kmovw %k0, {{[0-9]+}}(%rsp) ## 2-byte Spill
; CHECK-NEXT:    vpcmpgtd %xmm1, %xmm0, %k0
; CHECK-NEXT:    kmovw %k0, {{[0-9]+}}(%rsp) ## 2-byte Spill
; CHECK-NEXT:    callq _f
; CHECK-NEXT:    kmovw {{[0-9]+}}(%rsp), %k0 ## 2-byte Reload
; CHECK-NEXT:    kmovw {{[0-9]+}}(%rsp), %k1 ## 2-byte Reload
; CHECK-NEXT:    korw %k1, %k0, %k0
; CHECK-NEXT:    vpmovm2d %k0, %xmm0
; CHECK-NEXT:    popq %rax
; CHECK-NEXT:    retq

  %cmp_res = icmp ugt <4 x i32> %a, %b
  %cmp_res2 = icmp sgt <4 x i32> %a, %b
  call void @f()
  %res = or <4 x i1> %cmp_res, %cmp_res2
  ret <4 x i1> %res
}

define <8 x i1> @test_8i1(<8 x i32> %a, <8 x i32> %b) {
; CHECK-LABEL: test_8i1:
; CHECK:       ## BB#0:
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:  Lcfi1:
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    vpcmpnleud %ymm1, %ymm0, %k0
; CHECK-NEXT:    kmovw %k0, {{[0-9]+}}(%rsp) ## 2-byte Spill
; CHECK-NEXT:    vpcmpgtd %ymm1, %ymm0, %k0
; CHECK-NEXT:    kmovw %k0, {{[0-9]+}}(%rsp) ## 2-byte Spill
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    callq _f
; CHECK-NEXT:    kmovw {{[0-9]+}}(%rsp), %k0 ## 2-byte Reload
; CHECK-NEXT:    kmovw {{[0-9]+}}(%rsp), %k1 ## 2-byte Reload
; CHECK-NEXT:    korb %k1, %k0, %k0
; CHECK-NEXT:    vpmovm2w %k0, %xmm0
; CHECK-NEXT:    popq %rax
; CHECK-NEXT:    retq

  %cmp_res = icmp ugt <8 x i32> %a, %b
  %cmp_res2 = icmp sgt <8 x i32> %a, %b
  call void @f()
  %res = or <8 x i1> %cmp_res, %cmp_res2
  ret <8 x i1> %res
}

define <16 x i1> @test_16i1(<16 x i32> %a, <16 x i32> %b) {
; CHECK-LABEL: test_16i1:
; CHECK:       ## BB#0:
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:  Lcfi2:
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    vpcmpnleud %zmm1, %zmm0, %k0
; CHECK-NEXT:    kmovw %k0, {{[0-9]+}}(%rsp) ## 2-byte Spill
; CHECK-NEXT:    vpcmpgtd %zmm1, %zmm0, %k0
; CHECK-NEXT:    kmovw %k0, {{[0-9]+}}(%rsp) ## 2-byte Spill
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    callq _f
; CHECK-NEXT:    kmovw {{[0-9]+}}(%rsp), %k0 ## 2-byte Reload
; CHECK-NEXT:    kmovw {{[0-9]+}}(%rsp), %k1 ## 2-byte Reload
; CHECK-NEXT:    korw %k1, %k0, %k0
; CHECK-NEXT:    vpmovm2b %k0, %xmm0
; CHECK-NEXT:    popq %rax
; CHECK-NEXT:    retq
  %cmp_res = icmp ugt <16 x i32> %a, %b
  %cmp_res2 = icmp sgt <16 x i32> %a, %b
  call void @f()
  %res = or <16 x i1> %cmp_res, %cmp_res2
  ret <16 x i1> %res
}

define <32 x i1> @test_32i1(<32 x i16> %a, <32 x i16> %b) {
; CHECK-LABEL: test_32i1:
; CHECK:       ## BB#0:
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:  Lcfi3:
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    vpcmpnleuw %zmm1, %zmm0, %k0
; CHECK-NEXT:    kmovd %k0, {{[0-9]+}}(%rsp) ## 4-byte Spill
; CHECK-NEXT:    vpcmpgtw %zmm1, %zmm0, %k0
; CHECK-NEXT:    kmovd %k0, (%rsp) ## 4-byte Spill
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    callq _f
; CHECK-NEXT:    kmovd {{[0-9]+}}(%rsp), %k0 ## 4-byte Reload
; CHECK-NEXT:    kmovd (%rsp), %k1 ## 4-byte Reload
; CHECK-NEXT:    kord %k1, %k0, %k0
; CHECK-NEXT:    vpmovm2b %k0, %ymm0
; CHECK-NEXT:    popq %rax
; CHECK-NEXT:    retq
  %cmp_res = icmp ugt <32 x i16> %a, %b
  %cmp_res2 = icmp sgt <32 x i16> %a, %b
  call void @f()
  %res = or <32 x i1> %cmp_res, %cmp_res2
  ret <32 x i1> %res
}

define <64 x i1> @test_64i1(<64 x i8> %a, <64 x i8> %b) {
; CHECK-LABEL: test_64i1:
; CHECK:       ## BB#0:
; CHECK-NEXT:    subq $24, %rsp
; CHECK-NEXT:  Lcfi4:
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    vpcmpnleub %zmm1, %zmm0, %k0
; CHECK-NEXT:    kmovq %k0, {{[0-9]+}}(%rsp) ## 8-byte Spill
; CHECK-NEXT:    vpcmpgtb %zmm1, %zmm0, %k0
; CHECK-NEXT:    kmovq %k0, {{[0-9]+}}(%rsp) ## 8-byte Spill
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    callq _f
; CHECK-NEXT:    kmovq {{[0-9]+}}(%rsp), %k0 ## 8-byte Reload
; CHECK-NEXT:    kmovq {{[0-9]+}}(%rsp), %k1 ## 8-byte Reload
; CHECK-NEXT:    korq %k1, %k0, %k0
; CHECK-NEXT:    vpmovm2b %k0, %zmm0
; CHECK-NEXT:    addq $24, %rsp
; CHECK-NEXT:    retq

  %cmp_res = icmp ugt <64 x i8> %a, %b
  %cmp_res2 = icmp sgt <64 x i8> %a, %b
  call void @f()
  %res = or <64 x i1> %cmp_res, %cmp_res2
  ret <64 x i1> %res
}
