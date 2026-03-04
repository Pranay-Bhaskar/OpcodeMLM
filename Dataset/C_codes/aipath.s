	.file	"aipath.c"
	.comm	_grid, 100, 5
	.comm	_visited, 100, 5
	.comm	_queue, 200, 5
	.globl	_front
	.bss
	.align 4
_front:
	.space 4
	.globl	_rear
	.align 4
_rear:
	.space 4
	.text
	.globl	_enqueue
	.def	_enqueue;	.scl	2;	.type	32;	.endef
_enqueue:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_rear, %ecx
	leal	1(%ecx), %eax
	movl	%eax, _rear
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%eax, _queue(,%ecx,8)
	movl	%edx, _queue+4(,%ecx,8)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_dequeue
	.def	_dequeue;	.scl	2;	.type	32;	.endef
_dequeue:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_front, %eax
	leal	1(%eax), %edx
	movl	%edx, _front
	movl	_queue+4(,%eax,8), %edx
	movl	_queue(,%eax,8), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_isEmpty
	.def	_isEmpty;	.scl	2;	.type	32;	.endef
_isEmpty:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	_front, %edx
	movl	_rear, %eax
	cmpl	%eax, %edx
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.section .rdata,"dr"
LC0:
	.ascii "Reached destination!\0"
LC1:
	.ascii "No path found.\0"
	.text
	.globl	_bfs
	.def	_bfs;	.scl	2;	.type	32;	.endef
_bfs:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_enqueue
	movl	8(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movl	$1, _visited(,%eax,4)
	jmp	L7
L13:
	call	_dequeue
	movl	%eax, -36(%ebp)
	movl	%edx, -32(%ebp)
	movl	-36(%ebp), %edx
	movl	16(%ebp), %eax
	cmpl	%eax, %edx
	jne	L8
	movl	-32(%ebp), %edx
	movl	20(%ebp), %eax
	cmpl	%eax, %edx
	jne	L8
	movl	$LC0, (%esp)
	call	_puts
	jmp	L6
L8:
	movl	$1, -52(%ebp)
	movl	$-1, -48(%ebp)
	movl	$0, -44(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -68(%ebp)
	movl	$0, -64(%ebp)
	movl	$1, -60(%ebp)
	movl	$-1, -56(%ebp)
	movl	$0, -12(%ebp)
	jmp	L10
L12:
	movl	-36(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	-52(%ebp,%eax,4), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	-32(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	-68(%ebp,%eax,4), %eax
	addl	%edx, %eax
	movl	%eax, -20(%ebp)
	cmpl	$0, -16(%ebp)
	js	L11
	cmpl	$0, -20(%ebp)
	js	L11
	cmpl	$4, -16(%ebp)
	jg	L11
	cmpl	$4, -20(%ebp)
	jg	L11
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-20(%ebp), %edx
	addl	%edx, %eax
	movl	_visited(,%eax,4), %eax
	testl	%eax, %eax
	jne	L11
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-20(%ebp), %edx
	addl	%edx, %eax
	movl	$1, _visited(,%eax,4)
	movl	-16(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_enqueue
L11:
	addl	$1, -12(%ebp)
L10:
	cmpl	$3, -12(%ebp)
	jle	L12
L7:
	call	_isEmpty
	testl	%eax, %eax
	je	L13
	movl	$LC1, (%esp)
	call	_puts
L6:
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
	subl	$32, %esp
	call	___main
	movl	$0, 24(%esp)
	movl	$0, 28(%esp)
	movl	$4, 16(%esp)
	movl	$4, 20(%esp)
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	_bfs
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
