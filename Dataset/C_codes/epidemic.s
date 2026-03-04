	.file	"epidemic.c"
	.comm	_population, 1200, 5
	.text
	.globl	_initPopulation
	.def	_initPopulation;	.scl	2;	.type	32;	.endef
_initPopulation:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L3:
	cmpl	$0, -4(%ebp)
	sete	%al
	movzbl	%al, %ecx
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population, %eax
	movl	%ecx, (%eax)
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+4, %eax
	movl	$0, (%eax)
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+8, %eax
	movl	$0, (%eax)
	addl	$1, -4(%ebp)
L2:
	cmpl	$99, -4(%ebp)
	jle	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
LC0:
	.ascii "Day %d:\12\0"
LC1:
	.ascii "Person %d died.\12\0"
LC2:
	.ascii "Person %d recovered.\12\0"
	.align 4
LC3:
	.ascii "Person %d infected person %d.\12\0"
	.text
	.globl	_simulateDay
	.def	_simulateDay;	.scl	2;	.type	32;	.endef
_simulateDay:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L5
L9:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+8, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L6
	call	_rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	cmpl	$4, -16(%ebp)
	jg	L7
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+8, %eax
	movl	$1, (%eax)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population, %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	jmp	L6
L7:
	cmpl	$19, -16(%ebp)
	jg	L8
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+4, %eax
	movl	$1, (%eax)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population, %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	jmp	L6
L8:
	call	_rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L6
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L6
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+8, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L6
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population, %eax
	movl	$1, (%eax)
	movl	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L6:
	addl	$1, -12(%ebp)
L5:
	cmpl	$99, -12(%ebp)
	jle	L9
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.section .rdata,"dr"
	.align 4
LC4:
	.ascii "Summary Day %d: Infected=%d, Recovered=%d, Dead=%d\12\12\0"
	.text
	.globl	_stats
	.def	_stats;	.scl	2;	.type	32;	.endef
_stats:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -24(%ebp)
	jmp	L11
L15:
	movl	-24(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L12
	addl	$1, -12(%ebp)
L12:
	movl	-24(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L13
	addl	$1, -16(%ebp)
L13:
	movl	-24(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_population+8, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L14
	addl	$1, -20(%ebp)
L14:
	addl	$1, -24(%ebp)
L11:
	cmpl	$99, -24(%ebp)
	jle	L15
	movl	-20(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	call	_initPopulation
	movl	$1, 28(%esp)
	jmp	L17
L18:
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_simulateDay
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_stats
	addl	$1, 28(%esp)
L17:
	cmpl	$30, 28(%esp)
	jle	L18
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
