	.file	"dijkstra.c"
	.text
	.globl	_minDistance
	.def	_minDistance;	.scl	2;	.type	32;	.endef
_minDistance:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$2147483647, -4(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L4:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L3
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	-4(%ebp), %eax
	jg	L3
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -8(%ebp)
L3:
	addl	$1, -12(%ebp)
L2:
	cmpl	$4, -12(%ebp)
	jle	L4
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
LC0:
	.ascii "%d -> %d\12\0"
	.text
	.globl	_dijkstra
	.def	_dijkstra;	.scl	2;	.type	32;	.endef
_dijkstra:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	$0, -12(%ebp)
	jmp	L7
L8:
	movl	-12(%ebp), %eax
	movl	$2147483647, -48(%ebp,%eax,4)
	movl	-12(%ebp), %eax
	movl	$0, -68(%ebp,%eax,4)
	addl	$1, -12(%ebp)
L7:
	cmpl	$4, -12(%ebp)
	jle	L8
	movl	12(%ebp), %eax
	movl	$0, -48(%ebp,%eax,4)
	movl	$0, -16(%ebp)
	jmp	L9
L13:
	leal	-68(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	_minDistance
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	$1, -68(%ebp,%eax,4)
	movl	$0, -20(%ebp)
	jmp	L10
L12:
	movl	-20(%ebp), %eax
	movl	-68(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	L11
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	je	L11
	movl	-28(%ebp), %eax
	movl	-48(%ebp,%eax,4), %eax
	cmpl	$2147483647, %eax
	je	L11
	movl	-28(%ebp), %eax
	movl	-48(%ebp,%eax,4), %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	leal	(%ecx,%eax), %edx
	movl	-20(%ebp), %eax
	movl	-48(%ebp,%eax,4), %eax
	cmpl	%eax, %edx
	jge	L11
	movl	-28(%ebp), %eax
	movl	-48(%ebp,%eax,4), %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	leal	(%ecx,%eax), %edx
	movl	-20(%ebp), %eax
	movl	%edx, -48(%ebp,%eax,4)
L11:
	addl	$1, -20(%ebp)
L10:
	cmpl	$4, -20(%ebp)
	jle	L12
	addl	$1, -16(%ebp)
L9:
	cmpl	$3, -16(%ebp)
	jle	L13
	movl	$0, -24(%ebp)
	jmp	L14
L15:
	movl	-24(%ebp), %eax
	movl	-48(%ebp,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -24(%ebp)
L14:
	cmpl	$4, -24(%ebp)
	jle	L15
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
