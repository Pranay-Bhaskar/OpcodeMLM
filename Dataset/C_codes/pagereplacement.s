	.file	"pagereplacement.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Step %d: \0"
LC1:
	.ascii "%d \0"
LC2:
	.ascii "Total Page Faults = %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$112, %esp
	call	___main
	movl	$1, 36(%esp)
	movl	$2, 40(%esp)
	movl	$3, 44(%esp)
	movl	$4, 48(%esp)
	movl	$1, 52(%esp)
	movl	$2, 56(%esp)
	movl	$5, 60(%esp)
	movl	$1, 64(%esp)
	movl	$2, 68(%esp)
	movl	$3, 72(%esp)
	movl	$4, 76(%esp)
	movl	$5, 80(%esp)
	movl	$0, 108(%esp)
	movl	$0, 104(%esp)
	movl	$0, 100(%esp)
	movl	$0, 96(%esp)
	jmp	L2
L12:
	movl	$0, 92(%esp)
	movl	$0, 88(%esp)
	jmp	L3
L6:
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %edx
	movl	96(%esp), %eax
	movl	36(%esp,%eax,4), %eax
	cmpl	%eax, %edx
	jne	L4
	movl	$1, 92(%esp)
	jmp	L5
L4:
	addl	$1, 88(%esp)
L3:
	movl	88(%esp), %eax
	cmpl	104(%esp), %eax
	jl	L6
L5:
	cmpl	$0, 92(%esp)
	jne	L7
	cmpl	$2, 104(%esp)
	jg	L8
	movl	104(%esp), %eax
	leal	1(%eax), %edx
	movl	%edx, 104(%esp)
	movl	96(%esp), %edx
	movl	36(%esp,%edx,4), %edx
	movl	%edx, 24(%esp,%eax,4)
	jmp	L9
L8:
	movl	96(%esp), %eax
	movl	36(%esp,%eax,4), %edx
	movl	108(%esp), %eax
	movl	%edx, 24(%esp,%eax,4)
	movl	108(%esp), %eax
	leal	1(%eax), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 108(%esp)
	movl	108(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 108(%esp)
L9:
	addl	$1, 100(%esp)
L7:
	movl	96(%esp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, 84(%esp)
	jmp	L10
L11:
	movl	84(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, 84(%esp)
L10:
	movl	84(%esp), %eax
	cmpl	104(%esp), %eax
	jl	L11
	movl	$10, (%esp)
	call	_putchar
	addl	$1, 96(%esp)
L2:
	cmpl	$11, 96(%esp)
	jle	L12
	movl	100(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
