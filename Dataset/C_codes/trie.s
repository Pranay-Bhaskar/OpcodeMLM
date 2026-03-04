	.file	"trie.c"
	.text
	.globl	_newNode
	.def	_newNode;	.scl	2;	.type	32;	.endef
_newNode:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$108, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movb	$0, 104(%eax)
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	$0, (%eax,%edx,4)
	addl	$1, -12(%ebp)
L2:
	cmpl	$25, -12(%ebp)
	jle	L3
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_insert
	.def	_insert;	.scl	2;	.type	32;	.endef
_insert:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L6
L8:
	movl	-16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$97, %eax
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	L7
	call	_newNode
	movl	%eax, %ecx
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%ecx, (%eax,%edx,4)
L7:
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -12(%ebp)
	addl	$1, -16(%ebp)
L6:
	movl	-16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L8
	movl	-12(%ebp), %eax
	movb	$1, 104(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_search
	.def	_search;	.scl	2;	.type	32;	.endef
_search:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L10
L13:
	movl	-8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$97, %eax
	movl	%eax, -12(%ebp)
	movl	-4(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	L11
	movl	$0, %eax
	jmp	L12
L11:
	movl	-4(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
L10:
	movl	-8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L13
	movl	-4(%ebp), %eax
	movzbl	104(%eax), %eax
L12:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
