	.file	"arith.c"
	.comm	_tokens, 800, 5
	.globl	_pos
	.bss
	.align 4
_pos:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "Unknown char: %c\12\0"
	.text
	.globl	_tokenize
	.def	_tokenize;	.scl	2;	.type	32;	.endef
_tokenize:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L2
L16:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_isspace
	testl	%eax, %eax
	je	L3
	addl	$1, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L4
	movl	$0, -20(%ebp)
	jmp	L5
L6:
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %ecx
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	addl	%ecx, %eax
	movl	%eax, -20(%ebp)
	addl	$1, -12(%ebp)
L5:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$9, %eax
	jbe	L6
	movl	-16(%ebp), %eax
	movl	$0, _tokens(,%eax,8)
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, _tokens+4(,%eax,8)
	addl	$1, -16(%ebp)
	jmp	L2
L4:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$40, %eax
	cmpl	$7, %eax
	ja	L7
	movl	L9(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L9:
	.long	L8
	.long	L10
	.long	L11
	.long	L12
	.long	L7
	.long	L13
	.long	L7
	.long	L14
	.text
L12:
	movl	-16(%ebp), %eax
	movl	$1, _tokens(,%eax,8)
	jmp	L15
L13:
	movl	-16(%ebp), %eax
	movl	$2, _tokens(,%eax,8)
	jmp	L15
L11:
	movl	-16(%ebp), %eax
	movl	$3, _tokens(,%eax,8)
	jmp	L15
L14:
	movl	-16(%ebp), %eax
	movl	$4, _tokens(,%eax,8)
	jmp	L15
L8:
	movl	-16(%ebp), %eax
	movl	$5, _tokens(,%eax,8)
	jmp	L15
L10:
	movl	-16(%ebp), %eax
	movl	$6, _tokens(,%eax,8)
	jmp	L15
L7:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$1, (%esp)
	call	_exit
L15:
	movl	-16(%ebp), %eax
	movl	$0, _tokens+4(,%eax,8)
	addl	$1, -16(%ebp)
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L16
	movl	-16(%ebp), %eax
	movl	$7, _tokens(,%eax,8)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_current
	.def	_current;	.scl	2;	.type	32;	.endef
_current:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_pos, %eax
	movl	_tokens+4(,%eax,8), %edx
	movl	_tokens(,%eax,8), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC1:
	.ascii "Unexpected token\0"
	.text
	.globl	_consume
	.def	_consume;	.scl	2;	.type	32;	.endef
_consume:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_current
	cmpl	8(%ebp), %eax
	jne	L20
	movl	_pos, %eax
	addl	$1, %eax
	movl	%eax, _pos
	jmp	L22
L20:
	movl	$LC1, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L22:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC2:
	.ascii "Unexpected factor\0"
	.text
	.globl	_factor
	.def	_factor;	.scl	2;	.type	32;	.endef
_factor:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_current
	testl	%eax, %eax
	jne	L24
	call	_current
	movl	%edx, -12(%ebp)
	movl	$0, (%esp)
	call	_consume
	movl	-12(%ebp), %eax
	jmp	L25
L24:
	call	_current
	cmpl	$5, %eax
	jne	L26
	movl	$5, (%esp)
	call	_consume
	call	_expr
	movl	%eax, -16(%ebp)
	movl	$6, (%esp)
	call	_consume
	movl	-16(%ebp), %eax
	jmp	L25
L26:
	movl	$LC2, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L25:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC3:
	.ascii "Division by zero!\0"
	.text
	.globl	_term
	.def	_term;	.scl	2;	.type	32;	.endef
_term:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_factor
	movl	%eax, -12(%ebp)
	jmp	L28
L31:
	call	_current
	cmpl	$3, %eax
	jne	L29
	movl	$3, (%esp)
	call	_consume
	call	_factor
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	imull	%edx, %eax
	movl	%eax, -12(%ebp)
	jmp	L28
L29:
	movl	$4, (%esp)
	call	_consume
	call	_factor
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L30
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L30:
	movl	-12(%ebp), %eax
	cltd
	idivl	-16(%ebp)
	movl	%eax, -12(%ebp)
L28:
	call	_current
	cmpl	$3, %eax
	je	L31
	call	_current
	cmpl	$4, %eax
	je	L31
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_expr
	.def	_expr;	.scl	2;	.type	32;	.endef
_expr:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	_term
	movl	%eax, -12(%ebp)
	jmp	L34
L36:
	call	_current
	cmpl	$1, %eax
	jne	L35
	movl	$1, (%esp)
	call	_consume
	call	_term
	addl	%eax, -12(%ebp)
	jmp	L34
L35:
	movl	$2, (%esp)
	call	_consume
	call	_term
	subl	%eax, -12(%ebp)
L34:
	call	_current
	cmpl	$1, %eax
	je	L36
	call	_current
	cmpl	$2, %eax
	je	L36
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "Enter arithmetic expression: \0"
LC5:
	.ascii "\12\0"
LC6:
	.ascii "Result = %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$288, %esp
	call	___main
	movl	$LC4, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$256, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC5, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, 28(%esp,%eax)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_tokenize
	movl	$0, _pos
	call	_expr
	movl	%eax, 284(%esp)
	movl	284(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_isspace;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
