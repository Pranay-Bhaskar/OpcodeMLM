	.file	"treewalk.c"
	.section .rdata,"dr"
LC0:
	.ascii "   \0"
	.text
	.globl	_print_indent
	.def	_print_indent;	.scl	2;	.type	32;	.endef
_print_indent:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC1:
	.ascii "opendir\0"
LC2:
	.ascii ".\0"
LC3:
	.ascii "..\0"
LC4:
	.ascii "%s/%s\0"
LC5:
	.ascii "stat\0"
LC6:
	.ascii "[DIR] %s\12\0"
	.text
	.globl	_walk
	.def	_walk;	.scl	2;	.type	32;	.endef
_walk:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$1128, %esp
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	___mingw_opendir
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L8
	movl	$LC1, (%esp)
	call	_perror
	jmp	L4
L16:
	movl	-16(%ebp), %eax
	addl	$12, %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L18
	movl	-16(%ebp), %eax
	addl	$12, %eax
	movl	$LC3, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L18
	movl	-16(%ebp), %eax
	addl	$12, %eax
	movl	%eax, 16(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$LC4, 8(%esp)
	movl	$1024, 4(%esp)
	leal	-1052(%ebp), %eax
	movl	%eax, (%esp)
	call	_snprintf
	leal	-1088(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1052(%ebp), %eax
	movl	%eax, (%esp)
	call	_stat
	cmpl	$-1, %eax
	jne	L12
	movl	$LC5, (%esp)
	call	_perror
	jmp	L8
L12:
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_indent
	movzwl	-1082(%ebp), %eax
	movzwl	%ax, %eax
	andl	$61440, %eax
	cmpl	$16384, %eax
	jne	L13
	movl	-16(%ebp), %eax
	addl	$12, %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	20(%ebp), %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	20(%ebp), %eax
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	leal	-1052(%ebp), %eax
	movl	%eax, (%esp)
	call	_walk
	jmp	L8
L13:
	movl	-16(%ebp), %eax
	addl	$12, %eax
	movl	%eax, (%esp)
	call	_puts
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, (%eax)
	jmp	L8
L18:
	nop
L8:
	movl	-12(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	___mingw_readdir
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L16
	movl	-12(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	___mingw_closedir
L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC7:
	.ascii "Usage: %s <directory>\12\0"
LC8:
	.ascii "Walking directory tree: %s\12\0"
LC9:
	.ascii "\12Summary:\0"
LC10:
	.ascii "Directories: %d\12\0"
LC11:
	.ascii "Files: %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	cmpl	$1, 8(%ebp)
	jg	L20
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	$1, %eax
	jmp	L22
L20:
	movl	$0, 28(%esp)
	movl	$0, 24(%esp)
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	leal	24(%esp), %edx
	movl	%edx, 12(%esp)
	leal	28(%esp), %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_walk
	movl	$LC9, (%esp)
	call	_puts
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	movl	$0, %eax
L22:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	___mingw_opendir;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_snprintf;	.scl	2;	.type	32;	.endef
	.def	_stat;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	___mingw_readdir;	.scl	2;	.type	32;	.endef
	.def	___mingw_closedir;	.scl	2;	.type	32;	.endef
