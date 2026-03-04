	.file	"heavylight.c"
	.comm	_adj, 4000000, 5
	.comm	_deg, 4000, 5
	.comm	_n, 4, 2
	.comm	_parent, 4000, 5
	.comm	_depth, 4000, 5
	.comm	_heavy, 4000, 5
	.comm	_head, 4000, 5
	.comm	_pos, 4000, 5
	.comm	_curPos, 4, 2
	.comm	_segtree, 16000, 5
	.comm	_values, 4000, 5
	.text
	.globl	_dfs
	.def	_dfs;	.scl	2;	.type	32;	.endef
_dfs:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$1, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	jmp	L2
L5:
	movl	8(%ebp), %eax
	imull	$1000, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_adj(,%eax,4), %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	_parent(,%eax,4), %eax
	cmpl	-24(%ebp), %eax
	je	L3
	movl	-24(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, _parent(,%eax,4)
	movl	8(%ebp), %eax
	movl	_depth(,%eax,4), %eax
	leal	1(%eax), %edx
	movl	-24(%ebp), %eax
	movl	%edx, _depth(,%eax,4)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_dfs
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jle	L4
	movl	-28(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, _heavy(,%eax,4)
L4:
	movl	-28(%ebp), %eax
	addl	%eax, -12(%ebp)
L3:
	addl	$1, -20(%ebp)
L2:
	movl	8(%ebp), %eax
	movl	_deg(,%eax,4), %eax
	cmpl	-20(%ebp), %eax
	jg	L5
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_decompose
	.def	_decompose;	.scl	2;	.type	32;	.endef
_decompose:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, _head(,%eax,4)
	movl	_curPos, %eax
	leal	1(%eax), %edx
	movl	%edx, _curPos
	movl	8(%ebp), %edx
	movl	%eax, _pos(,%edx,4)
	movl	8(%ebp), %eax
	movl	_heavy(,%eax,4), %eax
	cmpl	$-1, %eax
	je	L8
	movl	8(%ebp), %eax
	movl	_heavy(,%eax,4), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_decompose
L8:
	movl	$0, -12(%ebp)
	jmp	L9
L11:
	movl	8(%ebp), %eax
	imull	$1000, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	_adj(,%eax,4), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	_parent(,%eax,4), %eax
	cmpl	-16(%ebp), %eax
	je	L10
	movl	8(%ebp), %eax
	movl	_heavy(,%eax,4), %eax
	cmpl	-16(%ebp), %eax
	je	L10
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_decompose
L10:
	addl	$1, -12(%ebp)
L9:
	movl	8(%ebp), %eax
	movl	_deg(,%eax,4), %eax
	cmpl	-12(%ebp), %eax
	jg	L11
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_build
	.def	_build;	.scl	2;	.type	32;	.endef
_build:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jne	L13
	movl	12(%ebp), %eax
	movl	_values(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	%edx, _segtree(,%eax,4)
	jmp	L15
L13:
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_build
	movl	-12(%ebp), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	call	_build
	movl	8(%ebp), %eax
	addl	%eax, %eax
	movl	_segtree(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	_segtree(,%eax,4), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, _segtree(,%eax,4)
L15:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_querySeg
	.def	_querySeg;	.scl	2;	.type	32;	.endef
_querySeg:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	20(%ebp), %eax
	cmpl	16(%ebp), %eax
	jg	L17
	movl	24(%ebp), %eax
	cmpl	12(%ebp), %eax
	jge	L18
L17:
	movl	$0, %eax
	jmp	L19
L18:
	movl	20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jg	L20
	movl	16(%ebp), %eax
	cmpl	24(%ebp), %eax
	jg	L20
	movl	8(%ebp), %eax
	movl	_segtree(,%eax,4), %eax
	jmp	L19
L20:
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_querySeg
	movl	%eax, %ebx
	movl	-12(%ebp), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	call	_querySeg
	addl	%ebx, %eax
L19:
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_updateSeg
	.def	_updateSeg;	.scl	2;	.type	32;	.endef
_updateSeg:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jne	L22
	movl	8(%ebp), %eax
	movl	24(%ebp), %edx
	movl	%edx, _segtree(,%eax,4)
	jmp	L26
L22:
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -12(%ebp)
	movl	20(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jg	L24
	movl	8(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_updateSeg
	jmp	L25
L24:
	movl	-12(%ebp), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	call	_updateSeg
L25:
	movl	8(%ebp), %eax
	addl	%eax, %eax
	movl	_segtree(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	_segtree(,%eax,4), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, _segtree(,%eax,4)
L26:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_queryPath
	.def	_queryPath;	.scl	2;	.type	32;	.endef
_queryPath:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	jmp	L28
L30:
	movl	8(%ebp), %eax
	movl	_head(,%eax,4), %eax
	movl	_depth(,%eax,4), %edx
	movl	12(%ebp), %eax
	movl	_head(,%eax,4), %eax
	movl	_depth(,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L29
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%ebp)
L29:
	movl	8(%ebp), %eax
	movl	_pos(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	_head(,%eax,4), %eax
	movl	_pos(,%eax,4), %eax
	movl	_n, %ecx
	subl	$1, %ecx
	movl	%edx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_querySeg
	addl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	_head(,%eax,4), %eax
	movl	_parent(,%eax,4), %eax
	movl	%eax, 8(%ebp)
L28:
	movl	8(%ebp), %eax
	movl	_head(,%eax,4), %edx
	movl	12(%ebp), %eax
	movl	_head(,%eax,4), %eax
	cmpl	%eax, %edx
	jne	L30
	movl	8(%ebp), %eax
	movl	_depth(,%eax,4), %edx
	movl	12(%ebp), %eax
	movl	_depth(,%eax,4), %eax
	cmpl	%eax, %edx
	jle	L31
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, 12(%ebp)
L31:
	movl	12(%ebp), %eax
	movl	_pos(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	_pos(,%eax,4), %eax
	movl	_n, %ecx
	subl	$1, %ecx
	movl	%edx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_querySeg
	addl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_updateNode
	.def	_updateNode;	.scl	2;	.type	32;	.endef
_updateNode:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	_pos(,%eax,4), %eax
	movl	_n, %edx
	leal	-1(%edx), %ecx
	movl	12(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_updateSeg
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "\12--- Heavy-Light Decomposition Toolkit ---\0"
LC1:
	.ascii "1. Build Tree\0"
LC2:
	.ascii "2. Query Path Sum\0"
LC3:
	.ascii "3. Update Node Value\0"
LC4:
	.ascii "0. Exit\0"
LC5:
	.ascii "Choice: \0"
LC6:
	.ascii "%d\0"
LC7:
	.ascii "Enter number of nodes: \0"
LC8:
	.ascii "Enter edges (u v):\0"
LC9:
	.ascii "%d %d\0"
LC10:
	.ascii "Enter node values:\0"
LC11:
	.ascii "Tree built with HLD.\0"
LC12:
	.ascii "Enter nodes a b: \0"
LC13:
	.ascii "Path sum = %d\12\0"
LC14:
	.ascii "Enter node and new value: \0"
LC15:
	.ascii "Node %d updated.\12\0"
LC16:
	.ascii "Exiting...\0"
LC17:
	.ascii "Invalid choice!\0"
	.text
	.globl	_menu
	.def	_menu;	.scl	2;	.type	32;	.endef
_menu:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
L48:
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_printf
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	movl	-24(%ebp), %eax
	cmpl	$1, %eax
	je	L36
	cmpl	$1, %eax
	jg	L37
	testl	%eax, %eax
	je	L38
	jmp	L35
L37:
	cmpl	$2, %eax
	je	L39
	cmpl	$3, %eax
	je	L40
	jmp	L35
L36:
	movl	$LC7, (%esp)
	call	_printf
	movl	$_n, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	jmp	L41
L42:
	movl	-12(%ebp), %eax
	movl	$0, _deg(,%eax,4)
	movl	-12(%ebp), %eax
	movl	$-1, _heavy(,%eax,4)
	addl	$1, -12(%ebp)
L41:
	movl	_n, %eax
	cmpl	%eax, -12(%ebp)
	jl	L42
	movl	$LC8, (%esp)
	call	_puts
	movl	$0, -16(%ebp)
	jmp	L43
L44:
	leal	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_scanf
	movl	-28(%ebp), %ebx
	movl	-28(%ebp), %eax
	movl	_deg(,%eax,4), %edx
	leal	1(%edx), %ecx
	movl	%ecx, _deg(,%eax,4)
	movl	-32(%ebp), %eax
	imull	$1000, %ebx, %ecx
	addl	%ecx, %edx
	movl	%eax, _adj(,%edx,4)
	movl	-32(%ebp), %ebx
	movl	-32(%ebp), %eax
	movl	_deg(,%eax,4), %edx
	leal	1(%edx), %ecx
	movl	%ecx, _deg(,%eax,4)
	movl	-28(%ebp), %eax
	imull	$1000, %ebx, %ecx
	addl	%ecx, %edx
	movl	%eax, _adj(,%edx,4)
	addl	$1, -16(%ebp)
L43:
	movl	_n, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L44
	movl	$-1, _parent
	movl	$0, _depth
	movl	$0, (%esp)
	call	_dfs
	movl	$0, _curPos
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_decompose
	movl	$LC10, (%esp)
	call	_puts
	movl	$0, -20(%ebp)
	jmp	L45
L46:
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	movl	-20(%ebp), %eax
	movl	_pos(,%eax,4), %eax
	movl	-36(%ebp), %edx
	movl	%edx, _values(,%eax,4)
	addl	$1, -20(%ebp)
L45:
	movl	_n, %eax
	cmpl	%eax, -20(%ebp)
	jl	L46
	movl	_n, %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	_build
	movl	$LC11, (%esp)
	call	_puts
	jmp	L47
L39:
	movl	$LC12, (%esp)
	call	_printf
	leal	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_scanf
	movl	-44(%ebp), %edx
	movl	-40(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_queryPath
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	nop
	jmp	L47
L40:
	movl	$LC14, (%esp)
	call	_printf
	leal	-52(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_scanf
	movl	-52(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_updateNode
	movl	-48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	nop
	jmp	L47
L38:
	movl	$LC16, (%esp)
	call	_puts
	jmp	L47
L35:
	movl	$LC17, (%esp)
	call	_puts
L47:
	movl	-24(%ebp), %eax
	testl	%eax, %eax
	jne	L48
	nop
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	call	___main
	call	_menu
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
