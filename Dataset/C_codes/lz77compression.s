	.file	"lz77compression.c"
	.text
	.globl	_lz77_compress
	.def	_lz77_compress;	.scl	2;	.type	32;	.endef
_lz77_compress:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -36(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L2
L9:
	movl	$0, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	$1, -28(%ebp)
	jmp	L3
L8:
	movl	$0, -32(%ebp)
	jmp	L4
L6:
	addl	$1, -32(%ebp)
L4:
	movl	-12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	cmpl	-36(%ebp), %eax
	jge	L5
	movl	-12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-12(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	%eax, %ecx
	movl	-32(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	je	L6
L5:
	movl	-32(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jle	L7
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, -24(%ebp)
L7:
	addl	$1, -28(%ebp)
L3:
	movl	-28(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jle	L8
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%eax, (%edx)
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%eax, 4(%edx)
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movb	%al, 8(%edx)
	movl	-20(%ebp), %eax
	addl	$1, %eax
	addl	%eax, -12(%ebp)
	addl	$1, -16(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jl	L9
	movl	16(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strlen;	.scl	2;	.type	32;	.endef
