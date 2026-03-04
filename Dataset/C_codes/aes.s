	.file	"aes.c"
	.text
	.globl	_aes_encrypt_block
	.def	_aes_encrypt_block;	.scl	2;	.type	32;	.endef
_aes_encrypt_block:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 3, -12
	movl	$0, -8(%ebp)
	jmp	L2
L3:
	movl	-8(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	-8(%ebp), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %ebx
	movl	-8(%ebp), %ecx
	movl	12(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	xorl	%ebx, %edx
	movb	%dl, (%eax)
	addl	$1, -8(%ebp)
L2:
	cmpl	$15, -8(%ebp)
	jle	L3
	nop
	addl	$16, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
