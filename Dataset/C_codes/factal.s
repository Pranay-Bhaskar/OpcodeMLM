	.file	"factal.c"
	.section .rdata,"dr"
LC0:
	.ascii "|\0"
LC1:
	.ascii "+\0"
	.text
	.globl	_drawTree
	.def	_drawTree;	.scl	2;	.type	32;	.endef
_drawTree:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	je	L8
	movl	$0, -12(%ebp)
	jmp	L4
L5:
	movl	$32, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L4:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L5
	movl	$LC0, (%esp)
	call	_puts
	movl	$0, -16(%ebp)
	jmp	L6
L7:
	movl	$32, (%esp)
	call	_putchar
	addl	$1, -16(%ebp)
L6:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L7
	movl	$LC1, (%esp)
	call	_puts
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_drawTree
	movl	12(%ebp), %eax
	leal	2(%eax), %edx
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_drawTree
	jmp	L1
L8:
	nop
L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$5, 28(%esp)
	movl	$0, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_drawTree
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
