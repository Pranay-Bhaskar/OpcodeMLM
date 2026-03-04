	.file	"vmm.c"
	.comm	_file, 80, 5
	.text
	.globl	_initFile
	.def	_initFile;	.scl	2;	.type	32;	.endef
_initFile:
LFB17:
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
	movl	-4(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, _file(,%eax,8)
	movl	-4(%ebp), %eax
	movl	$0, _file+4(,%eax,8)
	addl	$1, -4(%ebp)
L2:
	cmpl	$9, -4(%ebp)
	jle	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC0:
	.ascii "Chunk %d downloaded.\12\0"
LC1:
	.ascii "Chunk %d already downloaded.\12\0"
	.text
	.globl	_downloadChunk
	.def	_downloadChunk;	.scl	2;	.type	32;	.endef
_downloadChunk:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	_file+4(,%eax,8), %eax
	testl	%eax, %eax
	jne	L5
	movl	8(%ebp), %eax
	movl	$1, _file+4(,%eax,8)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	jmp	L7
L5:
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
L7:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
	.align 4
LC2:
	.ascii "Progress: %d/%d chunks downloaded.\12\0"
	.text
	.globl	_showProgress
	.def	_showProgress;	.scl	2;	.type	32;	.endef
_showProgress:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L9
L11:
	movl	-16(%ebp), %eax
	movl	_file+4(,%eax,8), %eax
	testl	%eax, %eax
	je	L10
	addl	$1, -12(%ebp)
L10:
	addl	$1, -16(%ebp)
L9:
	cmpl	$9, -16(%ebp)
	jle	L11
	movl	$10, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	nop
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
	call	_initFile
	movl	$3, (%esp)
	call	_downloadChunk
	movl	$7, (%esp)
	call	_downloadChunk
	call	_showProgress
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
