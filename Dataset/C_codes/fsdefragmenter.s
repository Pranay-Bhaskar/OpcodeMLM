	.file	"fsdefragmenter.c"
	.globl	_disk
	.data
	.align 32
_disk:
	.long	1
	.long	-1
	.long	2
	.long	-1
	.long	3
	.long	-1
	.long	4
	.long	-1
	.long	5
	.long	-1
	.text
	.globl	_defragment
	.def	_defragment;	.scl	2;	.type	32;	.endef
_defragment:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$64, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L2
L4:
	movl	-8(%ebp), %eax
	movl	_disk(,%eax,4), %eax
	cmpl	$-1, %eax
	je	L3
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	-8(%ebp), %edx
	movl	_disk(,%edx,4), %edx
	movl	%edx, -52(%ebp,%eax,4)
L3:
	addl	$1, -8(%ebp)
L2:
	cmpl	$9, -8(%ebp)
	jle	L4
	jmp	L5
L6:
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	$-1, -52(%ebp,%eax,4)
L5:
	cmpl	$9, -4(%ebp)
	jle	L6
	movl	$0, -12(%ebp)
	jmp	L7
L8:
	movl	-12(%ebp), %eax
	movl	-52(%ebp,%eax,4), %edx
	movl	-12(%ebp), %eax
	movl	%edx, _disk(,%eax,4)
	addl	$1, -12(%ebp)
L7:
	cmpl	$9, -12(%ebp)
	jle	L8
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
LC0:
	.ascii "[ ] \0"
LC1:
	.ascii "[%d] \0"
	.text
	.globl	_showDisk
	.def	_showDisk;	.scl	2;	.type	32;	.endef
_showDisk:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L10
L13:
	movl	-12(%ebp), %eax
	movl	_disk(,%eax,4), %eax
	cmpl	$-1, %eax
	jne	L11
	movl	$LC0, (%esp)
	call	_printf
	jmp	L12
L11:
	movl	-12(%ebp), %eax
	movl	_disk(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
L12:
	addl	$1, -12(%ebp)
L10:
	cmpl	$9, -12(%ebp)
	jle	L13
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "Before defragmentation:\0"
LC3:
	.ascii "After defragmentation:\0"
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
	movl	$LC2, (%esp)
	call	_puts
	call	_showDisk
	call	_defragment
	movl	$LC3, (%esp)
	call	_puts
	call	_showDisk
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
