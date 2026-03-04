	.file	"lcs.c"
	.text
	.globl	_max
	.def	_max;	.scl	2;	.type	32;	.endef
_max:
LFB13:
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
LFE13:
	.globl	_LCS
	.def	_LCS;	.scl	2;	.type	32;	.endef
_LCS:
LFB14:
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
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -36(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %ebx
	movl	-36(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%ebx, %eax
	subl	$1, %eax
	movl	%eax, -44(%ebp)
	movl	%ebx, %eax
	sall	$2, %eax
	movl	%eax, -60(%ebp)
	movl	%edi, %eax
	subl	$1, %eax
	movl	%eax, -48(%ebp)
	movl	%ebx, -64(%ebp)
	movl	%ebx, %eax
	movl	%eax, %ecx
	movl	$0, %ebx
	movl	%edi, -68(%ebp)
	movl	%edi, %eax
	movl	$0, %edx
	movl	%ebx, %esi
	imull	%eax, %esi
	movl	%esi, %edi
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
	movl	%eax, -52(%ebp)
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
	movl	-52(%ebp), %eax
	movl	%edx, %ecx
	imull	-28(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movl	$0, (%eax,%edx,4)
	jmp	L9
L8:
	movl	-28(%ebp), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-32(%ebp), %eax
	leal	-1(%eax), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	L10
	movl	-60(%ebp), %edi
	movl	%edi, %ebx
	shrl	$2, %ebx
	shrl	$2, %edi
	movl	-28(%ebp), %eax
	leal	-1(%eax), %esi
	movl	-32(%ebp), %eax
	leal	-1(%eax), %ecx
	movl	-52(%ebp), %edx
	movl	%edi, %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movl	(%edx,%eax,4), %eax
	leal	1(%eax), %ecx
	movl	-52(%ebp), %eax
	imull	-28(%ebp), %ebx
	movl	-32(%ebp), %edx
	addl	%ebx, %edx
	movl	%ecx, (%eax,%edx,4)
	jmp	L9
L10:
	movl	-60(%ebp), %edi
	movl	%edi, %esi
	shrl	$2, %esi
	movl	%edi, %edx
	shrl	$2, %edx
	movl	-32(%ebp), %eax
	leal	-1(%eax), %ecx
	movl	-52(%ebp), %eax
	imull	-28(%ebp), %edx
	addl	%ecx, %edx
	movl	(%eax,%edx,4), %ecx
	movl	%edi, %edx
	shrl	$2, %edx
	movl	-28(%ebp), %eax
	subl	$1, %eax
	movl	-52(%ebp), %ebx
	imull	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	(%ebx,%eax,4), %eax
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	_max
	movl	%eax, %ebx
	movl	-52(%ebp), %eax
	imull	-28(%ebp), %esi
	movl	%esi, %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movl	%ebx, (%eax,%edx,4)
L9:
	addl	$1, -32(%ebp)
L6:
	movl	-32(%ebp), %eax
	cmpl	-40(%ebp), %eax
	jle	L11
	addl	$1, -28(%ebp)
L5:
	movl	-28(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jle	L12
	movl	-60(%ebp), %edx
	shrl	$2, %edx
	movl	-52(%ebp), %eax
	movl	%edx, %ecx
	imull	-36(%ebp), %ecx
	movl	-40(%ebp), %edx
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
LFE14:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strlen;	.scl	2;	.type	32;	.endef
