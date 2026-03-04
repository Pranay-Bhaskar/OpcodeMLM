	.file	"gt.c"
	.comm	_graph, 40000, 5
	.comm	_vertices, 4, 2
	.text
	.globl	_addEdge
	.def	_addEdge;	.scl	2;	.type	32;	.endef
_addEdge:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	imull	$100, %eax, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, _graph(,%edx,4)
	movl	12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl	%eax, _graph(,%edx,4)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.section .rdata,"dr"
LC0:
	.ascii "Adjacency Matrix:\0"
LC1:
	.ascii "INF \0"
LC2:
	.ascii "%d \0"
	.text
	.globl	_printGraph
	.def	_printGraph;	.scl	2;	.type	32;	.endef
_printGraph:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L3
L8:
	movl	$0, -16(%ebp)
	jmp	L4
L7:
	movl	-12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	jne	L5
	movl	$LC1, (%esp)
	call	_printf
	jmp	L6
L5:
	movl	-12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
L6:
	addl	$1, -16(%ebp)
L4:
	movl	_vertices, %eax
	cmpl	%eax, -16(%ebp)
	jl	L7
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L3:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L8
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
LC3:
	.ascii "BFS: \0"
	.text
	.globl	_bfs
	.def	_bfs;	.scl	2;	.type	32;	.endef
_bfs:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$836, %esp
	.cfi_offset 7, -12
	leal	-424(%ebp), %edx
	movl	$0, %eax
	movl	$100, %ecx
	movl	%edx, %edi
	rep stosl
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	8(%ebp), %eax
	movl	$1, -424(%ebp,%eax,4)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	8(%ebp), %edx
	movl	%edx, -824(%ebp,%eax,4)
	movl	$LC3, (%esp)
	call	_printf
	jmp	L10
L14:
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	movl	-824(%ebp,%eax,4), %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, -20(%ebp)
	jmp	L11
L13:
	movl	-24(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L12
	movl	-20(%ebp), %eax
	movl	-424(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L12
	movl	-20(%ebp), %eax
	movl	$1, -424(%ebp,%eax,4)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	-20(%ebp), %edx
	movl	%edx, -824(%ebp,%eax,4)
L12:
	addl	$1, -20(%ebp)
L11:
	movl	_vertices, %eax
	cmpl	%eax, -20(%ebp)
	jl	L13
L10:
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jl	L14
	movl	$10, (%esp)
	call	_putchar
	nop
	addl	$836, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_dfsUtil
	.def	_dfsUtil;	.scl	2;	.type	32;	.endef
_dfsUtil:
LFB17:
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
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L16
L18:
	movl	8(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L17
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L17
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_dfsUtil
L17:
	addl	$1, -12(%ebp)
L16:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L18
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC4:
	.ascii "DFS: \0"
	.text
	.globl	_dfs
	.def	_dfs;	.scl	2;	.type	32;	.endef
_dfs:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$420, %esp
	.cfi_offset 7, -12
	leal	-408(%ebp), %edx
	movl	$0, %eax
	movl	$100, %ecx
	movl	%edx, %edi
	rep stosl
	movl	$LC4, (%esp)
	call	_printf
	leal	-408(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_dfsUtil
	movl	$10, (%esp)
	call	_putchar
	nop
	addl	$420, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC5:
	.ascii "Dijkstra from %d:\12\0"
LC6:
	.ascii "To %d: %d\12\0"
	.text
	.globl	_dijkstra
	.def	_dijkstra;	.scl	2;	.type	32;	.endef
_dijkstra:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$856, %esp
	movl	$0, -12(%ebp)
	jmp	L21
L22:
	movl	-12(%ebp), %eax
	movl	$2147483647, -432(%ebp,%eax,4)
	movl	-12(%ebp), %eax
	movl	$0, -832(%ebp,%eax,4)
	addl	$1, -12(%ebp)
L21:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L22
	movl	8(%ebp), %eax
	movl	$0, -432(%ebp,%eax,4)
	movl	$0, -16(%ebp)
	jmp	L23
L31:
	movl	$-1, -20(%ebp)
	movl	$0, -24(%ebp)
	jmp	L24
L27:
	movl	-24(%ebp), %eax
	movl	-832(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L25
	cmpl	$-1, -20(%ebp)
	je	L26
	movl	-24(%ebp), %eax
	movl	-432(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	movl	-432(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L25
L26:
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L25:
	addl	$1, -24(%ebp)
L24:
	movl	_vertices, %eax
	cmpl	%eax, -24(%ebp)
	jl	L27
	movl	-20(%ebp), %eax
	movl	$1, -832(%ebp,%eax,4)
	movl	$0, -28(%ebp)
	jmp	L28
L30:
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L29
	movl	-20(%ebp), %eax
	movl	-432(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	imull	$100, %eax, %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movl	_graph(,%eax,4), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	-432(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L29
	movl	-20(%ebp), %eax
	movl	-432(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	imull	$100, %eax, %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movl	_graph(,%eax,4), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	%edx, -432(%ebp,%eax,4)
L29:
	addl	$1, -28(%ebp)
L28:
	movl	_vertices, %eax
	cmpl	%eax, -28(%ebp)
	jl	L30
	addl	$1, -16(%ebp)
L23:
	movl	_vertices, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L31
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	$0, -32(%ebp)
	jmp	L32
L33:
	movl	-32(%ebp), %eax
	movl	-432(%ebp,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	addl	$1, -32(%ebp)
L32:
	movl	_vertices, %eax
	cmpl	%eax, -32(%ebp)
	jl	L33
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$5, _vertices
	movl	$0, 28(%esp)
	jmp	L35
L38:
	movl	$0, 24(%esp)
	jmp	L36
L37:
	movl	28(%esp), %eax
	imull	$100, %eax, %edx
	movl	24(%esp), %eax
	addl	%edx, %eax
	movl	$2147483647, _graph(,%eax,4)
	addl	$1, 24(%esp)
L36:
	movl	_vertices, %eax
	cmpl	%eax, 24(%esp)
	jl	L37
	addl	$1, 28(%esp)
L35:
	movl	_vertices, %eax
	cmpl	%eax, 28(%esp)
	jl	L38
	movl	$10, 8(%esp)
	movl	$1, 4(%esp)
	movl	$0, (%esp)
	call	_addEdge
	movl	$5, 8(%esp)
	movl	$4, 4(%esp)
	movl	$0, (%esp)
	call	_addEdge
	movl	$1, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	_addEdge
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$2, (%esp)
	call	_addEdge
	movl	$2, 8(%esp)
	movl	$4, 4(%esp)
	movl	$3, (%esp)
	call	_addEdge
	call	_printGraph
	movl	$0, (%esp)
	call	_bfs
	movl	$0, (%esp)
	call	_dfs
	movl	$0, (%esp)
	call	_dijkstra
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
