	.file	"ipt.c"
	.comm	_width, 4, 2
	.comm	_height, 4, 2
	.comm	_maxval, 4, 2
	.comm	_image, 262144, 5
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
LC1:
	.ascii "%s\0"
LC2:
	.ascii "%d %d %d\0"
LC3:
	.ascii "%d\0"
	.text
	.globl	_load_pgm
	.def	_load_pgm;	.scl	2;	.type	32;	.endef
_load_pgm:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	leal	-23(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	movl	$_maxval, 16(%esp)
	movl	$_height, 12(%esp)
	movl	$_width, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	movl	$0, -12(%ebp)
	jmp	L2
L5:
	movl	$0, -16(%ebp)
	jmp	L3
L4:
	movl	-12(%ebp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_image, %eax
	movl	%eax, 8(%esp)
	movl	$LC3, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	addl	$1, -16(%ebp)
L3:
	movl	_width, %eax
	cmpl	%eax, -16(%ebp)
	jl	L4
	addl	$1, -12(%ebp)
L2:
	movl	_height, %eax
	cmpl	%eax, -12(%ebp)
	jl	L5
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.section .rdata,"dr"
LC4:
	.ascii "w\0"
LC5:
	.ascii "P2\12%d %d\12%d\12\0"
LC6:
	.ascii "%d \0"
	.text
	.globl	_save_pgm
	.def	_save_pgm;	.scl	2;	.type	32;	.endef
_save_pgm:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC4, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	movl	_maxval, %ecx
	movl	_height, %edx
	movl	_width, %eax
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC5, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	$0, -12(%ebp)
	jmp	L7
L10:
	movl	$0, -16(%ebp)
	jmp	L8
L9:
	movl	-12(%ebp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	_image(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	$LC6, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	addl	$1, -16(%ebp)
L8:
	movl	_width, %eax
	cmpl	%eax, -16(%ebp)
	jl	L9
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	_fputc
	addl	$1, -12(%ebp)
L7:
	movl	_height, %eax
	cmpl	%eax, -12(%ebp)
	jl	L10
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_invert
	.def	_invert;	.scl	2;	.type	32;	.endef
_invert:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L12
L15:
	movl	$0, -8(%ebp)
	jmp	L13
L14:
	movl	_maxval, %edx
	movl	-4(%ebp), %eax
	sall	$8, %eax
	movl	%eax, %ecx
	movl	-8(%ebp), %eax
	addl	%ecx, %eax
	movl	_image(,%eax,4), %eax
	subl	%eax, %edx
	movl	-4(%ebp), %eax
	sall	$8, %eax
	movl	%eax, %ecx
	movl	-8(%ebp), %eax
	addl	%ecx, %eax
	movl	%edx, _image(,%eax,4)
	addl	$1, -8(%ebp)
L13:
	movl	_width, %eax
	cmpl	%eax, -8(%ebp)
	jl	L14
	addl	$1, -4(%ebp)
L12:
	movl	_height, %eax
	cmpl	%eax, -4(%ebp)
	jl	L15
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_threshold
	.def	_threshold;	.scl	2;	.type	32;	.endef
_threshold:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L17
L22:
	movl	$0, -8(%ebp)
	jmp	L18
L21:
	movl	-4(%ebp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	addl	%edx, %eax
	movl	_image(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	jle	L19
	movl	_maxval, %eax
	jmp	L20
L19:
	movl	$0, %eax
L20:
	movl	-4(%ebp), %edx
	movl	%edx, %ecx
	sall	$8, %ecx
	movl	-8(%ebp), %edx
	addl	%ecx, %edx
	movl	%eax, _image(,%edx,4)
	addl	$1, -8(%ebp)
L18:
	movl	_width, %eax
	cmpl	%eax, -8(%ebp)
	jl	L21
	addl	$1, -4(%ebp)
L17:
	movl	_height, %eax
	cmpl	%eax, -4(%ebp)
	jl	L22
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC7:
	.ascii "input.pgm\0"
LC8:
	.ascii "output.pgm\0"
	.text
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
	movl	$LC7, (%esp)
	call	_load_pgm
	call	_invert
	movl	_maxval, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, (%esp)
	call	_threshold
	movl	$LC8, (%esp)
	call	_save_pgm
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
