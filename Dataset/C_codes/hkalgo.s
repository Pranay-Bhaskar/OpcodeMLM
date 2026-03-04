	.file	"hkalgo.c"
	.comm	_U, 4, 2
	.comm	_V, 4, 2
	.comm	_adj, 40000, 5
	.comm	_pairU, 400, 5
	.comm	_pairV, 400, 5
	.comm	_dist, 400, 5
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
	subl	$440, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	$1, -12(%ebp)
	jmp	L2
L5:
	movl	-12(%ebp), %eax
	movl	_pairU(,%eax,4), %eax
	testl	%eax, %eax
	jne	L3
	movl	-12(%ebp), %eax
	movl	$0, _dist(,%eax,4)
	movl	-8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -8(%ebp)
	movl	-12(%ebp), %edx
	movl	%edx, -424(%ebp,%eax,4)
	jmp	L4
L3:
	movl	-12(%ebp), %eax
	movl	$1000000000, _dist(,%eax,4)
L4:
	addl	$1, -12(%ebp)
L2:
	movl	_U, %eax
	cmpl	%eax, -12(%ebp)
	jle	L5
	movl	$0, -16(%ebp)
	jmp	L6
L12:
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	-424(%ebp,%eax,4), %eax
	movl	%eax, -24(%ebp)
	movl	$1, -20(%ebp)
	jmp	L7
