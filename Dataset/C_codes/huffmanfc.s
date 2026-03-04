	.file	"huffmanfc.c"
	.comm	_codes, 65536, 5
	.text
	.globl	_newNode
	.def	_newNode;	.scl	2;	.type	32;	.endef
_newNode:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movb	%al, -28(%ebp)
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movzbl	-28(%ebp), %edx
	movb	%dl, (%eax)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
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
LFE17:
	.globl	_createHeap
	.def	_createHeap;	.scl	2;	.type	32;	.endef
_createHeap:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$1028, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	$0, 1024(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_swap
	.def	_swap;	.scl	2;	.type	32;	.endef
_swap:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_heapify
	.def	_heapify;	.scl	2;	.type	32;	.endef
_heapify:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	1024(%eax), %eax
	cmpl	-16(%ebp), %eax
	jle	L7
	movl	8(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %ecx
	jge	L7
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
L7:
	movl	8(%ebp), %eax
	movl	1024(%eax), %eax
	cmpl	-20(%ebp), %eax
	jle	L8
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %ecx
	jge	L8
	movl	-20(%ebp), %eax
	movl	%eax, -12(%ebp)
L8:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	je	L10
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_swap
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_heapify
L10:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_extractMin
	.def	_extractMin;	.scl	2;	.type	32;	.endef
_extractMin:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	1024(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	1024(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 1024(%eax)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_heapify
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.globl	_insertHeap
	.def	_insertHeap;	.scl	2;	.type	32;	.endef
_insertHeap:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	1024(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 1024(%eax)
	movl	8(%ebp), %eax
	movl	1024(%eax), %eax
	subl	$1, %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	%ecx, (%eax,%edx,4)
	jmp	L14
L16:
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_swap
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%ebp)
L14:
	cmpl	$0, -4(%ebp)
	je	L17
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	4(%eax), %edx
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movl	(%eax,%ecx,4), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jl	L16
L17:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_buildHuffmanTree
	.def	_buildHuffmanTree;	.scl	2;	.type	32;	.endef
_buildHuffmanTree:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_createHeap
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L19
L21:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jle	L20
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movsbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_newNode
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_insertHeap
L20:
	addl	$1, -12(%ebp)
L19:
	cmpl	$255, -12(%ebp)
	jle	L21
	jmp	L22
L23:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractMin
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractMin
	movl	%eax, -24(%ebp)
	movl	-20(%ebp), %eax
	movl	4(%eax), %edx
	movl	-24(%ebp), %eax
	movl	4(%eax), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$36, (%esp)
	call	_newNode
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_insertHeap
L22:
	movl	-16(%ebp), %eax
	movl	1024(%eax), %eax
	cmpl	$1, %eax
	jg	L23
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_extractMin
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.globl	_generateCodes
	.def	_generateCodes;	.scl	2;	.type	32;	.endef
_generateCodes:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$532, %esp
	.cfi_offset 7, -12
	cmpl	$0, 8(%ebp)
	je	L29
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$36, %al
	je	L28
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	sall	$8, %eax
	leal	_codes(%eax), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
L28:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-264(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcpy
	leal	-264(%ebp), %eax
	movl	$-1, %ecx
	movl	%eax, %edx
	movl	$0, %eax
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	leal	-1(%eax), %edx
	leal	-264(%ebp), %eax
	addl	%edx, %eax
	movw	$48, (%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-520(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcpy
	leal	-520(%ebp), %eax
	movl	$-1, %ecx
	movl	%eax, %edx
	movl	$0, %eax
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	leal	-1(%eax), %edx
	leal	-520(%ebp), %eax
	addl	%edx, %eax
	movw	$49, (%eax)
	movl	16(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%edx, 8(%esp)
	leal	-264(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_generateCodes
	movl	16(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%edx, 8(%esp)
	leal	-520(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_generateCodes
	jmp	L25
L29:
	nop
L25:
	addl	$532, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
LC1:
	.ascii "fopen\0"
LC2:
	.ascii "\0"
LC3:
	.ascii "w\0"
LC4:
	.ascii "Compressed to %s\12\0"
	.text
	.globl	_compress
	.def	_compress;	.scl	2;	.type	32;	.endef
_compress:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$1060, %esp
	.cfi_offset 7, -12
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L31
	movl	$LC1, (%esp)
	call	_perror
	jmp	L30
L31:
	leal	-1048(%ebp), %edx
	movl	$0, %eax
	movl	$256, %ecx
	movl	%edx, %edi
	rep stosl
	jmp	L33
L34:
	movl	-16(%ebp), %eax
	movl	-1048(%ebp,%eax,4), %eax
	leal	1(%eax), %edx
	movl	-16(%ebp), %eax
	movl	%edx, -1048(%ebp,%eax,4)
L33:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgetc
	movl	%eax, -16(%ebp)
	cmpl	$-1, -16(%ebp)
	jne	L34
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	leal	-1048(%ebp), %eax
	movl	%eax, (%esp)
	call	_buildHuffmanTree
	movl	%eax, -20(%ebp)
	movl	$0, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_generateCodes
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	movl	$LC3, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -24(%ebp)
	jmp	L35
L36:
	movl	-16(%ebp), %eax
	sall	$8, %eax
	leal	_codes(%eax), %edx
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_fputs
L35:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgetc
	movl	%eax, -16(%ebp)
	cmpl	$-1, -16(%ebp)
	jne	L36
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
L30:
	addl	$1060, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC5:
	.ascii "Decompressed to %s\12\0"
	.text
	.globl	_decompress
	.def	_decompress;	.scl	2;	.type	32;	.endef
_decompress:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC3, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	cmpl	$0, -16(%ebp)
	je	L38
	cmpl	$0, -20(%ebp)
	jne	L39
L38:
	movl	$LC1, (%esp)
	call	_perror
	jmp	L37
L39:
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L41
L44:
	cmpl	$48, -24(%ebp)
	jne	L42
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L43
L42:
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -12(%ebp)
L43:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L41
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	L41
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_fputc
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
L41:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgetc
	movl	%eax, -24(%ebp)
	cmpl	$-1, -24(%ebp)
	jne	L44
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
L37:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC6:
	.ascii "Enter input file: \0"
LC7:
	.ascii "%s\0"
	.align 4
LC8:
	.ascii "Enter compressed output file: \0"
	.align 4
LC9:
	.ascii "Enter decompressed output file: \0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	andl	$-16, %esp
	subl	$1360, %esp
	.cfi_offset 7, -12
	call	___main
	movl	$LC6, (%esp)
	call	_printf
	leal	1248(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	$LC8, (%esp)
	call	_printf
	leal	1148(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	leal	1148(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1248(%esp), %eax
	movl	%eax, (%esp)
	call	_compress
	movl	$LC9, (%esp)
	call	_printf
	leal	1048(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	$LC0, 4(%esp)
	leal	1248(%esp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, 1356(%esp)
	leal	24(%esp), %edx
	movl	$0, %eax
	movl	$256, %ecx
	movl	%edx, %edi
	rep stosl
	jmp	L46
L47:
	movl	1352(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	leal	1(%eax), %edx
	movl	1352(%esp), %eax
	movl	%edx, 24(%esp,%eax,4)
L46:
	movl	1356(%esp), %eax
	movl	%eax, (%esp)
	call	_fgetc
	movl	%eax, 1352(%esp)
	cmpl	$-1, 1352(%esp)
	jne	L47
	movl	1356(%esp), %eax
	movl	%eax, (%esp)
	call	_fclose
	leal	24(%esp), %eax
	movl	%eax, (%esp)
	call	_buildHuffmanTree
	movl	%eax, 1348(%esp)
	movl	1348(%esp), %eax
	movl	%eax, 8(%esp)
	leal	1048(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1148(%esp), %eax
	movl	%eax, (%esp)
	call	_decompress
	movl	$0, %eax
	movl	-4(%ebp), %edi
	leave
	.cfi_restore 5
	.cfi_restore 7
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_fgetc;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fputs;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
