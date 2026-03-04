	.file	"boyermoore.c"
	.text
	.globl	_max
	.def	_max;	.scl	2;	.type	32;	.endef
_max:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%edx, %eax
	jge	L3
	movl	%edx, %eax
L3:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.globl	_badCharHeuristic
	.def	_badCharHeuristic;	.scl	2;	.type	32;	.endef
_badCharHeuristic:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L5
L6:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	$-1, (%eax)
	addl	$1, -4(%ebp)
L5:
	cmpl	$255, -4(%ebp)
	jle	L6
	movl	$0, -8(%ebp)
	jmp	L7
L8:
	movl	-8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	%eax, (%edx)
	addl	$1, -8(%ebp)
L7:
	movl	-8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L8
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.section .rdata,"dr"
LC0:
	.ascii "Pattern found at %d\12\0"
	.text
	.globl	_searchBM
	.def	_searchBM;	.scl	2;	.type	32;	.endef
_searchBM:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$1064, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -24(%ebp)
	leal	-1048(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_badCharHeuristic
	movl	$0, -12(%ebp)
	jmp	L10
L17:
	movl	-20(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	L11
L13:
	subl	$1, -16(%ebp)
L11:
	cmpl	$0, -16(%ebp)
	js	L12
	movl	-16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-12(%ebp), %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	je	L13
L12:
	cmpl	$0, -16(%ebp)
	jns	L14
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	cmpl	-24(%ebp), %eax
	jge	L15
	movl	-12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	-1048(%ebp,%eax,4), %eax
	movl	-20(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	jmp	L16
L15:
	movl	$1, %eax
L16:
	addl	%eax, -12(%ebp)
	jmp	L10
L14:
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	-1048(%ebp,%eax,4), %eax
	movl	-16(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	_max
	addl	%eax, -12(%ebp)
L10:
	movl	-24(%ebp), %eax
	subl	-20(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jge	L17
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
