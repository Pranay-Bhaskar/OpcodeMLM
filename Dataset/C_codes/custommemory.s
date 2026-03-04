	.file	"custommemory.c"
	.comm	_memory, 1024, 5
	.comm	_used, 4096, 5
	.text
	.globl	_my_malloc
	.def	_my_malloc;	.scl	2;	.type	32;	.endef
_my_malloc:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L11:
	movl	$1, -8(%ebp)
	movl	$0, -12(%ebp)
	jmp	L3
L6:
	movl	-4(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movl	_used(,%eax,4), %eax
	testl	%eax, %eax
	je	L4
	movl	$0, -8(%ebp)
	jmp	L5
L4:
	addl	$1, -12(%ebp)
L3:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L6
L5:
	cmpl	$0, -8(%ebp)
	je	L7
	movl	$0, -16(%ebp)
	jmp	L8
L9:
	movl	-4(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	$1, _used(,%eax,4)
	addl	$1, -16(%ebp)
L8:
	movl	-16(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L9
	movl	-4(%ebp), %eax
	addl	$_memory, %eax
	jmp	L10
L7:
	addl	$1, -4(%ebp)
L2:
	movl	$1024, %eax
	subl	8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jg	L11
	movl	$0, %eax
L10:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_my_free
	.def	_my_free;	.scl	2;	.type	32;	.endef
_my_free:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	$_memory, %edx
	subl	%edx, %eax
	movl	%eax, -8(%ebp)
	movl	$0, -4(%ebp)
	jmp	L13
L14:
	movl	-8(%ebp), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movl	$0, _used(,%eax,4)
	addl	$1, -4(%ebp)
L13:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L14
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Allocated blocks!\0"
LC1:
	.ascii "Freed block1\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$100, (%esp)
	call	_my_malloc
	movl	%eax, 28(%esp)
	movl	$200, (%esp)
	call	_my_malloc
	movl	%eax, 24(%esp)
	cmpl	$0, 28(%esp)
	je	L16
	cmpl	$0, 24(%esp)
	je	L16
	movl	$LC0, (%esp)
	call	_puts
L16:
	movl	$100, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_my_free
	movl	$LC1, (%esp)
	call	_puts
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
