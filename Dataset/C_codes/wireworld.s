	.file	"wireworld.c"
	.comm	_grid, 800, 5
	.text
	.globl	_print_grid
	.def	_print_grid;	.scl	2;	.type	32;	.endef
_print_grid:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L8:
	movl	$0, -16(%ebp)
	jmp	L3
L7:
	movb	$46, -17(%ebp)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	cmpl	$1, %eax
	jne	L4
	movb	$35, -17(%ebp)
	jmp	L5
L4:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	cmpl	$2, %eax
	jne	L6
	movb	$72, -17(%ebp)
	jmp	L5
L6:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	cmpl	$3, %eax
	jne	L5
	movb	$116, -17(%ebp)
L5:
	movsbl	-17(%ebp), %eax
	movl	%eax, (%esp)
	call	_putchar
	addl	$1, -16(%ebp)
L3:
	cmpl	$19, -16(%ebp)
	jle	L7
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L2:
	cmpl	$9, -12(%ebp)
	jle	L8
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_count_heads
	.def	_count_heads;	.scl	2;	.type	32;	.endef
_count_heads:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$0, -4(%ebp)
	movl	$-1, -8(%ebp)
	jmp	L10
L15:
	movl	$-1, -12(%ebp)
	jmp	L11
L14:
	cmpl	$0, -8(%ebp)
	jne	L12
	cmpl	$0, -12(%ebp)
	je	L17
L12:
	movl	8(%ebp), %edx
	movl	-8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%ebp)
	cmpl	$0, -16(%ebp)
	js	L13
	cmpl	$9, -16(%ebp)
	jg	L13
	cmpl	$0, -20(%ebp)
	js	L13
	cmpl	$19, -20(%ebp)
	jg	L13
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-20(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	cmpl	$2, %eax
	jne	L13
	addl	$1, -4(%ebp)
	jmp	L13
L17:
	nop
L13:
	addl	$1, -12(%ebp)
L11:
	cmpl	$1, -12(%ebp)
	jle	L14
	addl	$1, -8(%ebp)
L10:
	cmpl	$1, -8(%ebp)
	jle	L15
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_step
	.def	_step;	.scl	2;	.type	32;	.endef
_step:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$840, %esp
	movl	$0, -4(%ebp)
	jmp	L19
L29:
	movl	$0, -8(%ebp)
	jmp	L20
L28:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	testl	%eax, %eax
	jne	L21
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	$0, -820(%ebp,%eax,4)
	jmp	L22
L21:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	cmpl	$1, %eax
	jne	L23
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	_count_heads
	movl	%eax, -20(%ebp)
	cmpl	$1, -20(%ebp)
	je	L24
	cmpl	$2, -20(%ebp)
	jne	L25
L24:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	$2, -820(%ebp,%eax,4)
	jmp	L22
L25:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	$1, -820(%ebp,%eax,4)
	jmp	L22
L23:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	cmpl	$2, %eax
	jne	L27
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	$3, -820(%ebp,%eax,4)
	jmp	L22
L27:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	_grid(,%eax,4), %eax
	cmpl	$3, %eax
	jne	L22
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	movl	$1, -820(%ebp,%eax,4)
L22:
	addl	$1, -8(%ebp)
L20:
	cmpl	$19, -8(%ebp)
	jle	L28
	addl	$1, -4(%ebp)
L19:
	cmpl	$9, -4(%ebp)
	jle	L29
	movl	$0, -12(%ebp)
	jmp	L30
L33:
	movl	$0, -16(%ebp)
	jmp	L31
L32:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	-820(%ebp,%eax,4), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	%ecx, _grid(,%eax,4)
	addl	$1, -16(%ebp)
L31:
	cmpl	$19, -16(%ebp)
	jle	L32
	addl	$1, -12(%ebp)
L30:
	cmpl	$9, -12(%ebp)
	jle	L33
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$5, 12(%esp)
	jmp	L35
L36:
	movl	12(%esp), %eax
	addl	$100, %eax
	movl	$1, _grid(,%eax,4)
	addl	$1, 12(%esp)
L35:
	cmpl	$14, 12(%esp)
	jle	L36
	movl	$2, _grid+428
	movl	$0, 8(%esp)
	jmp	L37
L38:
	call	_print_grid
	call	_step
	addl	$1, 8(%esp)
L37:
	cmpl	$29, 8(%esp)
	jle	L38
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_putchar;	.scl	2;	.type	32;	.endef
