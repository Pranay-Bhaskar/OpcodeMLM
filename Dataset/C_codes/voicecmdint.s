	.file	"voicecmdint.c"
	.section .rdata,"dr"
LC0:
	.ascii "lights on\0"
LC1:
	.ascii "Turning lights on...\0"
LC2:
	.ascii "lights off\0"
LC3:
	.ascii "Turning lights off...\0"
LC4:
	.ascii "play music\0"
LC5:
	.ascii "Playing music...\0"
LC6:
	.ascii "Unknown command: %s\12\0"
	.text
	.globl	_executeCommand
	.def	_executeCommand;	.scl	2;	.type	32;	.endef
_executeCommand:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L2
	movl	$LC1, (%esp)
	call	_puts
	jmp	L6
L2:
	movl	$LC2, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L4
	movl	$LC3, (%esp)
	call	_puts
	jmp	L6
L4:
	movl	$LC4, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L5
	movl	$LC5, (%esp)
	call	_puts
	jmp	L6
L5:
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
L6:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "Enter voice command (simulate):\0"
LC8:
	.ascii "\12\0"
LC9:
	.ascii "exit\0"
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
	addl	$-128, %esp
	call	___main
	movl	$LC7, (%esp)
	call	_puts
L10:
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC8, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, 28(%esp,%eax)
	movl	$LC9, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L13
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_executeCommand
	jmp	L10
L13:
	nop
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
