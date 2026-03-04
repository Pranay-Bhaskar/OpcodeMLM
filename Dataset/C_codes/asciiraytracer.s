	.file	"asciiraytracer.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	movl	$0, 60(%esp)
	jmp	L2
L20:
	movl	$0, 56(%esp)
	jmp	L3
L19:
	fildl	56(%esp)
	fldl	LC0
	fsubrp	%st, %st(1)
	fldl	LC0
	fdivrp	%st, %st(1)
	fstpl	48(%esp)
	fildl	60(%esp)
	fldl	LC1
	fsubrp	%st, %st(1)
	fldl	LC1
	fdivrp	%st, %st(1)
	fstpl	40(%esp)
	fldl	48(%esp)
	fmull	48(%esp)
	fldl	40(%esp)
	fmull	40(%esp)
	faddp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fstpl	32(%esp)
	fldl	LC2
	fldl	32(%esp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L27
	fldl	32(%esp)
	fldl	LC2
	fdivrp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	fstpl	24(%esp)
	fldl	24(%esp)
	fldl	LC4
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L28
	movl	$64, %eax
	jmp	L8
L28:
	fldl	24(%esp)
	fldl	LC5
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L29
	movl	$35, %eax
	jmp	L8
L29:
	fldl	24(%esp)
	fldl	LC6
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L30
	movl	$42, %eax
	jmp	L8
L30:
	fldl	24(%esp)
	fldl	LC7
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L31
	movl	$58, %eax
	jmp	L8
L31:
	movl	$46, %eax
L8:
	movb	%al, 23(%esp)
	movsbl	23(%esp), %eax
	movl	%eax, (%esp)
	call	_putchar
	jmp	L18
L27:
	movl	$32, (%esp)
	call	_putchar
L18:
	addl	$1, 56(%esp)
L3:
	cmpl	$79, 56(%esp)
	jle	L19
	movl	$10, (%esp)
	call	_putchar
	addl	$1, 60(%esp)
L2:
	cmpl	$39, 60(%esp)
	jle	L20
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
	.align 8
LC0:
	.long	0
	.long	1078198272
	.align 8
LC1:
	.long	0
	.long	1077149696
	.align 8
LC2:
	.long	1717986918
	.long	1072064102
	.align 8
LC4:
	.long	-1717986918
	.long	1072273817
	.align 8
LC5:
	.long	858993459
	.long	1071854387
	.align 8
LC6:
	.long	-1717986918
	.long	1071225241
	.align 8
LC7:
	.long	-1717986918
	.long	1070176665
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_sqrt;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
