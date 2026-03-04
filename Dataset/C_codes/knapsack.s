	.file	"knapsack.c"
	.text
	.globl	_max
	.def	_max;	.scl	2;	.type	32;	.endef
_max:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%edx, %eax
	jge	L3
	movl	%edx, %eax
L3:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_knapsack
	.def	_knapsack;	.scl	2;	.type	32;	.endef
_knapsack:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	%esp, %eax
	movl	%eax, -72(%ebp)
	movl	8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	movl	20(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%esi, %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
	movl	%esi, %eax
	sall	$2, %eax
	movl	%eax, -60(%ebp)
	movl	%edi, %eax
	subl	$1, %eax
	movl	%eax, -40(%ebp)
	movl	%esi, -64(%ebp)
	movl	%esi, %eax
	movl	%eax, %ecx
	movl	$0, %ebx
	movl	%edi, -68(%ebp)
	movl	%edi, %eax
	movl	$0, %edx
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edx, %esi
	imull	%ecx, %esi
	addl	%edi, %esi
	mull	%ecx
	leal	(%esi,%edx), %ecx
	movl	%ecx, %edx
	movl	-64(%ebp), %eax
	movl	%eax, %ecx
	movl	$0, %ebx
	movl	-68(%ebp), %eax
	movl	$0, %edx
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edx, %esi
	imull	%ecx, %esi
	addl	%edi, %esi
	mull	%ecx
	leal	(%esi,%edx), %ecx
	movl	%ecx, %edx
	movl	-64(%ebp), %edx
	movl	-68(%ebp), %eax
	imull	%edx, %eax
	sall	$2, %eax
	leal	3(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ebx
	movl	$0, %edx
	divl	%ebx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	8(%esp), %eax
	addl	$3, %eax
	shrl	$2, %eax
	sall	$2, %eax
	movl	%eax, -44(%ebp)
	movl	$0, -28(%ebp)
	jmp	L5
L12:
	movl	$0, -32(%ebp)
	jmp	L6
L11:
	cmpl	$0, -28(%ebp)
	je	L7
	cmpl	$0, -32(%ebp)
	jne	L8
L7:
	movl	-60(%ebp), %edx
	shrl	$2, %edx
	movl	-44(%ebp), %eax
	movl	%edx, %ecx
	imull	-28(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movl	$0, (%eax,%edx,4)
	jmp	L9
L8:
	movl	-28(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	-32(%ebp), %eax
	jg	L10
	movl	-60(%ebp), %edi
	movl	%edi, %eax
	shrl	$2, %eax
	movl	%eax, -64(%ebp)
	movl	%edi, %ecx
	shrl	$2, %ecx
	movl	-28(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-44(%ebp), %eax
	imull	%edx, %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movl	(%eax,%edx,4), %ebx
	movl	-28(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %esi
	movl	%esi, -68(%ebp)
	shrl	$2, %edi
	movl	-28(%ebp), %eax
	leal	-1(%eax), %esi
	movl	-28(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-32(%ebp), %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	-44(%ebp), %edx
	imull	%esi, %edi
	movl	%edi, %eax
	addl	%ecx, %eax
	movl	(%edx,%eax,4), %eax
	addl	-68(%ebp), %eax
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	_max
	movl	%eax, %ebx
	movl	-44(%ebp), %eax
	movl	-64(%ebp), %ecx
	imull	-28(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movl	%ebx, (%eax,%edx,4)
	jmp	L9
L10:
	movl	-60(%ebp), %ebx
	movl	%ebx, %ecx
	shrl	$2, %ecx
	shrl	$2, %ebx
	movl	-28(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-44(%ebp), %eax
	imull	%edx, %ebx
	movl	-32(%ebp), %edx
	addl	%ebx, %edx
	movl	(%eax,%edx,4), %edx
	movl	-44(%ebp), %eax
	movl	%ecx, %ebx
	imull	-28(%ebp), %ebx
	movl	-32(%ebp), %ecx
	addl	%ebx, %ecx
	movl	%edx, (%eax,%ecx,4)
L9:
	addl	$1, -32(%ebp)
L6:
	movl	-32(%ebp), %eax
	cmpl	8(%ebp), %eax
	jle	L11
	addl	$1, -28(%ebp)
L5:
	movl	-28(%ebp), %eax
	cmpl	20(%ebp), %eax
	jle	L12
	movl	-60(%ebp), %edx
	shrl	$2, %edx
	movl	-44(%ebp), %eax
	movl	%edx, %ecx
	imull	20(%ebp), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	movl	(%eax,%edx,4), %eax
	movl	-72(%ebp), %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
