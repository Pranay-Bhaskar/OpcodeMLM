	.file	"base64encoder.c"
	.section .rdata,"dr"
	.align 32
_table:
	.ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\0"
	.text
	.globl	_base64encode
	.def	_base64encode;	.scl	2;	.type	32;	.endef
_base64encode:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L2
L13:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jge	L3
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	jmp	L4
L3:
	movl	$0, %eax
L4:
	movl	%eax, -12(%ebp)
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jge	L5
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	jmp	L6
L5:
	movl	$0, %eax
L6:
	movl	%eax, -16(%ebp)
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jge	L7
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	jmp	L8
L7:
	movl	$0, %eax
L8:
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	sall	$16, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	sall	$8, %eax
	orl	%edx, %eax
	orl	-20(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	-8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -8(%ebp)
	movl	%eax, %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	shrl	$18, %eax
	andl	$63, %eax
	movzbl	_table(%eax), %eax
	movb	%al, (%edx)
	movl	-8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -8(%ebp)
	movl	%eax, %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	shrl	$12, %eax
	andl	$63, %eax
	movzbl	_table(%eax), %eax
	movb	%al, (%edx)
	movl	-8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -8(%ebp)
	movl	%eax, %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	addl	$1, %eax
	cmpl	-4(%ebp), %eax
	jl	L9
	movl	-24(%ebp), %eax
	shrl	$6, %eax
	andl	$63, %eax
	movzbl	_table(%eax), %eax
	jmp	L10
L9:
	movl	$61, %eax
L10:
	movb	%al, (%edx)
	movl	-8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -8(%ebp)
	movl	%eax, %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jg	L11
	movl	-24(%ebp), %eax
	andl	$63, %eax
	movzbl	_table(%eax), %eax
	jmp	L12
L11:
	movl	$61, %eax
L12:
	movb	%al, (%edx)
L2:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L13
	movl	-8(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
