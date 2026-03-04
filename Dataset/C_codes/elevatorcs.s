	.file	"elevatorcs.c"
	.comm	_elevators, 24, 2
	.text
	.globl	_initElevators
	.def	_initElevators;	.scl	2;	.type	32;	.endef
_initElevators:
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
L3:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	$0, (%eax)
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+4, %eax
	movl	$-1, (%eax)
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+8, %eax
	movl	$0, (%eax)
	addl	$1, -4(%ebp)
L2:
	cmpl	$1, -4(%ebp)
	jle	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Request for floor %d assigned to elevator %d\12\0"
	.text
	.globl	_assignRequest
	.def	_assignRequest;	.scl	2;	.type	32;	.endef
_assignRequest:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	_elevators, %eax
	subl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -16(%ebp)
	subl	%eax, -16(%ebp)
	movl	$1, -20(%ebp)
	jmp	L5
L7:
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	(%eax), %eax
	subl	8(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	movl	%edx, -24(%ebp)
	subl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	L6
	movl	-24(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, -12(%ebp)
L6:
	addl	$1, -20(%ebp)
L5:
	cmpl	$1, -20(%ebp)
	jle	L7
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	_elevators+4(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, (%edx)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+8, %eax
	movl	$1, (%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "Elevator %d arrived at floor %d\12\0"
	.text
	.globl	_moveElevators
	.def	_moveElevators;	.scl	2;	.type	32;	.endef
_moveElevators:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L9
L13:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+8, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L10
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+4, %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jge	L11
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	(%eax), %eax
	leal	1(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	%ecx, (%eax)
	jmp	L10
L11:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+4, %eax
	movl	(%eax), %eax
	cmpl	%eax, %ecx
	jle	L12
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	(%eax), %eax
	leal	-1(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	%ecx, (%eax)
	jmp	L10
L12:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+8, %eax
	movl	$0, (%eax)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
L10:
	addl	$1, -12(%ebp)
L9:
	cmpl	$1, -12(%ebp)
	jle	L13
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.section .rdata,"dr"
LC2:
	.ascii "Moving\0"
LC3:
	.ascii "Idle\0"
LC4:
	.ascii "Elevator %d: Floor %d %s\12\0"
	.text
	.globl	_showStatus
	.def	_showStatus;	.scl	2;	.type	32;	.endef
_showStatus:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L15
L18:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators+8, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L16
	movl	$LC2, %ecx
	jmp	L17
L16:
	movl	$LC3, %ecx
L17:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_elevators, %eax
	movl	(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L15:
	cmpl	$1, -12(%ebp)
	jle	L18
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
	subl	$48, %esp
	call	___main
	call	_initElevators
	movl	$3, 20(%esp)
	movl	$7, 24(%esp)
	movl	$2, 28(%esp)
	movl	$9, 32(%esp)
	movl	$5, 36(%esp)
	movl	$0, 44(%esp)
	jmp	L20
L23:
	movl	44(%esp), %eax
	movl	20(%esp,%eax,4), %eax
	movl	%eax, (%esp)
	call	_assignRequest
	movl	$0, 40(%esp)
	jmp	L21
L22:
	call	_moveElevators
	call	_showStatus
	addl	$1, 40(%esp)
L21:
	cmpl	$9, 40(%esp)
	jle	L22
	addl	$1, 44(%esp)
L20:
	cmpl	$4, 44(%esp)
	jle	L23
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
