	.file	"graph.c"
	.text
	.globl	_newNode
	.def	_newNode;	.scl	2;	.type	32;	.endef
_newNode:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_createGraph
	.def	_createGraph;	.scl	2;	.type	32;	.endef
_createGraph:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	$0, -12(%ebp)
	jmp	L4
L5:
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	addl	$1, -12(%ebp)
L4:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L5
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_addEdge
	.def	_addEdge;	.scl	2;	.type	32;	.endef
_addEdge:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_newNode
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	12(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
