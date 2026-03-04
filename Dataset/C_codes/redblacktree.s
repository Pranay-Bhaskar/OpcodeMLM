	.file	"redblacktree.c"
	.globl	_root
	.bss
	.align 4
_root:
	.space 4
	.text
	.globl	_createNode
	.def	_createNode;	.scl	2;	.type	32;	.endef
_createNode:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$20, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 16(%eax)
	movl	-12(%ebp), %eax
	movl	16(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	12(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_rotateLeft
	.def	_rotateLeft;	.scl	2;	.type	32;	.endef
_rotateLeft:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	8(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	L4
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 16(%eax)
L4:
	movl	12(%ebp), %eax
	movl	16(%eax), %edx
	movl	-4(%ebp), %eax
	movl	%edx, 16(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	jne	L5
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L6
L5:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	8(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L7
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L6
L7:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 12(%eax)
L6:
	movl	-4(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 16(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_rotateRight
	.def	_rotateRight;	.scl	2;	.type	32;	.endef
_rotateRight:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	12(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	L9
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 16(%eax)
L9:
	movl	12(%ebp), %eax
	movl	16(%eax), %edx
	movl	-4(%ebp), %eax
	movl	%edx, 16(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	jne	L10
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L11
L10:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	8(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L12
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L11
L12:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 12(%eax)
L11:
	movl	-4(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 16(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_fixInsert
	.def	_fixInsert;	.scl	2;	.type	32;	.endef
_fixInsert:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	jmp	L14
L22:
	movl	12(%ebp), %eax
	movl	16(%eax), %edx
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %edx
	jne	L15
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	12(%eax), %eax
	movl	%eax, -4(%ebp)
	cmpl	$0, -4(%ebp)
	je	L16
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L16
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	$1, 4(%eax)
	movl	-4(%ebp), %eax
	movl	$1, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	$0, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	%eax, 12(%ebp)
	jmp	L14
L16:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	12(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L18
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rotateLeft
L18:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	$1, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	$0, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rotateRight
	jmp	L14
L15:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, -8(%ebp)
	cmpl	$0, -8(%ebp)
	je	L19
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L19
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	$1, 4(%eax)
	movl	-8(%ebp), %eax
	movl	$1, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	$0, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	%eax, 12(%ebp)
	jmp	L14
L19:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	8(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L20
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rotateRight
L20:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	$1, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	$0, 4(%eax)
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	16(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rotateLeft
L14:
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	L21
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	L22
L21:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, 4(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_insert
	.def	_insert;	.scl	2;	.type	32;	.endef
_insert:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_createNode
	movl	%eax, -20(%ebp)
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L24
L26:
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jge	L25
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L24
L25:
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -16(%ebp)
L24:
	cmpl	$0, -16(%ebp)
	jne	L26
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 16(%eax)
	cmpl	$0, -12(%ebp)
	jne	L27
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L28
L27:
	movl	-20(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jge	L29
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	jmp	L28
L29:
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 12(%eax)
L28:
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fixInsert
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC0:
	.ascii "R\0"
LC1:
	.ascii "B\0"
LC2:
	.ascii "%d(%s) \0"
	.text
	.globl	_inorder
	.def	_inorder;	.scl	2;	.type	32;	.endef
_inorder:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	je	L35
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_inorder
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L33
	movl	$LC0, %edx
	jmp	L34
L33:
	movl	$LC1, %edx
L34:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_inorder
	jmp	L30
L35:
	nop
L30:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$10, 4(%esp)
	movl	$_root, (%esp)
	call	_insert
	movl	$20, 4(%esp)
	movl	$_root, (%esp)
	call	_insert
	movl	$30, 4(%esp)
	movl	$_root, (%esp)
	call	_insert
	movl	$15, 4(%esp)
	movl	$_root, (%esp)
	call	_insert
	movl	_root, %eax
	movl	%eax, (%esp)
	call	_inorder
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
