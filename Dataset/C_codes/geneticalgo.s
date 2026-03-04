	.file	"geneticalgo.c"
	.comm	_population, 200, 5
	.section .rdata,"dr"
LC0:
	.ascii "HELLO\0"
	.text
	.globl	_fitness
	.def	_fitness;	.scl	2;	.type	32;	.endef
_fitness:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L2
L4:
	movl	-8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-8(%ebp), %eax
	addl	$LC0, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	L3
	addl	$1, -4(%ebp)
L3:
	addl	$1, -8(%ebp)
L2:
	movl	-8(%ebp), %eax
	cmpl	$4, %eax
	jbe	L4
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_mutate
	.def	_mutate;	.scl	2;	.type	32;	.endef
_mutate:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	_rand
	movl	%eax, %ecx
	movl	$-858993459, %edx
	movl	%ecx, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$2, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$26, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$65, %eax
	movb	%al, (%ebx)
	nop
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_crossover
	.def	_crossover;	.scl	2;	.type	32;	.endef
_crossover:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_rand
	movl	%eax, %ecx
	movl	$-858993459, %edx
	movl	%ecx, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$2, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L8
L11:
	movl	-12(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	L9
	movl	-12(%ebp), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	jmp	L10
L9:
	movl	-12(%ebp), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
L10:
	movb	%al, (%edx)
	addl	$1, -12(%ebp)
L8:
	movl	-12(%ebp), %eax
	cmpl	$4, %eax
	jbe	L11
	movl	16(%ebp), %eax
	addl	$5, %eax
	movb	$0, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "Gen %d: %s (fitness=%d)\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$48, %esp
	.cfi_offset 3, -12
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, 44(%esp)
	jmp	L13
L16:
	movl	$0, 40(%esp)
	jmp	L14
L15:
	call	_rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$26, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$65, %eax
	movl	%eax, %ecx
	movl	44(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	40(%esp), %edx
	addl	%edx, %eax
	addl	$_population, %eax
	movb	%cl, (%eax)
	addl	$1, 40(%esp)
L14:
	movl	40(%esp), %eax
	cmpl	$4, %eax
	jbe	L15
	movl	44(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$_population+5, %eax
	movb	$0, (%eax)
	addl	$1, 44(%esp)
L13:
	cmpl	$19, 44(%esp)
	jle	L16
	movl	$0, 36(%esp)
	jmp	L17
L25:
	movl	$0, 32(%esp)
	movl	$1, 28(%esp)
	jmp	L18
L20:
	movl	28(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$_population, %eax
	movl	%eax, (%esp)
	call	_fitness
	movl	%eax, %ebx
	movl	32(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$_population, %eax
	movl	%eax, (%esp)
	call	_fitness
	cmpl	%eax, %ebx
	jle	L19
	movl	28(%esp), %eax
	movl	%eax, 32(%esp)
L19:
	addl	$1, 28(%esp)
L18:
	cmpl	$19, 28(%esp)
	jle	L20
	movl	32(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$_population, %eax
	movl	%eax, (%esp)
	call	_fitness
	movl	%eax, %ecx
	movl	32(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$_population, %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	32(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$_population, %eax
	movl	%eax, (%esp)
	call	_fitness
	cmpl	$5, %eax
	je	L27
	movl	$0, 24(%esp)
	jmp	L23
L24:
	movl	24(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$_population, %eax
	movl	%eax, (%esp)
	call	_mutate
	addl	$1, 24(%esp)
L23:
	cmpl	$19, 24(%esp)
	jle	L24
	addl	$1, 36(%esp)
L17:
	cmpl	$99, 36(%esp)
	jle	L25
	jmp	L22
L27:
	nop
L22:
	movl	$0, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
