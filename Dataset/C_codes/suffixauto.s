	.file	"suffixauto.c"
	.comm	_st, 224000, 5
	.comm	_sz, 4, 2
	.comm	_last, 4, 2
	.text
	.globl	_sa_init
	.def	_sa_init;	.scl	2;	.type	32;	.endef
_sa_init:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, _st
	movl	$-1, _st+4
	movl	$104, 8(%esp)
	movl	$-1, 4(%esp)
	movl	$_st+8, (%esp)
	call	_memset
	movl	$1, _sz
	movl	$0, _last
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_sa_extend
	.def	_sa_extend;	.scl	2;	.type	32;	.endef
_sa_extend:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movb	%al, -44(%ebp)
	movl	_sz, %eax
	leal	1(%eax), %edx
	movl	%edx, _sz
	movl	%eax, -16(%ebp)
	movl	_last, %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	-16(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	addl	$8, %eax
	movl	$104, 8(%esp)
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	movl	_last, %eax
	movl	%eax, -12(%ebp)
	movsbl	-44(%ebp), %eax
	subl	$97, %eax
	movl	%eax, -20(%ebp)
	jmp	L3
L5:
	movl	-12(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%eax, _st+8(,%edx,4)
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st+4, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L3:
	cmpl	$-1, -12(%ebp)
	je	L4
	movl	-12(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	cmpl	$-1, %eax
	je	L5
L4:
	cmpl	$-1, -12(%ebp)
	jne	L6
	movl	-16(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st+4, %eax
	movl	$0, (%eax)
	jmp	L7
L6:
	movl	-12(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	movl	%eax, -24(%ebp)
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	-24(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	L8
	movl	-16(%ebp), %eax
	imull	$112, %eax, %eax
	leal	_st+4(%eax), %edx
	movl	-24(%ebp), %eax
	movl	%eax, (%edx)
	jmp	L7
L8:
	movl	_sz, %eax
	leal	1(%eax), %edx
	movl	%edx, _sz
	movl	%eax, -28(%ebp)
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	-28(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	%edx, (%eax)
	movl	-24(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	leal	8(%eax), %edx
	movl	-28(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	addl	$8, %eax
	movl	$104, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	movl	-24(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st+4, %eax
	movl	(%eax), %eax
	movl	-28(%ebp), %edx
	imull	$112, %edx, %edx
	addl	$_st+4, %edx
	movl	%eax, (%edx)
	jmp	L9
L11:
	movl	-12(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	%eax, _st+8(,%edx,4)
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st+4, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L9:
	cmpl	$-1, -12(%ebp)
	je	L10
	movl	-12(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	cmpl	-24(%ebp), %eax
	je	L11
L10:
	movl	-16(%ebp), %eax
	imull	$112, %eax, %eax
	leal	_st+4(%eax), %edx
	movl	-28(%ebp), %eax
	movl	%eax, (%edx)
	movl	-16(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st+4, %eax
	movl	(%eax), %eax
	movl	-24(%ebp), %edx
	imull	$112, %edx, %edx
	addl	$_st+4, %edx
	movl	%eax, (%edx)
L7:
	movl	-16(%ebp), %eax
	movl	%eax, _last
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_sa_contains
	.def	_sa_contains;	.scl	2;	.type	32;	.endef
_sa_contains:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L13
L16:
	movl	-8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$97, %eax
	movl	%eax, -12(%ebp)
	movl	-4(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	cmpl	$-1, %eax
	jne	L14
	movl	$0, %eax
	jmp	L15
L14:
	movl	-4(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
L13:
	movl	-8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L16
	movl	$1, %eax
L15:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_sa_lcs
	.def	_sa_lcs;	.scl	2;	.type	32;	.endef
_sa_lcs:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L18
L26:
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$97, %eax
	movl	%eax, -20(%ebp)
	movl	-4(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	cmpl	$-1, %eax
	je	L21
	movl	-4(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
	jmp	L20
L23:
	movl	-4(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st+4, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
L21:
	cmpl	$-1, -4(%ebp)
	je	L22
	movl	-4(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	cmpl	$-1, %eax
	je	L23
L22:
	cmpl	$-1, -4(%ebp)
	jne	L24
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L20
L24:
	movl	-4(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	movl	%eax, -4(%ebp)
L20:
	movl	-8(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jle	L25
	movl	-8(%ebp), %eax
	movl	%eax, -12(%ebp)
L25:
	addl	$1, -16(%ebp)
L18:
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L26
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC0:
	.ascii "\12Suffix Automaton States:\0"
	.align 4
LC1:
	.ascii "State %d: length=%d, link=%d, next=[\0"
LC2:
	.ascii "%c->%d \0"
LC3:
	.ascii "]\0"
	.text
	.globl	_printAutomaton
	.def	_printAutomaton;	.scl	2;	.type	32;	.endef
_printAutomaton:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L29
L33:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st+4, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_st, %eax
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$0, -16(%ebp)
	jmp	L30
L32:
	movl	-12(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	cmpl	$-1, %eax
	je	L31
	movl	-12(%ebp), %eax
	imull	$28, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_st+8(,%eax,4), %eax
	movl	-16(%ebp), %edx
	addl	$97, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
L31:
	addl	$1, -16(%ebp)
L30:
	cmpl	$25, -16(%ebp)
	jle	L32
	movl	$LC3, (%esp)
	call	_puts
	addl	$1, -12(%ebp)
L29:
	movl	_sz, %eax
	cmpl	%eax, -12(%ebp)
	jl	L33
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
	.align 4
LC4:
	.ascii "\12--- Suffix Automaton Toolkit ---\0"
	.align 4
LC5:
	.ascii "1. Build Automaton from String\0"
LC6:
	.ascii "2. Check if Substring Exists\0"
	.align 4
LC7:
	.ascii "3. Longest Common Substring with Another String\0"
LC8:
	.ascii "4. Print Automaton\0"
LC9:
	.ascii "0. Exit\0"
LC10:
	.ascii "Choice: \0"
LC11:
	.ascii "%d\0"
LC12:
	.ascii "Enter string: \0"
LC13:
	.ascii "\12\0"
	.align 4
LC14:
	.ascii "Automaton built for string '%s'.\12\0"
LC15:
	.ascii "Enter substring: \0"
LC16:
	.ascii "Substring '%s' exists.\12\0"
	.align 4
LC17:
	.ascii "Substring '%s' does not exist.\12\0"
LC18:
	.ascii "Enter second string: \0"
	.align 4
LC19:
	.ascii "Longest Common Substring length = %d\12\0"
LC20:
	.ascii "Exiting...\0"
LC21:
	.ascii "Invalid choice!\0"
	.text
	.globl	_menu
	.def	_menu;	.scl	2;	.type	32;	.endef
_menu:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$2040, %esp
L47:
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_puts
	movl	$LC6, (%esp)
	call	_puts
	movl	$LC7, (%esp)
	call	_puts
	movl	$LC8, (%esp)
	call	_puts
	movl	$LC9, (%esp)
	call	_puts
	movl	$LC10, (%esp)
	call	_printf
	leal	-2020(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	call	_getchar
	movl	-2020(%ebp), %eax
	cmpl	$4, %eax
	ja	L35
	movl	L37(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L37:
	.long	L36
	.long	L38
	.long	L39
	.long	L40
	.long	L41
	.text
L38:
	movl	$LC12, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$1000, 4(%esp)
	leal	-1016(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC13, 4(%esp)
	leal	-1016(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -1016(%ebp,%eax)
	call	_sa_init
	movl	$0, -12(%ebp)
	jmp	L42
L43:
	leal	-1016(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_sa_extend
	addl	$1, -12(%ebp)
L42:
	leal	-1016(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L43
	leal	-1016(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	jmp	L44
L39:
	movl	$LC15, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$1000, 4(%esp)
	leal	-2016(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC13, 4(%esp)
	leal	-2016(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -2016(%ebp,%eax)
	leal	-2016(%ebp), %eax
	movl	%eax, (%esp)
	call	_sa_contains
	testl	%eax, %eax
	je	L45
	leal	-2016(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	jmp	L44
L45:
	leal	-2016(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	jmp	L44
L40:
	movl	$LC18, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$1000, 4(%esp)
	leal	-2016(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC13, 4(%esp)
	leal	-2016(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -2016(%ebp,%eax)
	leal	-2016(%ebp), %eax
	movl	%eax, (%esp)
	call	_sa_lcs
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_printf
	jmp	L44
L41:
	call	_printAutomaton
	jmp	L44
L36:
	movl	$LC20, (%esp)
	call	_puts
	jmp	L44
L35:
	movl	$LC21, (%esp)
	call	_puts
L44:
	movl	-2020(%ebp), %eax
	testl	%eax, %eax
	jne	L47
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB23:
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
LFE23:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
