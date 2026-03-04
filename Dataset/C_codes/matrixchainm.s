	.file	"matrixchainm.c"
	.section .rdata,"dr"
LC0:
	.ascii "A%d\0"
	.text
	.globl	_printOptimalParens
	.def	_printOptimalParens;	.scl	2;	.type	32;	.endef
_printOptimalParens:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jne	L2
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	jmp	L4
L2:
	movl	$40, (%esp)
	call	_putchar
	movl	12(%ebp), %eax
	imull	$200, %eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_printOptimalParens
	movl	12(%ebp), %eax
	imull	$200, %eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_printOptimalParens
	movl	$41, (%esp)
	call	_putchar
L4:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "\12Minimum number of multiplications: %d\12\0"
LC2:
	.ascii "Optimal Parenthesization: \0"
LC3:
	.ascii "\12Cost Table (m):\0"
LC4:
	.ascii "    \0"
LC5:
	.ascii "%4d \0"
LC6:
	.ascii "\12Split Table (s):\0"
	.text
	.globl	_matrixChainOrder
	.def	_matrixChainOrder;	.scl	2;	.type	32;	.endef
_matrixChainOrder:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	movl	$20068, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 3, -12
	movl	$1, -12(%ebp)
	jmp	L6
L7:
	movl	-12(%ebp), %eax
	imull	$204, %eax, %eax
	leal	-8(%ebp), %ecx
	addl	%ecx, %eax
	subl	$10040, %eax
	movl	$0, (%eax)
	addl	$1, -12(%ebp)
L6:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L7
	movl	$2, -16(%ebp)
	jmp	L8
L14:
	movl	$1, -20(%ebp)
	jmp	L9
L13:
	movl	-20(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -44(%ebp)
	movl	-20(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movl	$2147483647, -10048(%ebp,%eax,4)
	movl	-20(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	L10
L12:
	movl	-20(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	-10048(%ebp,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	$1, %eax
	imull	$50, %eax, %ecx
	movl	-44(%ebp), %eax
	addl	%ecx, %eax
	movl	-10048(%ebp,%eax,4), %eax
	leal	(%edx,%eax), %ecx
	movl	-20(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %ebx
	movl	8(%ebp), %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	imull	%eax, %edx
	movl	-44(%ebp), %eax
	leal	0(,%eax,4), %ebx
	movl	8(%ebp), %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	imull	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, -48(%ebp)
	movl	-20(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movl	-10048(%ebp,%eax,4), %eax
	cmpl	-48(%ebp), %eax
	jle	L11
	movl	-20(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	-48(%ebp), %eax
	movl	%eax, -10048(%ebp,%edx,4)
	movl	-20(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%eax, -20048(%ebp,%edx,4)
L11:
	addl	$1, -24(%ebp)
L10:
	movl	-44(%ebp), %eax
	subl	$1, %eax
	cmpl	-24(%ebp), %eax
	jge	L12
	addl	$1, -20(%ebp)
L9:
	movl	12(%ebp), %eax
	subl	-16(%ebp), %eax
	addl	$1, %eax
	cmpl	-20(%ebp), %eax
	jg	L13
	addl	$1, -16(%ebp)
L8:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L14
	movl	12(%ebp), %eax
	subl	$1, %eax
	addl	$50, %eax
	movl	-10048(%ebp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$LC2, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	leal	-20048(%ebp), %eax
	movl	%eax, (%esp)
	call	_printOptimalParens
	movl	$10, (%esp)
	call	_putchar
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, -28(%ebp)
	jmp	L15
L20:
	movl	$1, -32(%ebp)
	jmp	L16
L19:
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jle	L17
	movl	$LC4, (%esp)
	call	_printf
	jmp	L18
L17:
	movl	-28(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	-10048(%ebp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
L18:
	addl	$1, -32(%ebp)
L16:
	movl	-32(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L19
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -28(%ebp)
L15:
	movl	-28(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L20
	movl	$LC6, (%esp)
	call	_puts
	movl	$1, -36(%ebp)
	jmp	L21
L26:
	movl	$1, -40(%ebp)
	jmp	L22
L25:
	movl	-36(%ebp), %eax
	cmpl	-40(%ebp), %eax
	jle	L23
	movl	$LC4, (%esp)
	call	_printf
	jmp	L24
L23:
	movl	-36(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movl	-20048(%ebp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
L24:
	addl	$1, -40(%ebp)
L22:
	movl	-40(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L25
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -36(%ebp)
L21:
	movl	-36(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L26
	nop
	addl	$20068, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "\12--- Matrix Chain Multiplication Toolkit ---\0"
LC8:
	.ascii "1. Solve Matrix Chain Order\0"
LC9:
	.ascii "0. Exit\0"
LC10:
	.ascii "Choice: \0"
LC11:
	.ascii "%d\0"
LC12:
	.ascii "Enter number of matrices: \0"
	.align 4
LC13:
	.ascii "Enter dimensions array (length %d):\12\0"
LC14:
	.ascii "Exiting...\0"
LC15:
	.ascii "Invalid choice!\0"
	.text
	.globl	_menu
	.def	_menu;	.scl	2;	.type	32;	.endef
_menu:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$248, %esp
L34:
	movl	$LC7, (%esp)
	call	_puts
	movl	$LC8, (%esp)
	call	_puts
	movl	$LC9, (%esp)
	call	_puts
	movl	$LC10, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	je	L29
	cmpl	$1, %eax
	jne	L35
	movl	$LC12, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L31
L32:
	leal	-220(%ebp), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	addl	$1, -12(%ebp)
L31:
	movl	-20(%ebp), %eax
	cmpl	%eax, -12(%ebp)
	jle	L32
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	leal	-220(%ebp), %eax
	movl	%eax, (%esp)
	call	_matrixChainOrder
	nop
	jmp	L33
L29:
	movl	$LC14, (%esp)
	call	_puts
	jmp	L33
L35:
	movl	$LC15, (%esp)
	call	_puts
L33:
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	jne	L34
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	call	___main
	call	_menu
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
