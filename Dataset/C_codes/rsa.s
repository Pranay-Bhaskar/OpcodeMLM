	.file	"rsa.c"
	.def	___moddi3;	.scl	2;	.type	32;	.endef
	.text
	.globl	_modexp
	.def	_modexp;	.scl	2;	.type	32;	.endef
_modexp:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$96, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -36(%ebp)
	movl	24(%ebp), %eax
	movl	%eax, -48(%ebp)
	movl	28(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	$1, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L4:
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	movl	%ecx, %ebx
	sarl	$31, %ebx
	movl	%eax, %esi
	xorl	%ecx, %esi
	movl	%esi, -56(%ebp)
	movl	%edx, %eax
	xorl	%ebx, %eax
	movl	%eax, -52(%ebp)
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	subl	%ecx, %eax
	sbbl	%ebx, %edx
	movl	%eax, %esi
	andl	$1, %esi
	movl	%esi, -64(%ebp)
	movl	%edx, %eax
	andl	$0, %eax
	movl	%eax, -60(%ebp)
	movl	-64(%ebp), %eax
	movl	-60(%ebp), %edx
	movl	%eax, %esi
	xorl	%ecx, %esi
	movl	%esi, -72(%ebp)
	movl	%edx, %eax
	xorl	%ebx, %eax
	movl	%eax, -68(%ebp)
	movl	-72(%ebp), %eax
	movl	-68(%ebp), %edx
	subl	%ecx, %eax
	sbbl	%ebx, %edx
	movl	%eax, %ebx
	xorl	$1, %ebx
	movl	%ebx, -80(%ebp)
	movl	%edx, %eax
	xorb	$0, %ah
	movl	%eax, -76(%ebp)
	movl	-80(%ebp), %ebx
	movl	-76(%ebp), %esi
	movl	%esi, %eax
	orl	%ebx, %eax
	testl	%eax, %eax
	jne	L3
	movl	-12(%ebp), %eax
	imull	-32(%ebp), %eax
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	imull	-16(%ebp), %eax
	leal	(%edx,%eax), %esi
	movl	-32(%ebp), %ebx
	movl	%ebx, %eax
	mull	-16(%ebp)
	movl	%eax, %ecx
	movl	%edx, %ebx
	leal	(%esi,%ebx), %eax
	movl	%eax, %ebx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, (%esp)
	movl	%ebx, 4(%esp)
	call	___moddi3
	movl	%eax, -16(%ebp)
	movl	%edx, -12(%ebp)
L3:
	movl	-28(%ebp), %eax
	imull	-32(%ebp), %eax
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	imull	-32(%ebp), %eax
	leal	(%edx,%eax), %esi
	movl	-32(%ebp), %ebx
	movl	%ebx, %eax
	mull	-32(%ebp)
	movl	%eax, %ecx
	movl	%edx, %ebx
	leal	(%esi,%ebx), %eax
	movl	%eax, %ebx
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, (%esp)
	movl	%ebx, 4(%esp)
	call	___moddi3
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	movl	$0, %ebx
	addl	%ecx, %eax
	adcl	%ebx, %edx
	shrdl	$1, %edx, %eax
	sarl	%edx
	movl	%eax, -40(%ebp)
	movl	%edx, -36(%ebp)
L2:
	cmpl	$0, -36(%ebp)
	jg	L4
	cmpl	$0, -36(%ebp)
	js	L7
	cmpl	$0, -40(%ebp)
	ja	L4
L7:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	$96, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_encrypt
	.def	_encrypt;	.scl	2;	.type	32;	.endef
_encrypt:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	24(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	28(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%eax, 16(%esp)
	movl	%edx, 20(%esp)
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_modexp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	_decrypt
	.def	_decrypt;	.scl	2;	.type	32;	.endef
_decrypt:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	24(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	28(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%eax, 16(%esp)
	movl	%edx, 20(%esp)
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_modexp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
