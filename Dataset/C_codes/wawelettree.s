	.file	"wawelettree.c"
	.text
	.globl	_build
	.def	_build;	.scl	2;	.type	32;	.endef
_build:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	cmpl	20(%ebp), %eax
	je	L2
	cmpl	$0, 12(%ebp)
	jne	L3
L2:
	movl	$0, %eax
	jmp	L4
L3:
	movl	$24, (%esp)
	call	_malloc
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, (%eax)
	movl	-24(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-24(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	12(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	movl	$0, (%eax)
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -28(%ebp)
	movl	12(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -32(%ebp)
	movl	12(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -36(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	jmp	L5
L8:
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	-28(%ebp), %eax
	jg	L6
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	movl	-20(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	movl	-20(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movl	%eax, (%edx)
	jmp	L7
L6:
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	movl	-20(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	movl	-20(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
L7:
	addl	$1, -20(%ebp)
L5:
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L8
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_build
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%edx, 16(%eax)
	movl	-28(%ebp), %eax
	leal	1(%eax), %edx
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%edx, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_build
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%edx, 20(%eax)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-24(%ebp), %eax
L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_rank
	.def	_rank;	.scl	2;	.type	32;	.endef
_rank:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	je	L10
	cmpl	$0, 16(%ebp)
	jg	L11
L10:
	movl	$0, %eax
	jmp	L12
L11:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L13
	movl	16(%ebp), %eax
	jmp	L12
L13:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jg	L14
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_rank
	jmp	L12
L14:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	16(%ebp), %edx
	subl	%eax, %edx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_rank
L12:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_select
	.def	_select;	.scl	2;	.type	32;	.endef
_select:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L16
	movl	$-1, %eax
	jmp	L17
L16:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L18
	movl	16(%ebp), %eax
	jmp	L17
L18:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jg	L19
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_select
	jmp	L17
L19:
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_select
L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_rangeCount
	.def	_rangeCount;	.scl	2;	.type	32;	.endef
_rangeCount:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	cmpl	$0, 8(%ebp)
	je	L21
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jg	L21
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	24(%ebp), %eax
	jg	L21
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	20(%ebp), %eax
	jge	L22
L21:
	movl	$0, %eax
	jmp	L23
L22:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	20(%ebp), %eax
	jl	L24
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	24(%ebp), %eax
	jg	L24
	movl	16(%ebp), %eax
	subl	12(%ebp), %eax
	addl	$1, %eax
	jmp	L23
L24:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	addl	$1073741823, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	addl	$1073741823, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	16(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	24(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	20(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	-16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_rangeCount
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	24(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	20(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	-24(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_rangeCount
	addl	%ebx, %eax
L23:
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC0:
	.ascii "  \0"
LC1:
	.ascii "Node [%d,%d], size=%d\12\0"
	.text
	.globl	_printTree
	.def	_printTree;	.scl	2;	.type	32;	.endef
_printTree:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	je	L30
	movl	$0, -12(%ebp)
	jmp	L28
L29:
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L28:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L29
	movl	8(%ebp), %eax
	movl	12(%eax), %ecx
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_printTree
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_printTree
	jmp	L25
L30:
	nop
L25:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC2:
	.ascii "\12--- Wavelet Tree Toolkit ---\0"
LC3:
	.ascii "1. Build Tree\0"
LC4:
	.ascii "2. Rank Query\0"
LC5:
	.ascii "3. Select Query\0"
LC6:
	.ascii "4. Range Count Query\0"
LC7:
	.ascii "5. Print Tree\0"
LC8:
	.ascii "0. Exit\0"
LC9:
	.ascii "Choice: \0"
LC10:
	.ascii "%d\0"
LC11:
	.ascii "Enter size of array: \0"
LC12:
	.ascii "Enter elements:\0"
LC13:
	.ascii "Wavelet Tree built.\0"
	.align 4
LC14:
	.ascii "Enter character (int) and index: \0"
LC15:
	.ascii "%d %d\0"
LC16:
	.ascii "Rank(%d,%d) = %d\12\0"
LC17:
	.ascii "Enter character (int) and k: \0"
LC18:
	.ascii "Select(%d,%d) = %d\12\0"
LC19:
	.ascii "Enter l r a b: \0"
LC20:
	.ascii "%d %d %d %d\0"
	.align 4
LC21:
	.ascii "RangeCount([%d,%d],[%d,%d]) = %d\12\0"
LC22:
	.ascii "Exiting...\0"
LC23:
	.ascii "Invalid choice!\0"
	.text
	.globl	_menu
	.def	_menu;	.scl	2;	.type	32;	.endef
_menu:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	movl	$4096, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	$0, -12(%ebp)
L45:
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
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
	leal	-4032(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	-4032(%ebp), %eax
	cmpl	$5, %eax
	ja	L32
	movl	L34(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L34:
	.long	L33
	.long	L35
	.long	L36
	.long	L37
	.long	L38
	.long	L39
	.text
L35:
	movl	$LC11, (%esp)
	call	_printf
	leal	-4028(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	$LC12, (%esp)
	call	_puts
	movl	$1000000000, -16(%ebp)
	movl	$-1000000000, -20(%ebp)
	movl	$0, -24(%ebp)
	jmp	L40
L43:
	leal	-4024(%ebp), %eax
	movl	-24(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	-24(%ebp), %eax
	movl	-4024(%ebp,%eax,4), %eax
	cmpl	-16(%ebp), %eax
	jge	L41
	movl	-24(%ebp), %eax
	movl	-4024(%ebp,%eax,4), %eax
	movl	%eax, -16(%ebp)
L41:
	movl	-24(%ebp), %eax
	movl	-4024(%ebp,%eax,4), %eax
	cmpl	-20(%ebp), %eax
	jle	L42
	movl	-24(%ebp), %eax
	movl	-4024(%ebp,%eax,4), %eax
	movl	%eax, -20(%ebp)
L42:
	addl	$1, -24(%ebp)
L40:
	movl	-4028(%ebp), %eax
	cmpl	%eax, -24(%ebp)
	jl	L43
	movl	-4028(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	-16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	leal	-4024(%ebp), %eax
	movl	%eax, (%esp)
	call	_build
	movl	%eax, -12(%ebp)
	movl	$LC13, (%esp)
	call	_puts
	jmp	L44
L36:
	movl	$LC14, (%esp)
	call	_printf
	leal	-4040(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-4036(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_scanf
	movl	-4040(%ebp), %edx
	movl	-4036(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_rank
	movl	%eax, %ecx
	movl	-4040(%ebp), %edx
	movl	-4036(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	nop
	jmp	L44
L37:
	movl	$LC17, (%esp)
	call	_printf
	leal	-4048(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-4044(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_scanf
	movl	-4048(%ebp), %edx
	movl	-4044(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_select
	movl	%eax, %ecx
	movl	-4048(%ebp), %edx
	movl	-4044(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	nop
	jmp	L44
L38:
	movl	$LC19, (%esp)
	call	_printf
	leal	-4064(%ebp), %eax
	movl	%eax, 16(%esp)
	leal	-4060(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-4056(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-4052(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_scanf
	movl	-4064(%ebp), %ebx
	movl	-4060(%ebp), %ecx
	movl	-4056(%ebp), %edx
	movl	-4052(%ebp), %eax
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_rangeCount
	movl	%eax, %esi
	movl	-4064(%ebp), %ebx
	movl	-4060(%ebp), %ecx
	movl	-4056(%ebp), %edx
	movl	-4052(%ebp), %eax
	movl	%esi, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	nop
	jmp	L44
L39:
	movl	$0, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_printTree
	jmp	L44
L33:
	movl	$LC22, (%esp)
	call	_puts
	jmp	L44
L32:
	movl	$LC23, (%esp)
	call	_puts
L44:
	movl	-4032(%ebp), %eax
	testl	%eax, %eax
	jne	L45
	nop
	addl	$4096, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB23:
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
LFE23:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
