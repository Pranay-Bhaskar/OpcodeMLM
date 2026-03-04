	.file	"signalhandler.c"
	.section .rdata,"dr"
LC0:
	.ascii "Caught signal %d\12\0"
	.text
	.globl	_handler
	.def	_handler;	.scl	2;	.type	32;	.endef
_handler:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "Running...\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$_handler, 4(%esp)
	movl	$2, (%esp)
	call	_signal
L3:
	movl	$LC1, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_sleep
	jmp	L3
	.cfi_endproc
LFE12:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_signal;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_sleep;	.scl	2;	.type	32;	.endef