L11:
	movl	-24(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	_adj(,%eax,4), %eax
	testl	%eax, %eax
	je	L8
	movl	-20(%ebp), %eax
	movl	_pairV(,%eax,4), %eax
	testl	%eax, %eax
	jne	L9
	movl	$1, -16(%ebp)
	jmp	L8
L9:
	movl	-20(%ebp), %eax
	movl	_pairV(,%eax,4), %eax
	movl	_dist(,%eax,4), %eax
	movl	%eax, -436(%ebp)
	fildl	-436(%ebp)
	fldl	LC0
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L15
	fldl	LC0
	fucompp
	fnstsw	%ax
	sahf
	jne	L8
	movl	-20(%ebp), %eax
	movl	_pairV(,%eax,4), %eax
	movl	-24(%ebp), %edx
	movl	_dist(,%edx,4), %edx
	addl	$1, %edx
	movl	%edx, _dist(,%eax,4)
	movl	-8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -8(%ebp)
	movl	-20(%ebp), %edx
	movl	_pairV(,%edx,4), %edx
	movl	%edx, -424(%ebp,%eax,4)
	jmp	L8
L15:
	fstp	%st(0)
L8:
	addl	$1, -20(%ebp)
L7:
	movl	_V, %eax
	cmpl	%eax, -20(%ebp)
	jle	L11
L6:
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jl	L12
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
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
	subl	$40, %esp
	movl	$1, -12(%ebp)
	jmp	L17
L21:
	movl	8(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	_adj(,%eax,4), %eax
	testl	%eax, %eax
	je	L18
	movl	-12(%ebp), %eax
	movl	_pairV(,%eax,4), %eax
	testl	%eax, %eax
	je	L19
	movl	-12(%ebp), %eax
	movl	_pairV(,%eax,4), %eax
	movl	_dist(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	_dist(,%eax,4), %eax
	addl	$1, %eax
	cmpl	%eax, %edx
	jne	L18
	movl	-12(%ebp), %eax
	movl	_pairV(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_dfs
	testl	%eax, %eax
	je	L18
L19:
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, _pairU(,%eax,4)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, _pairV(,%eax,4)
	movl	$1, %eax
	jmp	L20
L18:
	addl	$1, -12(%ebp)
L17:
	movl	_V, %eax
	cmpl	%eax, -12(%ebp)
	jle	L21
	movl	8(%ebp), %eax
	movl	$1000000000, _dist(,%eax,4)
	movl	$0, %eax
L20:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_hopcroftKarp
	.def	_hopcroftKarp;	.scl	2;	.type	32;	.endef
_hopcroftKarp:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$1, -12(%ebp)
	jmp	L23
L24:
	movl	-12(%ebp), %eax
	movl	$0, _pairU(,%eax,4)
	addl	$1, -12(%ebp)
L23:
	movl	_U, %eax
	cmpl	%eax, -12(%ebp)
	jle	L24
	movl	$1, -16(%ebp)
	jmp	L25
L26:
	movl	-16(%ebp), %eax
	movl	$0, _pairV(,%eax,4)
	addl	$1, -16(%ebp)
L25:
	movl	_V, %eax
	cmpl	%eax, -16(%ebp)
	jle	L26
	movl	$0, -20(%ebp)
	jmp	L27
L31:
	movl	$1, -24(%ebp)
	jmp	L28
L30:
	movl	-24(%ebp), %eax
	movl	_pairU(,%eax,4), %eax
	testl	%eax, %eax
	jne	L29
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_dfs
	testl	%eax, %eax
	je	L29
	addl	$1, -20(%ebp)
L29:
	addl	$1, -24(%ebp)
L28:
	movl	_U, %eax
	cmpl	%eax, -24(%ebp)
	jle	L30
L27:
	call	_bfs
	testl	%eax, %eax
	jne	L31
	movl	-20(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC2:
	.ascii "\12Maximum Matching:\0"
LC3:
	.ascii "U%d - V%d\12\0"
	.text
	.globl	_printMatching
	.def	_printMatching;	.scl	2;	.type	32;	.endef
_printMatching:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC2, (%esp)
	call	_puts
	movl	$1, -12(%ebp)
	jmp	L34
L36:
	movl	-12(%ebp), %eax
	movl	_pairU(,%eax,4), %eax
	testl	%eax, %eax
	je	L35
	movl	-12(%ebp), %eax
	movl	_pairU(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L35:
	addl	$1, -12(%ebp)
L34:
	movl	_U, %eax
	cmpl	%eax, -12(%ebp)
	jle	L36
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC4:
	.ascii "\12--- Hopcroft-Karp Bipartite Matching ---\0"
LC5:
	.ascii "1. Enter Graph\0"
LC6:
	.ascii "2. Run Hopcroft-Karp\0"
LC7:
	.ascii "3. Print Matching\0"
LC8:
	.ascii "0. Exit\0"
LC9:
	.ascii "Choice: \0"
LC10:
	.ascii "%d\0"
	.align 4
LC11:
	.ascii "Enter number of vertices in U and V: \0"
LC12:
	.ascii "%d %d\0"
LC13:
	.ascii "Enter number of edges: \0"
LC14:
	.ascii "Enter edges (u v):\0"
LC15:
	.ascii "Maximum Matching Size = %d\12\0"
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
	subl	$56, %esp
L47:
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_puts
	movl	$LC6, (%esp)
	call	_puts
	movl	$LC7, (%esp)
	call	_puts
	movl	$LC8, (%esp)
	call	_puts
	movl	$LC9, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	-20(%ebp), %eax
	cmpl	$1, %eax
	je	L39
	cmpl	$1, %eax
	jg	L40
	testl	%eax, %eax
	je	L41
	jmp	L38
L40:
	cmpl	$2, %eax
	je	L42
	cmpl	$3, %eax
	je	L43
	jmp	L38
L39:
	movl	$LC11, (%esp)
	call	_printf
	movl	$_V, 8(%esp)
	movl	$_U, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	$40000, 8(%esp)
	movl	$0, 4(%esp)
	movl	$_adj, (%esp)
	call	_memset
	movl	$LC13, (%esp)
	call	_printf
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	$LC14, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L44
L45:
	leal	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	-28(%ebp), %edx
	movl	-32(%ebp), %eax
	imull	$100, %edx, %edx
	addl	%edx, %eax
	movl	$1, _adj(,%eax,4)
	addl	$1, -12(%ebp)
L44:
	movl	-24(%ebp), %eax
	cmpl	%eax, -12(%ebp)
	jl	L45
	nop
	jmp	L46
L42:
	call	_hopcroftKarp
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	jmp	L46
L43:
	call	_printMatching
	jmp	L46
L41:
	movl	$LC16, (%esp)
	call	_puts
	jmp	L46
L38:
	movl	$LC17, (%esp)
	call	_puts
L46:
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	jne	L47
	nop
	leave
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
	.section .rdata,"dr"
	.align 8
LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
