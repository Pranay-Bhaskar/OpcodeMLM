	.file	"unionfind.c"
	.comm	_parent, 40, 5
	.comm	_rankArr, 40, 5
	.text
	.globl	_makeSet
	.def	_makeSet;	.scl	2;	.type	32;	.endef
_makeSet:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L3:
	movl	-4(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, _parent(,%eax,4)
	movl	-4(%ebp), %eax
	movl	$0, _rankArr(,%eax,4)
	addl	$1, -4(%ebp)
L2:
	cmpl	$9, -4(%ebp)
	jle	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_find
	.def	_find;	.scl	2;	.type	32;	.endef
_find:
LFB11:
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
	je	L5
	movl	8(%ebp), %eax
	movl	_parent(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_find
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, _parent(,%eax,4)
L5:
	movl	8(%ebp), %eax
	movl	_parent(,%eax,4), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	_unionSet
	.def	_unionSet;	.scl	2;	.type	32;	.endef
_unionSet:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_find
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_find
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	L12
	movl	-12(%ebp), %eax
	movl	_rankArr(,%eax,4), %edx
	movl	-16(%ebp), %eax
	movl	_rankArr(,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L10
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, _parent(,%eax,4)
	jmp	L7
L10:
	movl	-12(%ebp), %eax
	movl	_rankArr(,%eax,4), %edx
	movl	-16(%ebp), %eax
	movl	_rankArr(,%eax,4), %eax
	cmpl	%eax, %edx
	jle	L11
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, _parent(,%eax,4)
	jmp	L7
L11:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, _parent(,%eax,4)
	movl	-12(%ebp), %eax
	movl	_rankArr(,%eax,4), %eax
	leal	1(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, _rankArr(,%eax,4)
	jmp	L7
L12:
	nop
L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
