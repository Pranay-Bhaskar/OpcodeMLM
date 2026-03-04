	.file	"circularbuffer.c"
	.comm	_buffer, 20, 2
	.globl	_head
	.bss
	.align 4
_head:
	.space 4
	.globl	_tail
	.align 4
_tail:
	.space 4
	.globl	_count
	.align 4
_count:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "Buffer full\0"
	.text
	.globl	_enqueue
	.def	_enqueue;	.scl	2;	.type	32;	.endef
_enqueue:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	_count, %eax
	cmpl	$5, %eax
	jne	L2
	movl	$LC0, (%esp)
	call	_puts
	jmp	L1
L2:
	movl	_tail, %eax
	movl	8(%ebp), %edx
	movl	%edx, _buffer(,%eax,4)
	movl	_tail, %eax
	leal	1(%eax), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, _tail
	movl	_count, %eax
	addl	$1, %eax
	movl	%eax, _count
L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
LC1:
	.ascii "Buffer empty\0"
	.text
	.globl	_dequeue
	.def	_dequeue;	.scl	2;	.type	32;	.endef
_dequeue:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_count, %eax
	testl	%eax, %eax
	jne	L5
	movl	$LC1, (%esp)
	call	_puts
	movl	$-1, %eax
	jmp	L6
L5:
	movl	_head, %eax
	movl	_buffer(,%eax,4), %eax
	movl	%eax, -12(%ebp)
	movl	_head, %eax
	leal	1(%eax), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, _head
	movl	_count, %eax
	subl	$1, %eax
	movl	%eax, _count
	movl	-12(%ebp), %eax
L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
