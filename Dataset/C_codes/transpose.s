	.file	"transpose.c"
	.text
	.globl	_transpose
	.def	_transpose;	.scl	2;	.type	32;	.endef
_transpose:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L5:
	movl	$0, -8(%ebp)
	jmp	L3
L4:
	movl	-8(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	(%edx,%eax,4), %edx
	movl	-4(%ebp), %eax
	movl	%edx, (%ecx,%eax,4)
	addl	$1, -8(%ebp)
L3:
	cmpl	$2, -8(%ebp)
	jle	L4
	addl	$1, -4(%ebp)
L2:
	cmpl	$2, -4(%ebp)
	jle	L5
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
LC1:
	.ascii "No inverse\0"
	.text
	.globl	_inverse2x2
	.def	_inverse2x2;	.scl	2;	.type	32;	.endef
_inverse2x2:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	flds	4(%eax)
	fmulp	%st, %st(1)
	movl	8(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	flds	(%eax)
	fmulp	%st, %st(1)
	fsubrp	%st, %st(1)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jp	L7
	flds	-12(%ebp)
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jne	L7
	movl	$LC1, (%esp)
	call	_puts
	jmp	L6
L7:
	movl	8(%ebp), %eax
	addl	$8, %eax
	flds	4(%eax)
	fdivs	-12(%ebp)
	movl	12(%ebp), %eax
	fstps	(%eax)
	movl	8(%ebp), %eax
	flds	4(%eax)
	fchs
	fdivs	-12(%ebp)
	movl	12(%ebp), %eax
	fstps	4(%eax)
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	flds	(%edx)
	fchs
	fdivs	-12(%ebp)
	fstps	(%eax)
	movl	12(%ebp), %eax
	leal	8(%eax), %edx
	movl	8(%ebp), %eax
	flds	(%eax)
	fdivs	-12(%ebp)
	fstps	4(%edx)
L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
