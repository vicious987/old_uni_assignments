	.file	"randwalk.c"
	.text
	.p2align 4,,15
	.type	randwalk1, @function
randwalk1:
.LFB28:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	movl	%esi, %r15d
	xorl	%ecx, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	leal	-1(%rsi), %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	shrl	$31, %ebp
	addl	%esi, %ebp
	sarl	%ebp
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%ebp, %ebx
	movl	%edi, 12(%rsp)
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L13:
	xorl	%esi, %esi
	testl	%ebp, %ebp
	setg	%sil
	subl	%esi, %ebp
.L4:
	subl	$1, %r12d
	je	.L11
.L7:
	subl	$2, %ecx
	js	.L12
.L2:
	movl	%ebp, %r8d
	movq	%rax, %r9
	imull	%r15d, %r8d
	shrq	%cl, %r9
	addl	%ebx, %r8d
	movslq	%r8d, %r8
	movzbl	(%r14,%r8), %esi
	addl	%esi, %r13d
	andl	$3, %r9d
	je	.L13
	cmpl	$1, %r9d
	je	.L14
	cmpl	$2, %r9d
	je	.L15
	xorl	%esi, %esi
	cmpl	%ebx, 12(%rsp)
	setg	%sil
	addl	%esi, %ebx
	subl	$1, %r12d
	jne	.L7
.L11:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	xorl	%eax, %eax
	call	fast_random
	movl	$62, %ecx
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%esi, %esi
	cmpl	%ebp, 12(%rsp)
	setg	%sil
	addl	%esi, %ebp
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L15:
	xorl	%esi, %esi
	testl	%ebx, %ebx
	setg	%sil
	subl	%esi, %ebx
	jmp	.L4
	.cfi_endproc
.LFE28:
	.size	randwalk1, .-randwalk1
	.p2align 4,,15
	.type	test_randwalk1, @function
test_randwalk1:
.LFB30:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	testl	%ecx, %ecx
	jle	.L19
	movl	%ecx, %r12d
	movl	%edx, %r15d
	movl	%esi, %r14d
	movq	%rdi, %r13
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%r15d, %edx
	movl	%r14d, %esi
	movq	%r13, %rdi
	addl	$1, %ebx
	call	randwalk1
	addl	%eax, %ebp
	cmpl	%ebx, %r12d
	jne	.L18
.L16:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	xorl	%ebp, %ebp
	jmp	.L16
	.cfi_endproc
.LFE30:
	.size	test_randwalk1, .-test_randwalk1
	.p2align 4,,15
	.type	randwalk2, @function
randwalk2:
.LFB29:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	movl	%esi, %r15d
	xorl	%ecx, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	leal	-1(%rsi), %edx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	shrl	$31, %ebx
	addl	%esi, %ebx
	sarl	%ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%ebx, %ebp
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%ebx, %r9d
	movl	%ebx, %edi
	movq	%rax, %r8
	imull	%r15d, %r9d
	shrq	%cl, %r8
	notl	%edi
	andl	$3, %r8d
	addl	%ebp, %r9d
	movslq	%r9d, %r9
	movzbl	(%r14,%r9), %esi
	addl	%esi, %r13d
	movl	%ebx, %esi
	sarl	$31, %esi
	orl	%edi, %esi
	movl	%r8d, %edi
	orl	%r8d, %esi
	sete	%sil
	xorl	$1, %edi
	movzbl	%sil, %esi
	subl	%esi, %ebx
	xorl	%esi, %esi
	cmpl	%edx, %ebx
	setge	%sil
	orl	%esi, %edi
	movl	%ebp, %edi
	sete	%sil
	notl	%edi
	xorl	$2, %r8d
	movzbl	%sil, %esi
	addl	%esi, %ebx
	movl	%ebp, %esi
	sarl	$31, %esi
	orl	%edi, %esi
	orl	%r8d, %esi
	sete	%sil
	movzbl	%sil, %esi
	subl	%esi, %ebp
	xorl	%esi, %esi
	cmpl	%edx, %ebp
	setl	%sil
	addl	%esi, %ebp
	subl	$1, %r12d
	je	.L27
.L24:
	subl	$2, %ecx
	jns	.L23
	xorl	%eax, %eax
	movl	%edx, 12(%rsp)
	call	fast_random
	movl	$62, %ecx
	movl	12(%rsp), %edx
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L27:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE29:
	.size	randwalk2, .-randwalk2
	.p2align 4,,15
	.type	test_randwalk2, @function
