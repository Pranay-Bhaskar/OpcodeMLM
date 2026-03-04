	.file	"nnfeedforward.c"
	.text
	.globl	_sigmoid
	.def	_sigmoid;	.scl	2;	.type	32;	.endef
_sigmoid:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	fldl	-16(%ebp)
	fchs
	fstpl	(%esp)
	call	_exp
	fld1
	faddp	%st, %st(1)
	fld1
	fdivp	%st, %st(1)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_sigmoidDerivative
	.def	_sigmoidDerivative;	.scl	2;	.type	32;	.endef
_sigmoidDerivative:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	fld1
	fsubl	-8(%ebp)
	fmull	-8(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_training_inputs
	.data
	.align 32
_training_inputs:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.globl	_training_outputs
	.align 32
_training_outputs:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	0
	.comm	_hidden_weights, 64, 5
	.comm	_hidden_bias, 32, 5
	.comm	_output_weights, 32, 5
	.comm	_output_bias, 8, 3
	.comm	_hidden_layer, 32, 5
	.comm	_output_layer, 8, 3
	.text
	.globl	_initWeights
	.def	_initWeights;	.scl	2;	.type	32;	.endef
_initWeights:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, -12(%ebp)
	jmp	L6
L9:
	movl	$0, -16(%ebp)
	jmp	L7
L8:
	call	_rand
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	LC2
	fdivrp	%st, %st(1)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	fstpl	_hidden_weights(,%eax,8)
	addl	$1, -16(%ebp)
L7:
	cmpl	$3, -16(%ebp)
	jle	L8
	addl	$1, -12(%ebp)
L6:
	cmpl	$1, -12(%ebp)
	jle	L9
	movl	$0, -20(%ebp)
	jmp	L10
L11:
	call	_rand
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	LC2
	fdivrp	%st, %st(1)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	movl	-20(%ebp), %eax
	fstpl	_hidden_bias(,%eax,8)
	addl	$1, -20(%ebp)
L10:
	cmpl	$3, -20(%ebp)
	jle	L11
	movl	$0, -24(%ebp)
	jmp	L12
L15:
	movl	$0, -28(%ebp)
	jmp	L13
L14:
	call	_rand
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	LC2
	fdivrp	%st, %st(1)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	fstpl	_output_weights(,%eax,8)
	addl	$1, -28(%ebp)
L13:
	cmpl	$0, -28(%ebp)
	jle	L14
	addl	$1, -24(%ebp)
L12:
	cmpl	$3, -24(%ebp)
	jle	L15
	movl	$0, -32(%ebp)
	jmp	L16
L17:
	call	_rand
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fldl	LC2
	fdivrp	%st, %st(1)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	movl	-32(%ebp), %eax
	fstpl	_output_bias(,%eax,8)
	addl	$1, -32(%ebp)
L16:
	cmpl	$0, -32(%ebp)
	jle	L17
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_forward
	.def	_forward;	.scl	2;	.type	32;	.endef
_forward:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L19
L22:
	movl	-12(%ebp), %eax
	fldl	_hidden_bias(,%eax,8)
	movl	-12(%ebp), %eax
	fstpl	_hidden_layer(,%eax,8)
	movl	$0, -16(%ebp)
	jmp	L20
L21:
	movl	-12(%ebp), %eax
	fldl	_hidden_layer(,%eax,8)
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	fldl	_hidden_weights(,%eax,8)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	movl	-12(%ebp), %eax
	fstpl	_hidden_layer(,%eax,8)
	addl	$1, -16(%ebp)
L20:
	cmpl	$1, -16(%ebp)
	jle	L21
	movl	-12(%ebp), %eax
	fldl	_hidden_layer(,%eax,8)
	fstpl	(%esp)
	call	_sigmoid
	movl	-12(%ebp), %eax
	fstpl	_hidden_layer(,%eax,8)
	addl	$1, -12(%ebp)
L19:
	cmpl	$3, -12(%ebp)
	jle	L22
	movl	$0, -20(%ebp)
	jmp	L23
L26:
	movl	-20(%ebp), %eax
	fldl	_output_bias(,%eax,8)
	movl	-20(%ebp), %eax
	fstpl	_output_layer(,%eax,8)
	movl	$0, -24(%ebp)
	jmp	L24
L25:
	movl	-20(%ebp), %eax
	fldl	_output_layer(,%eax,8)
	movl	-24(%ebp), %eax
	fldl	_hidden_layer(,%eax,8)
	movl	-20(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	fldl	_output_weights(,%eax,8)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	movl	-20(%ebp), %eax
	fstpl	_output_layer(,%eax,8)
	addl	$1, -24(%ebp)
L24:
	cmpl	$3, -24(%ebp)
	jle	L25
	movl	-20(%ebp), %eax
	fldl	_output_layer(,%eax,8)
	fstpl	(%esp)
	call	_sigmoid
	movl	-20(%ebp), %eax
	fstpl	_output_layer(,%eax,8)
	addl	$1, -20(%ebp)
L23:
	cmpl	$0, -20(%ebp)
	jle	L26
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_backprop
	.def	_backprop;	.scl	2;	.type	32;	.endef
_backprop:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$96, %esp
	movl	$0, -4(%ebp)
	jmp	L28
L29:
	movl	-4(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	movl	-4(%ebp), %eax
	fldl	_output_layer(,%eax,8)
	fsubrp	%st, %st(1)
	fstpl	-88(%ebp)
	movl	-4(%ebp), %eax
	fldl	_output_layer(,%eax,8)
	fstpl	(%esp)
	call	_sigmoidDerivative
	fmull	-88(%ebp)
	movl	-4(%ebp), %eax
	fstpl	-48(%ebp,%eax,8)
	addl	$1, -4(%ebp)
L28:
	cmpl	$0, -4(%ebp)
	jle	L29
	movl	$0, -8(%ebp)
	jmp	L30
L33:
	movl	-8(%ebp), %eax
	fldz
	fstpl	-80(%ebp,%eax,8)
	movl	$0, -12(%ebp)
	jmp	L31
L32:
	movl	-8(%ebp), %eax
	fldl	-80(%ebp,%eax,8)
	movl	-12(%ebp), %eax
	fldl	-48(%ebp,%eax,8)
	movl	-8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	fldl	_output_weights(,%eax,8)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	movl	-8(%ebp), %eax
	fstpl	-80(%ebp,%eax,8)
	addl	$1, -12(%ebp)
L31:
	cmpl	$0, -12(%ebp)
	jle	L32
	movl	-8(%ebp), %eax
	fldl	_hidden_layer(,%eax,8)
	fstpl	(%esp)
	call	_sigmoidDerivative
	movl	-8(%ebp), %eax
	fldl	-80(%ebp,%eax,8)
	fmulp	%st, %st(1)
	movl	-8(%ebp), %eax
	fstpl	-80(%ebp,%eax,8)
	addl	$1, -8(%ebp)
L30:
	cmpl	$3, -8(%ebp)
	jle	L33
	movl	$0, -16(%ebp)
	jmp	L34
L37:
	movl	$0, -20(%ebp)
	jmp	L35
L36:
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	fldl	_output_weights(,%eax,8)
	movl	-20(%ebp), %eax
	fldl	-48(%ebp,%eax,8)
	fldl	LC4
	fmulp	%st, %st(1)
	movl	-16(%ebp), %eax
	fldl	_hidden_layer(,%eax,8)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	fstpl	_output_weights(,%eax,8)
	addl	$1, -20(%ebp)
L35:
	cmpl	$0, -20(%ebp)
	jle	L36
	addl	$1, -16(%ebp)
L34:
	cmpl	$3, -16(%ebp)
	jle	L37
	movl	$0, -24(%ebp)
	jmp	L38
L39:
	movl	-24(%ebp), %eax
	fldl	_output_bias(,%eax,8)
	movl	-24(%ebp), %eax
	fldl	-48(%ebp,%eax,8)
	fldl	LC4
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	movl	-24(%ebp), %eax
	fstpl	_output_bias(,%eax,8)
	addl	$1, -24(%ebp)
L38:
	cmpl	$0, -24(%ebp)
	jle	L39
	movl	$0, -28(%ebp)
	jmp	L40
L43:
	movl	$0, -32(%ebp)
	jmp	L41
L42:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	fldl	_hidden_weights(,%eax,8)
	movl	-32(%ebp), %eax
	fldl	-80(%ebp,%eax,8)
	fldl	LC4
	fmulp	%st, %st(1)
	movl	-28(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fldl	(%eax)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	fstpl	_hidden_weights(,%eax,8)
	addl	$1, -32(%ebp)
L41:
	cmpl	$3, -32(%ebp)
	jle	L42
	addl	$1, -28(%ebp)
L40:
	cmpl	$1, -28(%ebp)
	jle	L43
	movl	$0, -36(%ebp)
	jmp	L44
L45:
	movl	-36(%ebp), %eax
	fldl	_hidden_bias(,%eax,8)
	movl	-36(%ebp), %eax
	fldl	-80(%ebp,%eax,8)
	fldl	LC4
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	movl	-36(%ebp), %eax
	fstpl	_hidden_bias(,%eax,8)
	addl	$1, -36(%ebp)
L44:
	cmpl	$3, -36(%ebp)
	jle	L45
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC5:
	.ascii "Epoch %d, Error = %f\12\0"
	.text
	.globl	_train
	.def	_train;	.scl	2;	.type	32;	.endef
_train:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	jmp	L47
L53:
	fldz
	fstpl	-24(%ebp)
	movl	$0, -28(%ebp)
	jmp	L48
L51:
	movl	-28(%ebp), %eax
	sall	$4, %eax
	addl	$_training_inputs, %eax
	movl	%eax, (%esp)
	call	_forward
	movl	-28(%ebp), %eax
	sall	$3, %eax
	leal	_training_outputs(%eax), %edx
	movl	-28(%ebp), %eax
	sall	$4, %eax
	addl	$_training_inputs, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_backprop
	movl	$0, -32(%ebp)
	jmp	L49
L50:
	movl	-28(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	fldl	_training_outputs(,%eax,8)
	movl	-32(%ebp), %eax
	fldl	_output_layer(,%eax,8)
	fsubrp	%st, %st(1)
	fstpl	-40(%ebp)
	fldl	-40(%ebp)
	fmull	-40(%ebp)
	fldl	-24(%ebp)
	faddp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$1, -32(%ebp)
L49:
	cmpl	$0, -32(%ebp)
	jle	L50
	addl	$1, -28(%ebp)
L48:
	cmpl	$3, -28(%ebp)
	jle	L51
	movl	-12(%ebp), %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$500, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	testl	%eax, %eax
	jne	L52
	fldl	-24(%ebp)
	fstpl	8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
L52:
	addl	$1, -12(%ebp)
L47:
	cmpl	$4999, -12(%ebp)
	jle	L53
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC6:
	.ascii "\12Testing Neural Network on XOR:\0"
	.align 4
LC7:
	.ascii "Input: %.1f %.1f => Output: %.3f (Expected: %.1f)\12\0"
	.text
	.globl	_test
	.def	_test;	.scl	2;	.type	32;	.endef
_test:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	$LC6, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L55
L56:
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_training_inputs, %eax
	movl	%eax, (%esp)
	call	_forward
	movl	-12(%ebp), %eax
	fldl	_training_outputs(,%eax,8)
	fldl	_output_layer
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_training_inputs+8, %eax
	fldl	(%eax)
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_training_inputs, %eax
	fldl	(%eax)
	fxch	%st(3)
	fstpl	28(%esp)
	fxch	%st(1)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L55:
	cmpl	$3, -12(%ebp)
	jle	L56
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	call	___main
	call	_initWeights
	call	_train
	call	_test
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
	.align 8
LC2:
	.long	0
	.long	1088421824
	.align 8
LC4:
	.long	-1717986918
	.long	1069128089
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_exp;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
