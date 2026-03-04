	.file	"sudo.c"
	.section .rdata,"dr"
LC0:
	.ascii "%d \0"
	.text
	.globl	_printGrid
	.def	_printGrid;	.scl	2;	.type	32;	.endef
_printGrid:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L5:
	movl	$0, -16(%ebp)
	jmp	L3
L4:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
L3:
	cmpl	$8, -16(%ebp)
	jle	L4
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L2:
	cmpl	$8, -12(%ebp)
	jle	L5
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_isSafe
	.def	_isSafe;	.scl	2;	.type	32;	.endef
_isSafe:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$0, -4(%ebp)
	jmp	L7
L10:
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	cmpl	20(%ebp), %eax
	jne	L8
	movl	$0, %eax
	jmp	L9
L8:
	addl	$1, -4(%ebp)
L7:
	cmpl	$8, -4(%ebp)
	jle	L10
	movl	$0, -8(%ebp)
	jmp	L11
L13:
	movl	-8(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	cmpl	20(%ebp), %eax
	jne	L12
	movl	$0, %eax
	jmp	L9
L12:
	addl	$1, -8(%ebp)
L11:
	cmpl	$8, -8(%ebp)
	jle	L13
	movl	12(%ebp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	12(%ebp), %eax
	subl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	16(%ebp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	16(%ebp), %eax
	subl	%edx, %eax
	movl	%eax, -24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L14
L18:
	movl	$0, -16(%ebp)
	jmp	L15
L17:
	movl	-12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-16(%ebp), %ecx
	movl	-24(%ebp), %edx
	addl	%ecx, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	20(%ebp), %eax
	jne	L16
	movl	$0, %eax
	jmp	L9
L16:
	addl	$1, -16(%ebp)
L15:
	cmpl	$2, -16(%ebp)
	jle	L17
	addl	$1, -12(%ebp)
L14:
	cmpl	$2, -12(%ebp)
	jle	L18
	movl	$1, %eax
L9:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	_solveSudoku
	.def	_solveSudoku;	.scl	2;	.type	32;	.endef
_solveSudoku:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$-1, -12(%ebp)
	movl	$-1, -16(%ebp)
	movb	$0, -17(%ebp)
	movl	$0, -24(%ebp)
	jmp	L20
L26:
	movl	$0, -28(%ebp)
	jmp	L21
L24:
	movl	-24(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	jne	L22
	movl	-24(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, -16(%ebp)
	movb	$1, -17(%ebp)
	jmp	L23
L22:
	addl	$1, -28(%ebp)
L21:
	cmpl	$8, -28(%ebp)
	jle	L24
L23:
	addl	$1, -24(%ebp)
L20:
	cmpl	$8, -24(%ebp)
	jg	L25
	movzbl	-17(%ebp), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	L26
L25:
	movzbl	-17(%ebp), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L27
	movl	$1, %eax
	jmp	L28
L27:
	movl	$1, -32(%ebp)
	jmp	L29
L32:
	movl	-32(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_isSafe
	testb	%al, %al
	je	L30
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-16(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, (%ecx,%eax,4)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_solveSudoku
	testb	%al, %al
	je	L31
	movl	$1, %eax
	jmp	L28
L31:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	$0, (%edx,%eax,4)
L30:
	addl	$1, -32(%ebp)
L29:
	cmpl	$9, -32(%ebp)
	jle	L32
	movl	$0, %eax
L28:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.globl	_validateGrid
	.def	_validateGrid;	.scl	2;	.type	32;	.endef
_validateGrid:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$0, -4(%ebp)
	jmp	L34
L40:
	movl	$0, -8(%ebp)
	jmp	L35
L39:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	je	L36
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	$0, (%edx,%eax,4)
	movl	-12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_isSafe
	xorl	$1, %eax
	testb	%al, %al
	je	L37
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%ecx,%eax,4)
	movl	$0, %eax
	jmp	L38
L37:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%ecx,%eax,4)
L36:
	addl	$1, -8(%ebp)
L35:
	cmpl	$8, -8(%ebp)
	jle	L39
	addl	$1, -4(%ebp)
L34:
	cmpl	$8, -4(%ebp)
	jle	L40
	movl	$1, %eax
L38:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "Enter Sudoku grid (0 for empty cells):\0"
LC2:
	.ascii "%d\0"
LC3:
	.ascii "Initial Grid:\0"
LC4:
	.ascii "Invalid Sudoku grid!\0"
LC5:
	.ascii "Solved Sudoku:\0"
LC6:
	.ascii "No solution exists.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$352, %esp
	call	___main
	movl	$LC1, (%esp)
	call	_puts
	movl	$0, 348(%esp)
	jmp	L42
L45:
	movl	$0, 344(%esp)
	jmp	L43
L44:
	leal	20(%esp), %ecx
	movl	348(%esp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	movl	344(%esp), %edx
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	addl	$1, 344(%esp)
L43:
	cmpl	$8, 344(%esp)
	jle	L44
	addl	$1, 348(%esp)
L42:
	cmpl	$8, 348(%esp)
	jle	L45
	movl	$LC3, (%esp)
	call	_puts
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_printGrid
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_validateGrid
	xorl	$1, %eax
	testb	%al, %al
	je	L46
	movl	$LC4, (%esp)
	call	_puts
	movl	$1, %eax
	jmp	L50
L46:
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_solveSudoku
	testb	%al, %al
	je	L48
	movl	$LC5, (%esp)
	call	_puts
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_printGrid
	jmp	L49
L48:
	movl	$LC6, (%esp)
	call	_puts
L49:
	movl	$0, %eax
L50:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
