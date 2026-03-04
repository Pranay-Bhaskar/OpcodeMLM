	.file	"ad.c"
	.globl	_table
	.data
	.align 32
_table:
	.ascii "LOAD\0"
	.space 5
	.space 2
	.long	1
	.ascii "STORE\0"
	.space 4
	.space 2
	.long	2
	.ascii "ADD\0"
	.space 6
	.space 2
	.long	3
	.ascii "SUB\0"
	.space 6
	.space 2
	.long	4
	.ascii "JMP\0"
	.space 6
	.space 2
	.long	5
	.section .rdata,"dr"
LC0:
	.ascii "Opcode: %d\12\0"
LC1:
	.ascii "Unknown instruction\0"
	.text
	.globl	_assemble
	.def	_assemble;	.scl	2;	.type	32;	.endef
_assemble:
LFB13:
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
	movl	-12(%ebp), %eax
	sall	$4, %eax
	leal	_table(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L3
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_table+12, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	jmp	L1
L3:
	addl	$1, -12(%ebp)
L2:
	cmpl	$4, -12(%ebp)
	jle	L5
	movl	$LC1, (%esp)
	call	_puts
L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.section .rdata,"dr"
LC2:
	.ascii "Mnemonic: %s\12\0"
LC3:
	.ascii "Unknown opcode\0"
	.text
	.globl	_disassemble
	.def	_disassemble;	.scl	2;	.type	32;	.endef
_disassemble:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L7
L10:
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_table+12, %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	jne	L8
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_table, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	jmp	L6
L8:
	addl	$1, -12(%ebp)
L7:
	cmpl	$4, -12(%ebp)
	jle	L10
	movl	$LC3, (%esp)
	call	_puts
L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "ADD\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$LC4, (%esp)
	call	_assemble
	movl	$2, (%esp)
	call	_disassemble
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
