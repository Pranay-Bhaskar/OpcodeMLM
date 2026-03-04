	.file	"asciimaze.c"
	.comm	_maze, 231, 5
	.text
	.globl	_init_maze
	.def	_init_maze;	.scl	2;	.type	32;	.endef
_init_maze:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L5:
	movl	$0, -8(%ebp)
	jmp	L3
L4:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	addl	$_maze, %eax
	movb	$35, (%eax)
	addl	$1, -8(%ebp)
L3:
	cmpl	$20, -8(%ebp)
	jle	L4
	addl	$1, -4(%ebp)
L2:
	cmpl	$10, -4(%ebp)
	jle	L5
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_carve
	.def	_carve;	.scl	2;	.type	32;	.endef
_carve:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	$0, -68(%ebp)
	movl	$-2, -64(%ebp)
	movl	$0, -60(%ebp)
	movl	$2, -56(%ebp)
	movl	$-2, -52(%ebp)
	movl	$0, -48(%ebp)
	movl	$2, -44(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -12(%ebp)
	jmp	L7
L8:
	call	_rand
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$30, %eax
	addl	%eax, %edx
	andl	$3, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	movl	-68(%ebp,%eax,8), %eax
	movl	%eax, -24(%ebp)
	movl	-20(%ebp), %eax
	movl	-68(%ebp,%eax,8), %edx
	movl	-12(%ebp), %eax
	movl	%edx, -68(%ebp,%eax,8)
	movl	-20(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, -68(%ebp,%eax,8)
	movl	-12(%ebp), %eax
	movl	-64(%ebp,%eax,8), %eax
	movl	%eax, -28(%ebp)
	movl	-20(%ebp), %eax
	movl	-64(%ebp,%eax,8), %edx
	movl	-12(%ebp), %eax
	movl	%edx, -64(%ebp,%eax,8)
	movl	-20(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, -64(%ebp,%eax,8)
	addl	$1, -12(%ebp)
L7:
	cmpl	$3, -12(%ebp)
	jle	L8
	movl	$0, -16(%ebp)
	jmp	L9
L11:
	movl	-16(%ebp), %eax
	movl	-68(%ebp,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -32(%ebp)
	movl	-16(%ebp), %eax
	movl	-64(%ebp,%eax,8), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -36(%ebp)
	cmpl	$0, -32(%ebp)
	jle	L10
	cmpl	$19, -32(%ebp)
	jg	L10
	cmpl	$0, -36(%ebp)
	jle	L10
	cmpl	$9, -36(%ebp)
	jg	L10
	movl	-36(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-32(%ebp), %edx
	addl	%edx, %eax
	addl	$_maze, %eax
	movzbl	(%eax), %eax
	cmpb	$35, %al
	jne	L10
	movl	-36(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-32(%ebp), %edx
	addl	%edx, %eax
	addl	$_maze, %eax
	movb	$32, (%eax)
	movl	-16(%ebp), %eax
	movl	-64(%ebp,%eax,8), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	-68(%ebp,%eax,8), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	%eax, %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	addl	$_maze, %eax
	movb	$32, (%eax)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_carve
L10:
	addl	$1, -16(%ebp)
L9:
	cmpl	$3, -16(%ebp)
	jle	L11
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_print_maze
	.def	_print_maze;	.scl	2;	.type	32;	.endef
_print_maze:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L13
L16:
	movl	$0, -16(%ebp)
	jmp	L14
L15:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	addl	$_maze, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_putchar
	addl	$1, -16(%ebp)
L14:
	cmpl	$20, -16(%ebp)
	jle	L15
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L13:
	cmpl	$10, -12(%ebp)
	jle	L16
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	call	_init_maze
	movb	$32, _maze+22
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_carve
	call	_print_maze
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
