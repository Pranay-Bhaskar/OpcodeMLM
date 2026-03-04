	.file	"linkcut.c"
	.text
	.globl	_createNode
	.def	_createNode;	.scl	2;	.type	32;	.endef
_createNode:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$24, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-12(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 20(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_push
	.def	_push;	.scl	2;	.type	32;	.endef
_push:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	cmpl	$0, 8(%ebp)
	je	L7
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	L7
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L5
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%ebp), %edx
	movl	(%edx), %edx
	movl	20(%edx), %edx
	xorl	$1, %edx
	movl	%edx, 20(%eax)
L5:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	L6
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	8(%ebp), %edx
	movl	4(%edx), %edx
	movl	20(%edx), %edx
	xorl	$1, %edx
	movl	%edx, 20(%eax)
L6:
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
L7:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_update
	.def	_update;	.scl	2;	.type	32;	.endef
_update:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$0, 8(%ebp)
	je	L12
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L11
	movl	8(%ebp), %eax
	movl	16(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	16(%eax), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
L11:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	L8
	movl	8(%ebp), %eax
	movl	16(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	16(%eax), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
	jmp	L8
L12:
	nop
L8:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_isRoot
	.def	_isRoot;	.scl	2;	.type	32;	.endef
_isRoot:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	L14
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	je	L15
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %eax
	cmpl	8(%ebp), %eax
	je	L15
L14:
	movl	$1, %eax
	jmp	L17
L15:
	movl	$0, %eax
L17:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_rotate
	.def	_rotate;	.scl	2;	.type	32;	.endef
_rotate:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	jne	L19
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-4(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	L20
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 8(%eax)
L20:
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L21
L19:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-4(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L22
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 8(%eax)
L22:
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
L21:
	movl	-4(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	%edx, 8(%eax)
	cmpl	$0, -8(%ebp)
	je	L23
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-4(%ebp), %eax
	jne	L24
	movl	-8(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L23
L24:
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-4(%ebp), %eax
	jne	L23
	movl	-8(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
L23:
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	_update
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_update
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_splay
	.def	_splay;	.scl	2;	.type	32;	.endef
_splay:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	jmp	L26
L29:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	_isRoot
	testl	%eax, %eax
	jne	L27
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	sete	%dl
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-4(%ebp), %eax
	sete	%al
	xorl	%edx, %eax
	testb	%al, %al
	je	L28
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rotate
	jmp	L27
L28:
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	_rotate
L27:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rotate
L26:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_isRoot
	testl	%eax, %eax
	je	L29
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_access
	.def	_access;	.scl	2;	.type	32;	.endef
_access:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	$0, -4(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	jmp	L31
L32:
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	_splay
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	_update
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -8(%ebp)
L31:
	cmpl	$0, -8(%ebp)
	jne	L32
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_splay
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.globl	_makeRoot
	.def	_makeRoot;	.scl	2;	.type	32;	.endef
_makeRoot:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_access
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	xorl	$1, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_findRoot
	.def	_findRoot;	.scl	2;	.type	32;	.endef
_findRoot:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_access
	jmp	L36
L37:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 8(%ebp)
L36:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L37
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_splay
	movl	8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.globl	_link
	.def	_link;	.scl	2;	.type	32;	.endef
_link:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_makeRoot
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_findRoot
	cmpl	8(%ebp), %eax
	je	L41
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
L41:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_cut
	.def	_cut;	.scl	2;	.type	32;	.endef
_cut:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_makeRoot
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_access
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	jne	L44
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L44
	movl	12(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_update
L44:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_query
	.def	_query;	.scl	2;	.type	32;	.endef
_query:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_makeRoot
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_access
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "\12--- Link-Cut Tree Toolkit ---\0"
LC1:
	.ascii "1. Create Nodes\0"
LC2:
	.ascii "2. Link Nodes\0"
LC3:
	.ascii "3. Cut Nodes\0"
LC4:
	.ascii "4. Query Path Sum\0"
LC5:
	.ascii "0. Exit\0"
LC6:
	.ascii "Choice: \0"
LC7:
	.ascii "%d\0"
LC8:
	.ascii "Enter number of nodes: \0"
LC9:
	.ascii "Value of node %d: \0"
LC10:
	.ascii "Nodes created.\0"
LC11:
	.ascii "Enter nodes u v to link: \0"
LC12:
	.ascii "%d %d\0"
LC13:
	.ascii "Linked %d -> %d\12\0"
LC14:
	.ascii "Invalid nodes.\0"
LC15:
	.ascii "Enter nodes u v to cut: \0"
LC16:
	.ascii "Cut edge %d - %d\12\0"
	.align 4
LC17:
	.ascii "Enter nodes u v to query path sum: \0"
LC18:
	.ascii "Path sum = %d\12\0"
LC19:
	.ascii "Exiting...\0"
LC20:
	.ascii "Invalid choice!\0"
	.text
	.globl	_menu
	.def	_menu;	.scl	2;	.type	32;	.endef
_menu:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	movl	$4068, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 7, -12
	leal	-4012(%ebp), %edx
	movl	$0, %eax
	movl	$1000, %ecx
	movl	%edx, %edi
	rep stosl
	movl	$0, -4020(%ebp)
L64:
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_puts
	movl	$LC6, (%esp)
	call	_printf
	leal	-4016(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	-4016(%ebp), %eax
	cmpl	$4, %eax
	ja	L48
	movl	L50(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L50:
	.long	L49
	.long	L51
	.long	L52
	.long	L53
	.long	L54
	.text
L51:
	movl	$LC8, (%esp)
	call	_printf
	leal	-4020(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	jmp	L55
L56:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	leal	-4024(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	-4024(%ebp), %eax
	movl	%eax, (%esp)
	call	_createNode
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, -4012(%ebp,%eax,4)
	addl	$1, -12(%ebp)
L55:
	movl	-4020(%ebp), %eax
	cmpl	%eax, -12(%ebp)
	jl	L56
	movl	$LC10, (%esp)
	call	_puts
	jmp	L57
L52:
	movl	$LC11, (%esp)
	call	_printf
	leal	-4032(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-4028(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	-4028(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	testl	%eax, %eax
	je	L58
	movl	-4032(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	testl	%eax, %eax
	je	L58
	movl	-4032(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %edx
	movl	-4028(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_link
	movl	-4032(%ebp), %edx
	movl	-4028(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	jmp	L59
L58:
	movl	$LC14, (%esp)
	call	_puts
L59:
	nop
	jmp	L57
L53:
	movl	$LC15, (%esp)
	call	_printf
	leal	-4040(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-4036(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	-4036(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	testl	%eax, %eax
	je	L60
	movl	-4040(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	testl	%eax, %eax
	je	L60
	movl	-4040(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %edx
	movl	-4036(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_cut
	movl	-4040(%ebp), %edx
	movl	-4036(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	jmp	L61
L60:
	movl	$LC14, (%esp)
	call	_puts
L61:
	nop
	jmp	L57
L54:
	movl	$LC17, (%esp)
	call	_printf
	leal	-4048(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-4044(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	-4044(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	testl	%eax, %eax
	je	L62
	movl	-4048(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	testl	%eax, %eax
	je	L62
	movl	-4048(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %edx
	movl	-4044(%ebp), %eax
	movl	-4012(%ebp,%eax,4), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_query
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	jmp	L63
L62:
	movl	$LC14, (%esp)
	call	_puts
L63:
	nop
	jmp	L57
L49:
	movl	$LC19, (%esp)
	call	_puts
	jmp	L57
L48:
	movl	$LC20, (%esp)
	call	_puts
L57:
	movl	-4016(%ebp), %eax
	testl	%eax, %eax
	jne	L64
	nop
	addl	$4068, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	call	_menu
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
