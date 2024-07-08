	.file	"main.c"
	.text
	.globl	test_c_add
	.type	test_c_add, @function
test_c_add:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	%edx, -60(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L2
.L3:
	movl	-56(%rbp), %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -36(%rbp)
	addq	$1, -32(%rbp)
.L2:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	jl	.L3
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	test_c_add, .-test_c_add
	.globl	test_asm_add
	.type	test_asm_add, @function
test_asm_add:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movl	%edi, -68(%rbp)
	movl	%esi, -72(%rbp)
	movl	%edx, -76(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movq	$0, -48(%rbp)
	jmp	.L6
.L7:
	movl	-72(%rbp), %eax
	movl	-76(%rbp), %edx
	movl	%edx, %ebx
#APP
# 38 "main.c" 1
	addl %ebx, %eax;
# 0 "" 2
#NO_APP
	movl	%eax, -52(%rbp)
	addq	$1, -48(%rbp)
.L6:
	movl	-68(%rbp), %eax
	cltq
	cmpq	%rax, -48(%rbp)
	jl	.L7
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	test_asm_add, .-test_asm_add
	.globl	test_c_sub
	.type	test_c_sub, @function
test_c_sub:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	%edx, -60(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L10
.L11:
	movl	-56(%rbp), %eax
	subl	-60(%rbp), %eax
	movl	%eax, -36(%rbp)
	addq	$1, -32(%rbp)
.L10:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	jl	.L11
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	test_c_sub, .-test_c_sub
	.globl	test_asm_sub
	.type	test_asm_sub, @function
test_asm_sub:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movl	%edi, -68(%rbp)
	movl	%esi, -72(%rbp)
	movl	%edx, -76(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movq	$0, -48(%rbp)
	jmp	.L14
.L15:
	movl	-72(%rbp), %eax
	movl	-76(%rbp), %edx
	movl	%edx, %ebx
#APP
# 77 "main.c" 1
	subl %ebx, %eax;
# 0 "" 2
#NO_APP
	movl	%eax, -52(%rbp)
	addq	$1, -48(%rbp)
.L14:
	movl	-68(%rbp), %eax
	cltq
	cmpq	%rax, -48(%rbp)
	jl	.L15
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	test_asm_sub, .-test_asm_sub
	.globl	test_asm_mul
	.type	test_asm_mul, @function
test_asm_mul:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movl	%esi, -76(%rbp)
	movl	%edx, -80(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movq	$0, -48(%rbp)
	jmp	.L18
.L19:
	movl	-76(%rbp), %eax
	movl	-80(%rbp), %edx
	movl	%edx, %ebx
#APP
# 94 "main.c" 1
	imull %ebx, %eax;
# 0 "" 2
#NO_APP
	movl	%eax, -52(%rbp)
	addq	$1, -48(%rbp)
.L18:
	movq	-48(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jl	.L19
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	test_asm_mul, .-test_asm_mul
	.globl	test_c_div
	.type	test_c_div, @function
test_c_div:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L22
.L23:
	movl	-60(%rbp), %eax
	cltd
	idivl	-64(%rbp)
	movl	%eax, -36(%rbp)
	addq	$1, -32(%rbp)
.L22:
	movq	-32(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jl	.L23
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	test_c_div, .-test_c_div
	.globl	test_asm_div
	.type	test_asm_div, @function
test_asm_div:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movl	%esi, -76(%rbp)
	movl	%edx, -80(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movq	$0, -48(%rbp)
	jmp	.L26
.L27:
	movl	-76(%rbp), %eax
	movl	-80(%rbp), %edx
	movl	%edx, %ebx
#APP
# 127 "main.c" 1
	xor %edx, %edx;idivl %ebx;
# 0 "" 2
#NO_APP
	movl	%eax, -52(%rbp)
	addq	$1, -48(%rbp)
.L26:
	movq	-48(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jl	.L27
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	test_asm_div, .-test_asm_div
	.globl	test_c_mul
	.type	test_c_mul, @function
test_c_mul:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L30
.L31:
	movl	-60(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, -36(%rbp)
	addq	$1, -32(%rbp)
.L30:
	movq	-32(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jl	.L31
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	test_c_mul, .-test_c_mul
	.globl	test_c_float_add
	.type	test_c_float_add, @function
test_c_float_add:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movss	%xmm1, -60(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L34
.L35:
	movss	-56(%rbp), %xmm0
	addss	-60(%rbp), %xmm0
	movss	%xmm0, -36(%rbp)
	addq	$1, -32(%rbp)
.L34:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	jl	.L35
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	test_c_float_add, .-test_c_float_add
	.globl	test_asm_float_add
	.type	test_asm_float_add, @function
test_asm_float_add:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movss	%xmm1, -60(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L38
.L39:
#APP
# 181 "main.c" 1
	fld -56(%rbp);fadd -60(%rbp);fstp -44(%rbp);
# 0 "" 2
#NO_APP
	addq	$1, -40(%rbp)
.L38:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -40(%rbp)
	jl	.L39
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	test_asm_float_add, .-test_asm_float_add
	.globl	test_c_float_mul
	.type	test_c_float_mul, @function
test_c_float_mul:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movss	%xmm1, -60(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L43
.L44:
	movss	-56(%rbp), %xmm0
	mulss	-60(%rbp), %xmm0
	movss	%xmm0, -36(%rbp)
	addq	$1, -32(%rbp)
.L43:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	jl	.L44
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	test_c_float_mul, .-test_c_float_mul
	.globl	test_asm_float_mul
	.type	test_asm_float_mul, @function
test_asm_float_mul:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movss	%xmm1, -60(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L47
.L48:
#APP
# 221 "main.c" 1
	fld -56(%rbp);fmul -60(%rbp);fstp -44(%rbp);
# 0 "" 2
#NO_APP
	addq	$1, -40(%rbp)
.L47:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -40(%rbp)
	jl	.L48
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L50
	call	__stack_chk_fail@PLT
.L50:
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	test_asm_float_mul, .-test_asm_float_mul
	.globl	test_c_float_div
	.type	test_c_float_div, @function
test_c_float_div:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movss	%xmm1, -60(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L52
.L53:
	movss	-56(%rbp), %xmm0
	divss	-60(%rbp), %xmm0
	movss	%xmm0, -36(%rbp)
	addq	$1, -32(%rbp)
.L52:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	jl	.L53
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	test_c_float_div, .-test_c_float_div
	.globl	test_asm_float_div
	.type	test_asm_float_div, @function
test_asm_float_div:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movss	%xmm1, -60(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L56
.L57:
#APP
# 261 "main.c" 1
	fld -56(%rbp);fdiv -60(%rbp);fstp -44(%rbp);
# 0 "" 2
#NO_APP
	addq	$1, -40(%rbp)
.L56:
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, -40(%rbp)
	jl	.L57
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L59
	call	__stack_chk_fail@PLT
.L59:
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	test_asm_float_div, .-test_asm_float_div
	.section	.rodata
.LC3:
	.string	"\n\n INT MUL TIME "
.LC5:
	.string	"c: %.6f ms\n"
.LC6:
	.string	"int sub asm + c: %.6f ms\n\n"
.LC7:
	.string	"\n\n INT div TIME "
	.text
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	$1000000, -48(%rbp)
	jmp	.L61
.L64:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L62
.L63:
	call	rand@PLT
	movl	%eax, -56(%rbp)
	call	rand@PLT
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %edx
	movl	-56(%rbp), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	test_asm_mul
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	-52(%rbp), %edx
	movl	-56(%rbp), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	test_c_mul
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	addl	$1, -72(%rbp)
.L62:
	cmpl	$99, -72(%rbp)
	jle	.L63
	movsd	-40(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-48(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, -48(%rbp)
.L61:
	movabsq	$9999999999, %rax
	cmpq	%rax, -48(%rbp)
	jle	.L64
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	$1000000, -24(%rbp)
	jmp	.L65
.L68:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -68(%rbp)
	jmp	.L66
.L67:
	call	rand@PLT
	movl	%eax, -64(%rbp)
	call	rand@PLT
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	test_asm_div
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	test_c_div
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -68(%rbp)
.L66:
	cmpl	$99, -68(%rbp)
	jle	.L67
	movsd	-16(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-8(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, -24(%rbp)
.L65:
	movabsq	$9999999999, %rax
	cmpq	%rax, -24(%rbp)
	jle	.L68
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	-755914244
	.long	1062232653
	.align 8
.LC4:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
