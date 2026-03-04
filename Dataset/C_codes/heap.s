	.file	"heap.c"
	.comm	_heap, 400, 5
	.globl	_size
	.bss
	.align 4
_size:
	.space 4
	.text
	.globl	_insert
	.def	_insert;	.scl	2;	.type	32;	.endef
_insert:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	_size, %eax
	leal	1(%eax), %edx
	movl	%edx, _size
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, _heap(,%eax,4)
	jmp	L2
L4:
	movl	-4(%ebp), %eax
	movl	_heap(,%eax,4), %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	_heap(,%eax,4), %edx
	movl	-4(%ebp), %eax
	movl	%edx, _heap(,%eax,4)
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	%eax, _heap(,%edx,4)
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%ebp)
L2:
	cmpl	$0, -4(%ebp)
	je	L5
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	_heap(,%eax,4), %edx
	movl	-4(%ebp), %eax
	movl	_heap(,%eax,4), %eax
	cmpl	%eax, %edx
	jl	L4
L5:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_extractMax
	.def	_extractMax;	.scl	2;	.type	32;	.endef
_extractMax:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	_size, %eax
	testl	%eax, %eax
	jg	L7
	movl	$-1, %eax
	jmp	L8
L7:
	movl	_heap, %eax
	movl	%eax, -12(%ebp)
	movl	_size, %eax
	subl	$1, %eax
	movl	%eax, _size
	movl	_size, %eax
	movl	_heap(,%eax,4), %eax
	movl	%eax, _heap
	movl	$0, -4(%ebp)
L14:
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	movl	-4(%ebp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -20(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	_size, %eax
	cmpl	%eax, -16(%ebp)
	jge	L9
	movl	-16(%ebp), %eax
	movl	_heap(,%eax,4), %edx
	movl	-8(%ebp), %eax
	movl	_heap(,%eax,4), %eax
	cmpl	%eax, %edx
	jle	L9
	movl	-16(%ebp), %eax
	movl	%eax, -8(%ebp)
L9:
	movl	_size, %eax
	cmpl	%eax, -20(%ebp)
	jge	L10
	movl	-20(%ebp), %eax
	movl	_heap(,%eax,4), %edx
	movl	-8(%ebp), %eax
	movl	_heap(,%eax,4), %eax
	cmpl	%eax, %edx
	jle	L10
	movl	-20(%ebp), %eax
	movl	%eax, -8(%ebp)
L10:
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	je	L15
	movl	-4(%ebp), %eax
	movl	_heap(,%eax,4), %eax
	movl	%eax, -24(%ebp)
	movl	-8(%ebp), %eax
	movl	_heap(,%eax,4), %edx
	movl	-4(%ebp), %eax
	movl	%edx, _heap(,%eax,4)
	movl	-8(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, _heap(,%eax,4)
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	L14
L15:
	nop
	movl	-12(%ebp), %eax
L8:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