test_randwalk2:
.LFB31:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	testl	%ecx, %ecx
	jle	.L31
	movl	%ecx, %r12d
	movl	%edx, %r15d
	movl	%esi, %r14d
	movq	%rdi, %r13
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L30:
	movl	%r15d, %edx
	movl	%r14d, %esi
	movq	%r13, %rdi
	addl	$1, %ebx
	call	randwalk2
	addl	%eax, %ebp
	cmpl	%ebx, %r12d
	jne	.L30
.L28:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L31:
	.cfi_restore_state
	xorl	%ebp, %ebp
	jmp	.L28
	.cfi_endproc
.LFE31:
	.size	test_randwalk2, .-test_randwalk2
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"n:s:t:v:S:"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Usage: %s -S hex_seed-n log2(size) -s log2(steps) -t log2(times) -v variant\n"
	.section	.rodata.str1.1
.LC2:
	.string	"/dev/urandom"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB32:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r15d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	$-1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r13d, %r14d
	movl	%r13d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movb	$0, 15(%rsp)
	movl	%r13d, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L35:
	movl	$.LC0, %edx
	movq	%rbx, %rsi
	movl	%ebp, %edi
	call	getopt
	cmpl	$-1, %eax
	je	.L55
	cmpl	$110, %eax
	je	.L56
	cmpl	$115, %eax
	je	.L57
	cmpl	$116, %eax
	je	.L58
	cmpl	$118, %eax
	je	.L59
	cmpl	$83, %eax
	je	.L60
	movl	$1, %r15d
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L56:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$1, %r12d
	call	strtol
	movl	%eax, %ecx
	sall	%cl, %r12d
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L57:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$1, %r14d
	call	strtol
	movl	%eax, %ecx
	sall	%cl, %r14d
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L58:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, 8(%rsp)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L55:
	testl	%r12d, %r12d
	js	.L42
	testb	%r15b, %r15b
	jne	.L42
	testl	%r14d, %r14d
	js	.L42
	movl	8(%rsp), %eax
	testl	%eax, %eax
	js	.L42
	cmpl	$1, %r13d
	ja	.L42
	cmpb	$0, 15(%rsp)
	je	.L61
.L44:
	movl	%r12d, %ebx
	movq	24(%rsp), %rdi
	imull	%r12d, %ebx
	call	fast_srandom
	movslq	%ebx, %rdi
	call	malloc_page_aligned
	movq	%rax, %rbp
	testl	%ebx, %ebx
	je	.L45
	movq	%rax, %r15
	leal	-1(%rbx), %eax
	leaq	1(%rbp,%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L46:
	xorl	%eax, %eax
	addq	$1, %r15
	call	fast_random
	movb	%al, -1(%r15)
	cmpq	%rbx, %r15
	jne	.L46
.L45:
	xorl	%eax, %eax
	call	flush_cache
	leaq	32(%rsp), %rdi
	call	timer_reset
	leaq	32(%rsp), %rdi
	call	timer_start
	movl	8(%rsp), %ecx
	movl	%r14d, %edx
	movl	%r12d, %esi
	movq	%rbp, %rdi
	testl	%r13d, %r13d
	je	.L62
	call	test_randwalk2
.L48:
	leaq	32(%rsp), %rdi
	call	timer_stop
	leaq	32(%rsp), %rdi
	call	timer_myprint
	movq	%rbp, %rdi
	call	free
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	.cfi_restore_state
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %r13d
	jmp	.L35
.L60:
	movq	optarg(%rip), %rdi
	movl	$16, %edx
	xorl	%esi, %esi
	call	strtoul
	movb	$1, 15(%rsp)
	movq	%rax, 24(%rsp)
	jmp	.L35
.L61:
	movl	$8, %edx
	leaq	24(%rsp), %rsi
	movl	$.LC2, %edi
	call	read_bytes
	jmp	.L44
.L62:
	call	test_randwalk1
	jmp	.L48
.L42:
	movq	stderr(%rip), %rdi
	movq	(%rbx), %rdx
	movl	$.LC1, %esi
	xorl	%eax, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE32:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.1 20190223 (Red Hat 8.3.1-2)"
	.section	.note.GNU-stack,"",@progbits
