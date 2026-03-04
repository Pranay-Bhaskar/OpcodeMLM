	.file	"dynamicmemory.c"
	.comm	_memory, 1024, 5
	.globl	_used
	.bss
	.align 4
_used:
	.space 4
	.text
	.globl	_mymalloc
	.def	_mymalloc;	.scl	2;	.type	32;	.endef
_mymalloc:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	_used, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	cmpl	$1024, %eax
	jbe	L2
	movl	$0, %eax
	jmp	L3
L2:
	movl	_used, %eax
	addl	$_memory, %eax
	movl	%eax, -4(%ebp)
	movl	_used, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, _used
	movl	-4(%ebp), %eax
L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_myfree
	.def	_myfree;	.scl	2;	.type	32;	.endef
_myfree:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
