	.file	"hashtable.c"
	.comm	_table, 40, 5
	.text
	.globl	_hash
	.def	_hash;	.scl	2;	.type	32;	.endef
_hash:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_insert
	.def	_insert;	.scl	2;	.type	32;	.endef
_insert:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_hash
	movl	%eax, -12(%ebp)
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	_table(,%eax,4), %edx
	movl	-16(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, _table(,%eax,4)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
