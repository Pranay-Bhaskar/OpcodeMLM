	.file	"dancinglinks.c"
	.comm	_head, 20, 2
	.comm	_columns, 400, 5
	.globl	_colCount
	.bss
	.align 4
_colCount:
	.space 4
	.text
	.globl	_cover
	.def	_cover;	.scl	2;	.type	32;	.endef
_cover:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	8(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%ebp), %edx
	movl	4(%edx), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	L2
L5:
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -8(%ebp)
	jmp	L3
L4:
	movl	-8(%ebp), %eax
	movl	12(%eax), %eax
	movl	-8(%ebp), %edx
	movl	8(%edx), %edx
	movl	%edx, 8(%eax)
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-8(%ebp), %edx
	movl	12(%edx), %edx
	movl	%edx, 12(%eax)
	movl	-8(%ebp), %eax
	movl	16(%eax), %eax
	movl	20(%eax), %edx
	subl	$1, %edx
	movl	%edx, 20(%eax)
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -8(%ebp)
L3:
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jne	L4
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -4(%ebp)
L2:
	movl	8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jne	L5
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_uncover
	.def	_uncover;	.scl	2;	.type	32;	.endef
_uncover:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	L7
L10:
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
	jmp	L8
L9:
	movl	-8(%ebp), %eax
	movl	16(%eax), %eax
	movl	20(%eax), %edx
	addl	$1, %edx
	movl	%edx, 20(%eax)
	movl	-8(%ebp), %eax
	movl	12(%eax), %eax
	movl	-8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-8(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
L8:
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jne	L9
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4(%ebp)
L7:
	movl	8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jne	L10
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_chooseColumn
	.def	_chooseColumn;	.scl	2;	.type	32;	.endef
_chooseColumn:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$999999, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	_head+4, %eax
	movl	%eax, -12(%ebp)
	jmp	L12
L14:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	20(%eax), %eax
	cmpl	-4(%ebp), %eax
	jge	L13
	movl	-16(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -8(%ebp)
L13:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
L12:
	cmpl	$_head, -12(%ebp)
	jne	L14
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.comm	_solution, 400, 5
	.globl	_solCount
	.bss
	.align 4
_solCount:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "Solution found with %d rows:\12\0"
LC1:
	.ascii "Row %d chosen\12\0"
	.text
	.globl	_search
	.def	_search;	.scl	2;	.type	32;	.endef
_search:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	_head+4, %eax
	cmpl	$_head, %eax
	jne	L17
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L18
L19:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L18:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L19
	jmp	L16
L17:
	call	_chooseColumn
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_cover
	movl	-28(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L21
L26:
	movl	8(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, _solution(,%eax,4)
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -20(%ebp)
	jmp	L22
L23:
	movl	-20(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_cover
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -20(%ebp)
L22:
	movl	-20(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jne	L23
	movl	8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	call	_search
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	jmp	L24
L25:
	movl	-24(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	_uncover
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
L24:
	movl	-24(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jne	L25
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -16(%ebp)
L21:
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jne	L26
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_uncover
L16:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC2:
	.ascii "C%d\0"
	.text
	.globl	_setupExample
	.def	_setupExample;	.scl	2;	.type	32;	.endef
_setupExample:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	movl	$3, _colCount
	movl	$0, -12(%ebp)
	jmp	L28
L29:
	movl	$36, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, _columns(,%eax,4)
	movl	-12(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	$0, 20(%eax)
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	-12(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	addl	$24, %eax
	movl	%edx, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_sprintf
	movl	-12(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	-12(%ebp), %edx
	movl	_columns(,%edx,4), %edx
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	movl	_columns(,%eax,4), %edx
	movl	-12(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	-12(%ebp), %ecx
	movl	_columns(,%ecx,4), %ecx
	movl	%ecx, 12(%eax)
	movl	12(%eax), %eax
	movl	%eax, 8(%edx)
	addl	$1, -12(%ebp)
L28:
	movl	_colCount, %eax
	cmpl	%eax, -12(%ebp)
	jl	L29
	movl	_columns, %eax
	movl	%eax, _head+4
	movl	_colCount, %eax
	subl	$1, %eax
	movl	_columns(,%eax,4), %eax
	movl	%eax, _head
	movl	_columns, %eax
	movl	$_head, (%eax)
	movl	_colCount, %eax
	subl	$1, %eax
	movl	_columns(,%eax,4), %eax
	movl	$_head, 4(%eax)
	movl	$0, -16(%ebp)
	jmp	L30
L31:
	movl	-16(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	-16(%ebp), %edx
	addl	$1, %edx
	movl	_columns(,%edx,4), %edx
	movl	%edx, 4(%eax)
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	_columns(,%eax,4), %eax
	movl	-16(%ebp), %edx
	movl	_columns(,%edx,4), %edx
	movl	%edx, (%eax)
	addl	$1, -16(%ebp)
L30:
	movl	_colCount, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L31
	movl	$1, -84(%ebp)
	movl	$0, -80(%ebp)
	movl	$1, -76(%ebp)
	movl	$1, -72(%ebp)
	movl	$1, -68(%ebp)
	movl	$0, -64(%ebp)
	movl	$0, -60(%ebp)
	movl	$1, -56(%ebp)
	movl	$1, -52(%ebp)
	movl	$1, -48(%ebp)
	movl	$0, -44(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -20(%ebp)
	jmp	L32
L39:
	movl	$0, -24(%ebp)
	movl	$0, -28(%ebp)
	movl	$0, -32(%ebp)
	jmp	L33
L37:
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	-32(%ebp), %edx
	addl	%edx, %eax
	movl	-84(%ebp,%eax,4), %eax
	testl	%eax, %eax
	je	L34
	movl	$20, (%esp)
	call	_malloc
	movl	%eax, -36(%ebp)
	movl	-32(%ebp), %eax
	movl	_columns(,%eax,4), %edx
	movl	-36(%ebp), %eax
	movl	%edx, 16(%eax)
	movl	-32(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-32(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	8(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-32(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	8(%eax), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-32(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-32(%ebp), %eax
	movl	_columns(,%eax,4), %eax
	movl	20(%eax), %edx
	addl	$1, %edx
	movl	%edx, 20(%eax)
	cmpl	$0, -24(%ebp)
	jne	L35
	movl	-36(%ebp), %eax
	movl	%eax, -24(%ebp)
L35:
	cmpl	$0, -28(%ebp)
	je	L36
	movl	-28(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-36(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, (%eax)
L36:
	movl	-36(%ebp), %eax
	movl	%eax, -28(%ebp)
L34:
	addl	$1, -32(%ebp)
L33:
	movl	_colCount, %eax
	cmpl	%eax, -32(%ebp)
	jl	L37
	cmpl	$0, -24(%ebp)
	je	L38
	cmpl	$0, -28(%ebp)
	je	L38
	movl	-24(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, (%eax)
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 4(%eax)
L38:
	addl	$1, -20(%ebp)
L32:
	cmpl	$3, -20(%ebp)
	jle	L39
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	call	_setupExample
	movl	$0, (%esp)
	call	_search
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_sprintf;	.scl	2;	.type	32;	.endef
