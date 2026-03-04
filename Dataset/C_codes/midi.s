	.file	"midi.c"
	.globl	_melody
	.data
	.align 32
_melody:
	.long	440
	.long	500
	.long	494
	.long	500
	.long	523
	.long	500
	.long	587
	.long	500
	.long	659
	.long	500
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Playing simple melody...\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB25:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$36, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %eax
	movl	_melody+4(,%eax,8), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	_melody(,%eax,8), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Beep@8
	subl	$8, %esp
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	$4, %eax
	jbe	L3
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_Beep@8;	.scl	2;	.type	32;	.endef
