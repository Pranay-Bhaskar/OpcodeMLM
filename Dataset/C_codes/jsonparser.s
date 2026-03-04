	.file	"jsonparser.c"
	.section .rdata,"dr"
LC0:
	.ascii "{\"%[^\"]\":\"%[^\"]\"}\0"
LC1:
	.ascii "Key: %s, Value: %s\12\0"
	.text
	.globl	_parseJSON
	.def	_parseJSON;	.scl	2;	.type	32;	.endef
_parseJSON:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$136, %esp
	leal	-108(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-58(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_sscanf
	leal	-108(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_sscanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
