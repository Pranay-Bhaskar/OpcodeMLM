	.file	"gat.c"
	.comm	_graph, 40000, 5
	.comm	_vertices, 4, 2
	.text
	.globl	_initGraph
	.def	_initGraph;	.scl	2;	.type	32;	.endef
_initGraph:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, _vertices
	movl	$0, -4(%ebp)
	jmp	L2
L5:
	movl	$0, -8(%ebp)
	jmp	L3
L4:
	movl	-4(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-8(%ebp), %eax
	addl	%edx, %eax
	movl	$2147483647, _graph(,%eax,4)
	addl	$1, -8(%ebp)
L3:
	movl	_vertices, %eax
	cmpl	%eax, -8(%ebp)
	jl	L4
	addl	$1, -4(%ebp)
L2:
	movl	_vertices, %eax
	cmpl	%eax, -4(%ebp)
	jl	L5
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_addEdge
	.def	_addEdge;	.scl	2;	.type	32;	.endef
_addEdge:
LFB15:
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
LFE15:
	.section .rdata,"dr"
LC0:
	.ascii "\12Adjacency Matrix:\0"
LC1:
	.ascii "INF \0"
LC2:
	.ascii "%d \0"
	.text
	.globl	_printGraph
	.def	_printGraph;	.scl	2;	.type	32;	.endef
_printGraph:
LFB16:
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
	jmp	L8
L13:
	movl	$0, -16(%ebp)
	jmp	L9
L12:
	movl	-12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	jne	L10
	movl	$LC1, (%esp)
	call	_printf
	jmp	L11
L10:
	movl	-12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
L11:
	addl	$1, -16(%ebp)
L9:
	movl	_vertices, %eax
	cmpl	%eax, -16(%ebp)
	jl	L12
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L8:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L13
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.section .rdata,"dr"
LC3:
	.ascii "BFS: \0"
	.text
	.globl	_bfs
	.def	_bfs;	.scl	2;	.type	32;	.endef
_bfs:
LFB17:
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
	jmp	L15
L19:
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
	jmp	L16
L18:
	movl	-24(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L17
	movl	-20(%ebp), %eax
	movl	-424(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L17
	movl	-20(%ebp), %eax
	movl	$1, -424(%ebp,%eax,4)
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	-20(%ebp), %edx
	movl	%edx, -824(%ebp,%eax,4)
L17:
	addl	$1, -20(%ebp)
L16:
	movl	_vertices, %eax
	cmpl	%eax, -20(%ebp)
	jl	L18
L15:
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jl	L19
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
LFE17:
	.globl	_dfsUtil
	.def	_dfsUtil;	.scl	2;	.type	32;	.endef
_dfsUtil:
LFB18:
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
	jmp	L21
L23:
	movl	8(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L22
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L22
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_dfsUtil
L22:
	addl	$1, -12(%ebp)
L21:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L23
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC4:
	.ascii "DFS: \0"
	.text
	.globl	_dfs
	.def	_dfs;	.scl	2;	.type	32;	.endef
_dfs:
LFB19:
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
LFE19:
	.section .rdata,"dr"
LC5:
	.ascii "Dijkstra from %d:\12\0"
LC6:
	.ascii "To %d: %d\12\0"
	.text
	.globl	_dijkstra
	.def	_dijkstra;	.scl	2;	.type	32;	.endef
_dijkstra:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$856, %esp
	movl	$0, -12(%ebp)
	jmp	L26
L27:
	movl	-12(%ebp), %eax
	movl	$2147483647, -432(%ebp,%eax,4)
	movl	-12(%ebp), %eax
	movl	$0, -832(%ebp,%eax,4)
	addl	$1, -12(%ebp)
L26:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L27
	movl	8(%ebp), %eax
	movl	$0, -432(%ebp,%eax,4)
	movl	$0, -16(%ebp)
	jmp	L28
L36:
	movl	$-1, -20(%ebp)
	movl	$0, -24(%ebp)
	jmp	L29
L32:
	movl	-24(%ebp), %eax
	movl	-832(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L30
	cmpl	$-1, -20(%ebp)
	je	L31
	movl	-24(%ebp), %eax
	movl	-432(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	movl	-432(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L30
L31:
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L30:
	addl	$1, -24(%ebp)
L29:
	movl	_vertices, %eax
	cmpl	%eax, -24(%ebp)
	jl	L32
	movl	-20(%ebp), %eax
	movl	$1, -832(%ebp,%eax,4)
	movl	$0, -28(%ebp)
	jmp	L33
L35:
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L34
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
	jge	L34
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
L34:
	addl	$1, -28(%ebp)
L33:
	movl	_vertices, %eax
	cmpl	%eax, -28(%ebp)
	jl	L35
	addl	$1, -16(%ebp)
L28:
	movl	_vertices, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L36
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	$0, -32(%ebp)
	jmp	L37
L38:
	movl	-32(%ebp), %eax
	movl	-432(%ebp,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	addl	$1, -32(%ebp)
L37:
	movl	_vertices, %eax
	cmpl	%eax, -32(%ebp)
	jl	L38
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC7:
	.ascii "Bellman-Ford from %d:\12\0"
	.text
	.globl	_bellmanFord
	.def	_bellmanFord;	.scl	2;	.type	32;	.endef
_bellmanFord:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$456, %esp
	movl	$0, -12(%ebp)
	jmp	L40
L41:
	movl	-12(%ebp), %eax
	movl	$2147483647, -428(%ebp,%eax,4)
	addl	$1, -12(%ebp)
L40:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L41
	movl	8(%ebp), %eax
	movl	$0, -428(%ebp,%eax,4)
	movl	$0, -16(%ebp)
	jmp	L42
L48:
	movl	$0, -20(%ebp)
	jmp	L43
L47:
	movl	$0, -24(%ebp)
	jmp	L44
L46:
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L45
	movl	-20(%ebp), %eax
	movl	-428(%ebp,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L45
	movl	-20(%ebp), %eax
	movl	-428(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	imull	$100, %eax, %ecx
	movl	-24(%ebp), %eax
	addl	%ecx, %eax
	movl	_graph(,%eax,4), %eax
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	-428(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L45
	movl	-20(%ebp), %eax
	movl	-428(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	imull	$100, %eax, %ecx
	movl	-24(%ebp), %eax
	addl	%ecx, %eax
	movl	_graph(,%eax,4), %eax
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%edx, -428(%ebp,%eax,4)
L45:
	addl	$1, -24(%ebp)
L44:
	movl	_vertices, %eax
	cmpl	%eax, -24(%ebp)
	jl	L46
	addl	$1, -20(%ebp)
L43:
	movl	_vertices, %eax
	cmpl	%eax, -20(%ebp)
	jl	L47
	addl	$1, -16(%ebp)
L42:
	movl	_vertices, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L48
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	$0, -28(%ebp)
	jmp	L49
L50:
	movl	-28(%ebp), %eax
	movl	-428(%ebp,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	addl	$1, -28(%ebp)
L49:
	movl	_vertices, %eax
	cmpl	%eax, -28(%ebp)
	jl	L50
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
	.align 4
LC8:
	.ascii "Floyd-Warshall All-Pairs Shortest Paths:\0"
	.text
	.globl	_floydWarshall
	.def	_floydWarshall;	.scl	2;	.type	32;	.endef
_floydWarshall:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$40056, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	movl	$0, -12(%ebp)
	jmp	L52
L55:
	movl	$0, -16(%ebp)
	jmp	L53
L54:
	movl	-12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	movl	-12(%ebp), %edx
	imull	$100, %edx, %ecx
	movl	-16(%ebp), %edx
	addl	%ecx, %edx
	movl	%eax, -40036(%ebp,%edx,4)
	addl	$1, -16(%ebp)
L53:
	movl	_vertices, %eax
	cmpl	%eax, -16(%ebp)
	jl	L54
	addl	$1, -12(%ebp)
L52:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L55
	movl	$0, -20(%ebp)
	jmp	L56
L62:
	movl	$0, -24(%ebp)
	jmp	L57
L61:
	movl	$0, -28(%ebp)
	jmp	L58
L60:
	movl	-24(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	-40036(%ebp,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L59
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	-40036(%ebp,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L59
	movl	-24(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	-40036(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	imull	$100, %eax, %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movl	-40036(%ebp,%eax,4), %eax
	leal	(%edx,%eax), %ecx
	movl	-24(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	-40036(%ebp,%eax,4), %eax
	cmpl	%eax, %ecx
	jge	L59
	movl	-24(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	-40036(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	imull	$100, %eax, %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movl	-40036(%ebp,%eax,4), %eax
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	imull	$100, %eax, %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movl	%edx, -40036(%ebp,%eax,4)
L59:
	addl	$1, -28(%ebp)
L58:
	movl	_vertices, %eax
	cmpl	%eax, -28(%ebp)
	jl	L60
	addl	$1, -24(%ebp)
L57:
	movl	_vertices, %eax
	cmpl	%eax, -24(%ebp)
	jl	L61
	addl	$1, -20(%ebp)
L56:
	movl	_vertices, %eax
	cmpl	%eax, -20(%ebp)
	jl	L62
	movl	$LC8, (%esp)
	call	_puts
	movl	$0, -32(%ebp)
	jmp	L63
L68:
	movl	$0, -36(%ebp)
	jmp	L64
L67:
	movl	-32(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	-40036(%ebp,%eax,4), %eax
	cmpl	$2147483647, %eax
	jne	L65
	movl	$LC1, (%esp)
	call	_printf
	jmp	L66
L65:
	movl	-32(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	-40036(%ebp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
L66:
	addl	$1, -36(%ebp)
L64:
	movl	_vertices, %eax
	cmpl	%eax, -36(%ebp)
	jl	L67
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -32(%ebp)
L63:
	movl	_vertices, %eax
	cmpl	%eax, -32(%ebp)
	jl	L68
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC9:
	.ascii "Prim\342\200\231s MST:\0"
LC10:
	.ascii "%d - %d : %d\12\0"
	.text
	.globl	_prims
	.def	_prims;	.scl	2;	.type	32;	.endef
_prims:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$1256, %esp
	movl	$0, -12(%ebp)
	jmp	L70
L71:
	movl	-12(%ebp), %eax
	movl	$2147483647, -832(%ebp,%eax,4)
	movl	-12(%ebp), %eax
	movl	$0, -1232(%ebp,%eax,4)
	addl	$1, -12(%ebp)
L70:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L71
	movl	$0, -832(%ebp)
	movl	$-1, -432(%ebp)
	movl	$0, -16(%ebp)
	jmp	L72
L80:
	movl	$-1, -20(%ebp)
	movl	$0, -24(%ebp)
	jmp	L73
L76:
	movl	-24(%ebp), %eax
	movl	-1232(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L74
	cmpl	$-1, -20(%ebp)
	je	L75
	movl	-24(%ebp), %eax
	movl	-832(%ebp,%eax,4), %edx
	movl	-20(%ebp), %eax
	movl	-832(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L74
L75:
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L74:
	addl	$1, -24(%ebp)
L73:
	movl	_vertices, %eax
	cmpl	%eax, -24(%ebp)
	jl	L76
	movl	-20(%ebp), %eax
	movl	$1, -1232(%ebp,%eax,4)
	movl	$0, -28(%ebp)
	jmp	L77
L79:
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L78
	movl	-28(%ebp), %eax
	movl	-1232(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L78
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %edx
	movl	-28(%ebp), %eax
	movl	-832(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L78
	movl	-28(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, -432(%ebp,%eax,4)
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %edx
	movl	-28(%ebp), %eax
	movl	%edx, -832(%ebp,%eax,4)
L78:
	addl	$1, -28(%ebp)
L77:
	movl	_vertices, %eax
	cmpl	%eax, -28(%ebp)
	jl	L79
	addl	$1, -16(%ebp)
L72:
	movl	_vertices, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L80
	movl	$LC9, (%esp)
	call	_puts
	movl	$1, -32(%ebp)
	jmp	L81
L82:
	movl	-32(%ebp), %eax
	movl	-432(%ebp,%eax,4), %eax
	movl	-32(%ebp), %edx
	imull	$100, %edx, %edx
	addl	%edx, %eax
	movl	_graph(,%eax,4), %edx
	movl	-32(%ebp), %eax
	movl	-432(%ebp,%eax,4), %eax
	movl	%edx, 12(%esp)
	movl	-32(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	addl	$1, -32(%ebp)
L81:
	movl	_vertices, %eax
	cmpl	%eax, -32(%ebp)
	jl	L82
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.comm	_edges, 120000, 5
	.globl	_edgeCount
	.bss
	.align 4
_edgeCount:
	.space 4
	.comm	_parent, 400, 5
	.text
	.globl	_find
	.def	_find;	.scl	2;	.type	32;	.endef
_find:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	_parent(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	jne	L84
	movl	8(%ebp), %eax
	jmp	L85
L84:
	movl	8(%ebp), %eax
	movl	_parent(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_find
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, _parent(,%eax,4)
	movl	8(%ebp), %eax
	movl	_parent(,%eax,4), %eax
L85:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_unionSet
	.def	_unionSet;	.scl	2;	.type	32;	.endef
_unionSet:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_find
	movl	%eax, %ebx
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_find
	movl	%eax, _parent(,%ebx,4)
	nop
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC11:
	.ascii "Kruskal\342\200\231s MST:\0"
	.text
	.globl	_kruskal
	.def	_kruskal;	.scl	2;	.type	32;	.endef
_kruskal:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	movl	$0, _edgeCount
	movl	$0, -12(%ebp)
	jmp	L88
L92:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	L89
L91:
	movl	-12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_graph(,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L90
	movl	_edgeCount, %eax
	leal	1(%eax), %edx
	movl	%edx, _edgeCount
	movl	-12(%ebp), %edx
	imull	$100, %edx, %ecx
	movl	-16(%ebp), %edx
	addl	%ecx, %edx
	movl	_graph(,%edx,4), %ecx
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	sall	$2, %edx
	leal	_edges(%edx), %ebx
	movl	-12(%ebp), %edx
	movl	%edx, (%ebx)
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	sall	$2, %edx
	leal	_edges+4(%edx), %ebx
	movl	-16(%ebp), %edx
	movl	%edx, (%ebx)
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	leal	0(,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	$_edges+8, %eax
	movl	%ecx, (%eax)
L90:
	addl	$1, -16(%ebp)
L89:
	movl	_vertices, %eax
	cmpl	%eax, -16(%ebp)
	jl	L91
	addl	$1, -12(%ebp)
L88:
	movl	_vertices, %eax
	cmpl	%eax, -12(%ebp)
	jl	L92
	movl	$0, -20(%ebp)
	jmp	L93
L97:
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	L94
L96:
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_edges+8, %eax
	movl	(%eax), %ecx
	movl	-24(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_edges+8, %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jle	L95
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_edges, %eax
	movl	(%eax), %edx
	movl	%edx, -52(%ebp)
	movl	4(%eax), %edx
	movl	%edx, -48(%ebp)
	movl	8(%eax), %eax
	movl	%eax, -44(%ebp)
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	_edges(%eax), %edx
	movl	-24(%ebp), %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	$_edges, %eax
	movl	(%eax), %ecx
	movl	%ecx, (%edx)
	movl	4(%eax), %ecx
	movl	%ecx, 4(%edx)
	movl	8(%eax), %eax
	movl	%eax, 8(%edx)
	movl	-24(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_edges, %eax
	movl	-52(%ebp), %edx
	movl	%edx, (%eax)
	movl	-48(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-44(%ebp), %edx
	movl	%edx, 8(%eax)
L95:
	addl	$1, -24(%ebp)
L94:
	movl	_edgeCount, %eax
	cmpl	%eax, -24(%ebp)
	jl	L96
	addl	$1, -20(%ebp)
L93:
	movl	_edgeCount, %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jg	L97
	movl	$0, -28(%ebp)
	jmp	L98
L99:
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, _parent(,%eax,4)
	addl	$1, -28(%ebp)
L98:
	movl	_vertices, %eax
	cmpl	%eax, -28(%ebp)
	jl	L99
	movl	$LC11, (%esp)
	call	_puts
	movl	$0, -32(%ebp)
	jmp	L100
L102:
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_edges, %eax
	movl	(%eax), %eax
	movl	%eax, -36(%ebp)
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_edges+4, %eax
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_find
	movl	%eax, %ebx
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_find
	cmpl	%eax, %ebx
	je	L101
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_edges+8, %eax
	movl	(%eax), %eax
	movl	%eax, 12(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	movl	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_unionSet
L101:
	addl	$1, -32(%ebp)
L100:
	movl	_edgeCount, %eax
	cmpl	%eax, -32(%ebp)
	jl	L102
	nop
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
	.align 4
LC12:
	.ascii "\12--- Graph Algorithms Toolkit ---\0"
LC13:
	.ascii "1. Print Graph\0"
LC14:
	.ascii "2. BFS\0"
LC15:
	.ascii "3. DFS\0"
LC16:
	.ascii "4. Dijkstra\0"
LC17:
	.ascii "5. Bellman-Ford\0"
LC18:
	.ascii "6. Floyd-Warshall\0"
LC19:
	.ascii "7. Prim\342\200\231s MST\0"
LC20:
	.ascii "8. Kruskal\342\200\231s MST\0"
LC21:
	.ascii "0. Exit\0"
LC22:
	.ascii "Enter choice: \0"
LC23:
	.ascii "%d\0"
LC24:
	.ascii "Exiting...\0"
LC25:
	.ascii "Invalid choice!\0"
	.text
	.globl	_menu
	.def	_menu;	.scl	2;	.type	32;	.endef
_menu:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
L116:
	movl	$LC12, (%esp)
	call	_puts
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	movl	$LC15, (%esp)
	call	_puts
	movl	$LC16, (%esp)
	call	_puts
	movl	$LC17, (%esp)
	call	_puts
	movl	$LC18, (%esp)
	call	_puts
	movl	$LC19, (%esp)
	call	_puts
	movl	$LC20, (%esp)
	call	_puts
	movl	$LC21, (%esp)
	call	_puts
	movl	$LC22, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC23, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	cmpl	$8, %eax
	ja	L104
	movl	L106(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L106:
	.long	L105
	.long	L107
	.long	L108
	.long	L109
	.long	L110
	.long	L111
	.long	L112
	.long	L113
	.long	L114
	.text
L107:
	call	_printGraph
	jmp	L115
L108:
	movl	$0, (%esp)
	call	_bfs
	jmp	L115
L109:
	movl	$0, (%esp)
	call	_dfs
	jmp	L115
L110:
	movl	$0, (%esp)
	call	_dijkstra
	jmp	L115
L111:
	movl	$0, (%esp)
	call	_bellmanFord
	jmp	L115
L112:
	call	_floydWarshall
	jmp	L115
L113:
	call	_prims
	jmp	L115
L114:
	call	_kruskal
	jmp	L115
L105:
	movl	$LC24, (%esp)
	call	_puts
	jmp	L115
L104:
	movl	$LC25, (%esp)
	call	_puts
L115:
	movl	-12(%ebp), %eax
	testl	%eax, %eax
	jne	L116
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$5, (%esp)
	call	_initGraph
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
	call	_menu
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
