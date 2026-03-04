	.file	"crc32.c"
	.text
	.globl	_crc32
	.def	_crc32;	.scl	2;	.type	32;	.endef
_crc32:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$-1, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L2
L5:
	movl	8(%ebp), %edx
	movl	-8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	xorl	%eax, -4(%ebp)
	movl	$0, -12(%ebp)
	jmp	L3
L4:
	movl	-4(%ebp), %eax
	shrl	%eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	andl	$1, %eax
	negl	%eax
	andl	$-306674912, %eax
	xorl	%edx, %eax
	movl	%eax, -4(%ebp)
	addl	$1, -12(%ebp)
L3:
	cmpl	$7, -12(%ebp)
	jle	L4
	addl	$1, -8(%ebp)
L2:
	movl	-8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L5
	movl	-4(%ebp), %eax
	notl	%eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
