	.file	"physicsbasedpong.c"
	.comm	_ballX, 4, 2
	.comm	_ballY, 4, 2
	.comm	_ballDX, 4, 2
	.comm	_ballDY, 4, 2
	.comm	_paddleY, 4, 2
	.text
	.globl	_initGame
	.def	_initGame;	.scl	2;	.type	32;	.endef
_initGame:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$20, _ballX
	movl	$10, _ballY
	movl	$1, _ballDX
	movl	$1, _ballDY
	movl	$10, _paddleY
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
LC0:
	.ascii "clear\0"
	.text
	.globl	_drawGame
	.def	_drawGame;	.scl	2;	.type	32;	.endef
_drawGame:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, (%esp)
	call	_system
	movl	$0, -12(%ebp)
	jmp	L3
L9:
	movl	$0, -16(%ebp)
	jmp	L4
L8:
	movl	_ballX, %eax
	cmpl	%eax, -16(%ebp)
	jne	L5
	movl	_ballY, %eax
	cmpl	%eax, -12(%ebp)
	jne	L5
	movl	$79, (%esp)
	call	_putchar
	jmp	L6
L5:
	cmpl	$39, -16(%ebp)
	jne	L7
	movl	_paddleY, %eax
	subl	$2, %eax
	cmpl	-12(%ebp), %eax
	jg	L7
	movl	_paddleY, %eax
	addl	$2, %eax
	cmpl	-12(%ebp), %eax
	jl	L7
	movl	$124, (%esp)
	call	_putchar
	jmp	L6
L7:
	movl	$32, (%esp)
	call	_putchar
L6:
	addl	$1, -16(%ebp)
L4:
	cmpl	$39, -16(%ebp)
	jle	L8
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L3:
	cmpl	$19, -12(%ebp)
	jle	L9
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_updateGame
	.def	_updateGame;	.scl	2;	.type	32;	.endef
_updateGame:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_ballX, %edx
	movl	_ballDX, %eax
	addl	%edx, %eax
	movl	%eax, _ballX
	movl	_ballY, %edx
	movl	_ballDY, %eax
	addl	%edx, %eax
	movl	%eax, _ballY
	movl	_ballY, %eax
	testl	%eax, %eax
	jle	L11
	movl	_ballY, %eax
	cmpl	$18, %eax
	jle	L12
L11:
	movl	_ballDY, %eax
	negl	%eax
	movl	%eax, _ballDY
L12:
	movl	_ballX, %eax
	testl	%eax, %eax
	jg	L13
	movl	_ballDX, %eax
	negl	%eax
	movl	%eax, _ballDX
L13:
	movl	_ballX, %eax
	cmpl	$38, %eax
	jne	L15
	movl	_paddleY, %eax
	leal	-2(%eax), %edx
	movl	_ballY, %eax
	cmpl	%eax, %edx
	jg	L15
	movl	_paddleY, %eax
	leal	2(%eax), %edx
	movl	_ballY, %eax
	cmpl	%eax, %edx
	jl	L15
	movl	_ballDX, %eax
	negl	%eax
	movl	%eax, _ballDX
L15:
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	call	_initGame
L17:
	call	_drawGame
	call	_updateGame
	movl	$100000, (%esp)
	call	_usleep
	jmp	L17
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_usleep;	.scl	2;	.type	32;	.endef
