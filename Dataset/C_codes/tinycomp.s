	.file	"tinycomp.c"
	.comm	_tokens, 6000, 5
	.globl	_pos
	.bss
	.align 4
_pos:
	.space 4
	.comm	_vars, 2800, 5
	.globl	_var_count
	.align 4
_var_count:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "Unknown char %c\12\0"
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
	subl	$104, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L2
L19:
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
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$0, (%eax)
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	leal	_tokens+56(%eax), %edx
	movl	-20(%ebp), %eax
	movl	%eax, (%edx)
	addl	$1, -16(%ebp)
	jmp	L2
L4:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_isalpha
	testl	%eax, %eax
	je	L7
	movl	$0, -24(%ebp)
	jmp	L8
L9:
	movl	-24(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -24(%ebp)
	movl	-12(%ebp), %edx
	leal	1(%edx), %ecx
	movl	%ecx, -12(%ebp)
	movl	%edx, %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movb	%dl, -74(%ebp,%eax)
L8:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_isalnum
	testl	%eax, %eax
	jne	L9
	leal	-74(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$1, (%eax)
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	leal	4(%eax), %edx
	leal	-74(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
	addl	$1, -16(%ebp)
	jmp	L2
L7:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$42, %eax
	cmpl	$19, %eax
	ja	L10
	movl	L12(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L12:
	.long	L11
	.long	L13
	.long	L10
	.long	L14
	.long	L10
	.long	L15
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L10
	.long	L16
	.long	L10
	.long	L17
	.text
L17:
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$2, (%eax)
	jmp	L18
L13:
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$3, (%eax)
	jmp	L18
L14:
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$4, (%eax)
	jmp	L18
L11:
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$5, (%eax)
	jmp	L18
L15:
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$6, (%eax)
	jmp	L18
L16:
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$7, (%eax)
	jmp	L18
L10:
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
L18:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movl	-16(%ebp), %edx
	imull	$60, %edx, %edx
	addl	$_tokens+4, %edx
	movb	%al, (%edx)
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens+5, %eax
	movb	$0, (%eax)
	addl	$1, -16(%ebp)
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L19
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_tokens, %eax
	movl	$8, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_lookup
	.def	_lookup;	.scl	2;	.type	32;	.endef
_lookup:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L21
L24:
	movl	-12(%ebp), %eax
	imull	$56, %eax, %eax
	leal	_vars(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L22
	movl	-12(%ebp), %eax
	imull	$56, %eax, %eax
	addl	$_vars, %eax
	jmp	L23
L22:
	addl	$1, -12(%ebp)
L21:
	movl	_var_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L24
	movl	$0, %eax
L23:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_add_var
	.def	_add_var;	.scl	2;	.type	32;	.endef
_add_var:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_var_count, %eax
	imull	$56, %eax, %eax
	leal	_vars(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
	movl	_var_count, %eax
	imull	$56, %eax, %eax
	addl	$_vars+52, %eax
	movl	$0, (%eax)
	movl	_var_count, %eax
	leal	1(%eax), %edx
	movl	%edx, _var_count
	imull	$56, %eax, %eax
	addl	$_vars, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_current
	.def	_current;	.scl	2;	.type	32;	.endef
_current:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_pos, %edx
	movl	8(%ebp), %eax
	imull	$60, %edx, %edx
	addl	$_tokens, %edx
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 12(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	movl	8(%ebp), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC1:
	.ascii "Unexpected token\0"
	.text
	.globl	_consume
	.def	_consume;	.scl	2;	.type	32;	.endef
_consume:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-68(%ebp), %eax
	cmpl	8(%ebp), %eax
	jne	L30
	movl	_pos, %eax
	addl	$1, %eax
	movl	%eax, _pos
	jmp	L32
L30:
	movl	$LC1, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L32:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC2:
	.ascii "Undefined var %s\12\0"
LC3:
	.ascii "Unexpected factor\0"
	.text
	.globl	_factor
	.def	_factor;	.scl	2;	.type	32;	.endef
_factor:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$344, %esp
	leal	-316(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-316(%ebp), %eax
	testl	%eax, %eax
	jne	L34
	leal	-256(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-200(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$0, (%esp)
	call	_consume
	movl	-12(%ebp), %eax
	jmp	L35
L34:
	leal	-196(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-196(%ebp), %eax
	cmpl	$1, %eax
	jne	L36
	leal	-136(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	leal	-136(%ebp), %eax
	addl	$4, %eax
	movl	%eax, (%esp)
	call	_lookup
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L37
	leal	-76(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	leal	-76(%ebp), %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$1, (%esp)
	call	_exit
L37:
	movl	$1, (%esp)
	call	_consume
	movl	-16(%ebp), %eax
	movl	52(%eax), %eax
	jmp	L35
L36:
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L35:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC4:
	.ascii "Div by zero\0"
	.text
	.globl	_term
	.def	_term;	.scl	2;	.type	32;	.endef
_term:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$216, %esp
	call	_factor
	movl	%eax, -12(%ebp)
	jmp	L39
L42:
	leal	-196(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-196(%ebp), %eax
	cmpl	$5, %eax
	jne	L40
	movl	$5, (%esp)
	call	_consume
	call	_factor
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	imull	%edx, %eax
	movl	%eax, -12(%ebp)
	jmp	L39
L40:
	movl	$6, (%esp)
	call	_consume
	call	_factor
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L41
	movl	$LC4, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L41:
	movl	-12(%ebp), %eax
	cltd
	idivl	-16(%ebp)
	movl	%eax, -12(%ebp)
L39:
	leal	-136(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-136(%ebp), %eax
	cmpl	$5, %eax
	je	L42
	leal	-76(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-76(%ebp), %eax
	cmpl	$6, %eax
	je	L42
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_expr
	.def	_expr;	.scl	2;	.type	32;	.endef
_expr:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$216, %esp
	call	_term
	movl	%eax, -12(%ebp)
	jmp	L45
L47:
	leal	-192(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-192(%ebp), %eax
	cmpl	$3, %eax
	jne	L46
	movl	$3, (%esp)
	call	_consume
	call	_term
	addl	%eax, -12(%ebp)
	jmp	L45
L46:
	movl	$4, (%esp)
	call	_consume
	call	_term
	subl	%eax, -12(%ebp)
L45:
	leal	-132(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-132(%ebp), %eax
	cmpl	$3, %eax
	je	L47
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-72(%ebp), %eax
	cmpl	$4, %eax
	je	L47
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC5:
	.ascii "%s = %d\12\0"
LC6:
	.ascii "Invalid statement\0"
	.text
	.globl	_statement
	.def	_statement;	.scl	2;	.type	32;	.endef
_statement:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$216, %esp
	leal	-136(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	-136(%ebp), %eax
	cmpl	$1, %eax
	jne	L50
	leal	-76(%ebp), %eax
	movl	%eax, (%esp)
	call	_current
	leal	-76(%ebp), %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	leal	-186(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcpy
	movl	$1, (%esp)
	call	_consume
	movl	$2, (%esp)
	call	_consume
	call	_expr
	movl	%eax, -16(%ebp)
	movl	$7, (%esp)
	call	_consume
	leal	-186(%ebp), %eax
	movl	%eax, (%esp)
	call	_lookup
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L51
	leal	-186(%ebp), %eax
	movl	%eax, (%esp)
	call	_add_var
	movl	%eax, -12(%ebp)
L51:
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 52(%eax)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-186(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	jmp	L53
L50:
	movl	$LC6, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L53:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC7:
	.ascii "Enter program (end with ;):\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$336, %esp
	call	___main
	movl	$LC7, (%esp)
	call	_puts
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$256, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_tokenize
	movl	$0, _pos
	jmp	L55
L56:
	call	_statement
L55:
	leal	276(%esp), %eax
	movl	%eax, (%esp)
	call	_current
	movl	276(%esp), %eax
	cmpl	$8, %eax
	jne	L56
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_isspace;	.scl	2;	.type	32;	.endef
	.def	_isalpha;	.scl	2;	.type	32;	.endef
	.def	_isalnum;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
