	.file	"knuthmorrispratt.c"
	.text
	.globl	_computeLPSArray
	.def	_computeLPSArray;	.scl	2;	.type	32;	.endef
_computeLPSArray:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	16(%ebp), %eax
	movl	$0, (%eax)
	movl	$1, -8(%ebp)
	jmp	L2
L5:
	movl	-8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-4(%ebp), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	L3
	addl	$1, -4(%ebp)
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%eax, (%edx)
	addl	$1, -8(%ebp)
	jmp	L2
L3:
	cmpl	$0, -4(%ebp)
	je	L4
	movl	-4(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	L2
L4:
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	addl	$1, -8(%ebp)
L2:
	movl	-8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L5
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "KMP: Found pattern at index %d\12\0"
	.text
	.globl	_KMPSearch
	.def	_KMPSearch;	.scl	2;	.type	32;	.endef
_KMPSearch:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	%esp, %eax
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -20(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -24(%ebp)
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -28(%ebp)
	sall	$2, %eax
	leal	3(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ecx
	movl	$0, %edx
	divl	%ecx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	12(%esp), %eax
	addl	$3, %eax
	shrl	$2, %eax
	sall	$2, %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_computeLPSArray
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L7
L11:
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-12(%ebp), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	L8
	addl	$1, -16(%ebp)
	addl	$1, -12(%ebp)
L8:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jne	L9
	movl	-12(%ebp), %eax
	subl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-16(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-32(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	movl	%eax, -16(%ebp)
	jmp	L7
L9:
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jge	L7
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-12(%ebp), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	je	L7
	cmpl	$0, -16(%ebp)
	je	L10
	movl	-16(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-32(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	movl	%eax, -16(%ebp)
	jmp	L7
L10:
	addl	$1, -12(%ebp)
L7:
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jl	L11
	movl	%ebx, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_badCharHeuristic
	.def	_badCharHeuristic;	.scl	2;	.type	32;	.endef
_badCharHeuristic:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L13
L14:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	$-1, (%eax)
	addl	$1, -4(%ebp)
L13:
	cmpl	$255, -4(%ebp)
	jle	L14
	movl	$0, -8(%ebp)
	jmp	L15
L16:
	movl	-8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	%eax, (%edx)
	addl	$1, -8(%ebp)
L15:
	movl	-8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L16
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "Boyer-Moore: Found pattern at index %d\12\0"
	.text
	.globl	_boyerMooreSearch
	.def	_boyerMooreSearch;	.scl	2;	.type	32;	.endef
_boyerMooreSearch:
LFB20:
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
	jmp	L18
L26:
	movl	-20(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	L19
L21:
	subl	$1, -16(%ebp)
L19:
	cmpl	$0, -16(%ebp)
	js	L20
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
	je	L21
L20:
	cmpl	$0, -16(%ebp)
	jns	L22
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	-12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	cmpl	-24(%ebp), %eax
	jge	L23
	movl	-12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	-1048(%ebp,%eax,4), %eax
	movl	-20(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	jmp	L24
L23:
	movl	$1, %eax
L24:
	addl	%eax, -12(%ebp)
	jmp	L18
L22:
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	-1048(%ebp,%eax,4), %eax
	movl	-16(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	testl	%eax, %eax
	jg	L25
	movl	$1, %eax
L25:
	addl	%eax, -12(%ebp)
L18:
	movl	-24(%ebp), %eax
	subl	-20(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jge	L26
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC2:
	.ascii "\12Running KMP...\0"
LC3:
	.ascii "\12Running Boyer-Moore...\0"
	.text
	.globl	_runAlgorithms
	.def	_runAlgorithms;	.scl	2;	.type	32;	.endef
_runAlgorithms:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC2, (%esp)
	call	_puts
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_KMPSearch
	movl	$LC3, (%esp)
	call	_puts
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_boyerMooreSearch
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC4:
	.ascii "\12--- String Search Suite ---\0"
LC5:
	.ascii "1. Enter Text & Pattern\0"
LC6:
	.ascii "2. Run KMP\0"
LC7:
	.ascii "3. Run Boyer-Moore\0"
LC8:
	.ascii "4. Run Both\0"
LC9:
	.ascii "0. Exit\0"
LC10:
	.ascii "Choice: \0"
LC11:
	.ascii "%d\0"
LC12:
	.ascii "Enter text: \0"
LC13:
	.ascii "\12\0"
LC14:
	.ascii "Enter pattern: \0"
LC15:
	.ascii "Exiting...\0"
LC16:
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
L37:
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
	leal	-2012(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	call	_getchar
	movl	-2012(%ebp), %eax
	cmpl	$4, %eax
	ja	L29
	movl	L31(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L31:
	.long	L30
	.long	L32
	.long	L33
	.long	L34
	.long	L35
	.text
L32:
	movl	$LC12, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$1000, 4(%esp)
	leal	-1008(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC13, 4(%esp)
	leal	-1008(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -1008(%ebp,%eax)
	movl	$LC14, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$1000, 4(%esp)
	leal	-2008(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC13, 4(%esp)
	leal	-2008(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -2008(%ebp,%eax)
	jmp	L36
L33:
	leal	-1008(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-2008(%ebp), %eax
	movl	%eax, (%esp)
	call	_KMPSearch
	jmp	L36
L34:
	leal	-2008(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1008(%ebp), %eax
	movl	%eax, (%esp)
	call	_boyerMooreSearch
	jmp	L36
L35:
	leal	-2008(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1008(%ebp), %eax
	movl	%eax, (%esp)
	call	_runAlgorithms
	jmp	L36
L30:
	movl	$LC15, (%esp)
	call	_puts
	jmp	L36
L29:
	movl	$LC16, (%esp)
	call	_puts
L36:
	movl	-2012(%ebp), %eax
	testl	%eax, %eax
	jne	L37
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
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
