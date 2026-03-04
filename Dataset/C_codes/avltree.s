	.file	"avltree.c"
	.text
	.globl	_max
	.def	_max;	.scl	2;	.type	32;	.endef
_max:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%edx, %eax
	jge	L3
	movl	%edx, %eax
L3:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_height
	.def	_height;	.scl	2;	.type	32;	.endef
_height:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$0, 8(%ebp)
	je	L5
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	jmp	L7
L5:
	movl	$0, %eax
L7:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_newNode
	.def	_newNode;	.scl	2;	.type	32;	.endef
_newNode:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	$1, 4(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_rightRotate
	.def	_rightRotate;	.scl	2;	.type	32;	.endef
_rightRotate:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-8(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	_max
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%eax, %ebx
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	_max
	leal	1(%eax), %edx
	movl	-8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-8(%ebp), %eax
	addl	$24, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_leftRotate
	.def	_leftRotate;	.scl	2;	.type	32;	.endef
_leftRotate:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-8(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	_max
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%eax, %ebx
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	_max
	leal	1(%eax), %edx
	movl	-8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-8(%ebp), %eax
	addl	$24, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_getBalance
	.def	_getBalance;	.scl	2;	.type	32;	.endef
_getBalance:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$4, %esp
	.cfi_offset 3, -12
	cmpl	$0, 8(%ebp)
	je	L15
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	subl	%eax, %ebx
	movl	%ebx, %eax
	jmp	L17
L15:
	movl	$0, %eax
L17:
	addl	$4, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_insert
	.def	_insert;	.scl	2;	.type	32;	.endef
_insert:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	cmpl	$0, 8(%ebp)
	jne	L19
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_newNode
	jmp	L20
L19:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jle	L21
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_insert
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	jmp	L22
L21:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jge	L23
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_insert
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	jmp	L22
L23:
	movl	8(%ebp), %eax
	jmp	L20
L22:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_height
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	_max
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_getBalance
	movl	%eax, -12(%ebp)
	cmpl	$1, -12(%ebp)
	jle	L24
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jle	L24
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rightRotate
	jmp	L20
L24:
	cmpl	$-1, -12(%ebp)
	jge	L25
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jge	L25
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_leftRotate
	jmp	L20
L25:
	cmpl	$1, -12(%ebp)
	jle	L26
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jge	L26
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_leftRotate
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rightRotate
	jmp	L20
L26:
	cmpl	$-1, -12(%ebp)
	jge	L27
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jle	L27
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_rightRotate
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_leftRotate
	jmp	L20
L27:
	movl	8(%ebp), %eax
L20:
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
