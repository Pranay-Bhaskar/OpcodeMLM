	.file	"bfsdfs.c"
	.comm	_adj, 100, 5
	.text
	.globl	_addEdge
	.def	_addEdge;	.scl	2;	.type	32;	.endef
_addEdge:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	12(%ebp), %edx
	addl	%edx, %eax
	movl	$1, _adj(,%eax,4)
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movl	$1, _adj(,%eax,4)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
LC0:
	.ascii "%d \0"
	.text
	.globl	_BFS
	.def	_BFS;	.scl	2;	.type	32;	.endef
_BFS:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	$0, -44(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -36(%ebp)
	movl	$0, -32(%ebp)
	movl	$0, -28(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	8(%ebp), %eax
	movl	$1, -44(%ebp,%eax,4)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	8(%ebp), %edx
	movl	%edx, -64(%ebp,%eax,4)
	jmp	L3
L7:
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	movl	-64(%ebp,%eax,4), %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, -20(%ebp)
	jmp	L4
L6:
	movl	-24(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-20(%ebp), %edx
	addl	%edx, %eax
	movl	_adj(,%eax,4), %eax
	testl	%eax, %eax
	je	L5
	movl	-20(%ebp), %eax
	movl	-44(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L5
	movl	-20(%ebp), %eax
	movl	$1, -44(%ebp,%eax,4)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	-20(%ebp), %edx
	movl	%edx, -64(%ebp,%eax,4)
L5:
	addl	$1, -20(%ebp)
L4:
	cmpl	$4, -20(%ebp)
	jle	L6
L3:
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jl	L7
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	_DFSUtil
	.def	_DFSUtil;	.scl	2;	.type	32;	.endef
_DFSUtil:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	$1, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L9
L11:
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	addl	%edx, %eax
	movl	_adj(,%eax,4), %eax
	testl	%eax, %eax
	je	L10
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L10
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_DFSUtil
L10:
	addl	$1, -12(%ebp)
L9:
	cmpl	$4, -12(%ebp)
	jle	L11
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.globl	_DFS
	.def	_DFS;	.scl	2;	.type	32;	.endef
_DFS:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -28(%ebp)
	movl	$0, -24(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_DFSUtil
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
