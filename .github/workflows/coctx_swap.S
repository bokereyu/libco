/*
* Tencent is pleased to support the open source community by making Libco available.

* Copyright (C) 2014 THL A29 Limited, a Tencent company. All rights reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License"); 
* you may not use this file except in compliance with the License. 
* You may obtain a copy of the License at
*
*	http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, 
* software distributed under the License is distributed on an "AS IS" BASIS, 
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
* See the License for the specific language governing permissions and 
* limitations under the License.
*/

.globl coctx_swap
#if !defined( __APPLE__ )
.type  coctx_swap, @function
#endif
coctx_swap:

#if defined(__i386__)
    movl 4(%esp), %eax
    movl %esp,  28(%eax)
    movl %ebp, 24(%eax)
    movl %esi, 20(%eax)
    movl %edi, 16(%eax)
    movl %edx, 12(%eax)
    movl %ecx, 8(%eax)
    movl %ebx, 4(%eax)


    movl 8(%esp), %eax
    movl 4(%eax), %ebx
    movl 8(%eax), %ecx
    movl 12(%eax), %edx
    movl 16(%eax), %edi
    movl 20(%eax), %esi
    movl 24(%eax), %ebp
    movl 28(%eax), %esp

	ret

#elif defined(__x86_64__)
	leaq (%rsp),%rax
    movq %rax, 104(%rdi)
    movq %rbx, 96(%rdi)
    movq %rcx, 88(%rdi)
    movq %rdx, 80(%rdi)
	  movq 0(%rax), %rax
	  movq %rax, 72(%rdi) 
    movq %rsi, 64(%rdi)
	  movq %rdi, 56(%rdi)
    movq %rbp, 48(%rdi)
    movq %r8, 40(%rdi)
    movq %r9, 32(%rdi)
    movq %r12, 24(%rdi)
    movq %r13, 16(%rdi)
    movq %r14, 8(%rdi)
    movq %r15, (%rdi)
	  xorq %rax, %rax

    movq 48(%rsi), %rbp
    movq 104(%rsi), %rsp
    movq (%rsi), %r15
    movq 8(%rsi), %r14
    movq 16(%rsi), %r13
    movq 24(%rsi), %r12
    movq 32(%rsi), %r9
    movq 40(%rsi), %r8
    movq 56(%rsi), %rdi
    movq 80(%rsi), %rdx
    movq 88(%rsi), %rcx
    movq 96(%rsi), %rbx
		leaq 8(%rsp), %rsp
		pushq 72(%rsi)

    movq 64(%rsi), %rsi
	ret

#elif defined(__aarch64__)
  
    str   x0, [x0, 0]
    str   x1, [x0, 8]
    str   x2, [x0, 16]
    str   x3, [x0, 24]
    str   x4, [x0, 32]
    str   x5, [x0, 40]
    str   x6, [x0, 48]
    str   x7, [x0, 56]
    str   x8, [x0, 64]
    str   x9, [x0, 72]
    str   x10, [x0, 80]
    str   x11, [x0, 88]
    str   x12, [x0, 96]
    str   x13, [x0, 104]
    str   x14, [x0, 112]
    str   x15, [x0, 120]
    str   x16, [x0, 128]
    str   x17, [x0, 136]
    str   x18, [x0, 144]
    str   x19, [x0, 152]
    str   x20, [x0, 160]
    str   x21, [x0, 168]
    str   x22, [x0, 176]
    str   x23, [x0, 184]
    str   x24, [x0, 192]
    str   x25, [x0, 200]
    str   x26, [x0, 208]
    str   x27, [x0, 216]
    str   x28, [x0, 224]
    str   x29, [x0, 232]
    str   x30, [x0, 240]
    sub   x3, sp, 0
    str   x3,[x0,248]


    ldr   x0, [x1, 0]
    ldr   x2, [x1, 16]
    ldr   x3, [x1, 24]
    ldr   x4, [x1, 32]
    ldr   x5, [x1, 40]
    ldr   x6, [x1, 48]
    ldr   x7, [x1, 56]
    ldr   x8, [x1, 64]
    ldr   x9, [x1, 72]
    ldr   x10, [x1, 80]
    ldr   x11, [x1, 88]
    ldr   x12, [x1, 96]
    ldr   x13, [x1, 104]
    ldr   x14, [x1, 112]
    ldr   x15, [x1, 120]
    ldr   x16, [x1, 128]
    ldr   x17, [x1, 136]
    ldr   x18, [x1, 144]
    ldr   x19, [x1, 152]
    ldr   x20, [x1, 160]
    ldr   x21, [x1, 168]
    ldr   x22, [x1, 176]
    ldr   x23, [x1, 184]
    ldr   x24, [x1, 192]
    ldr   x25, [x1, 200]
    ldr   x26, [x1, 208]
    ldr   x27, [x1, 216]
    ldr   x28, [x1, 224]
    ldr   x29, [x1, 232]
    ldr   x30, [x1, 240]
    
    ldr   x3,[x1,248]
    sub   sp, x3, 0
    ldr   x3, [x1, 24]
    ldr   x1, [x1, 8]
    ret

#endif
