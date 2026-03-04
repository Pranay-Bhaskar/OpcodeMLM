	.file	"tinyshell.c"
	.comm	_history, 200, 5
	.globl	_history_count
	.bss
	.align 4
_history_count:
	.space 4
	.text
	.globl	_add_history
	.def	_add_history;	.scl	2;	.type	32;	.endef
_add_history:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	_history_count, %eax
	cmpl	$49, %eax
	jg	L2
	movl	_history_count, %ebx
	leal	1(%ebx), %eax
	movl	%eax, _history_count
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__strdup
	movl	%eax, _history(,%ebx,4)
	jmp	L6
L2:
	movl	_history, %eax
	movl	%eax, (%esp)
	call	_free
	movl	$1, -12(%ebp)
	jmp	L4
L5:
	movl	-12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	movl	_history(,%eax,4), %eax
	movl	%eax, _history(,%edx,4)
	addl	$1, -12(%ebp)
L4:
	cmpl	$49, -12(%ebp)
	jle	L5
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__strdup
	movl	%eax, _history+196
L6:
	nop
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC0:
	.ascii "%d: %s\12\0"
	.text
	.globl	_print_history
	.def	_print_history;	.scl	2;	.type	32;	.endef
_print_history:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L8
L9:
	movl	-12(%ebp), %eax
	movl	_history(,%eax,4), %eax
	movl	-12(%ebp), %edx
	addl	$1, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L8:
	movl	_history_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L9
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC1:
	.ascii " \11\12\0"
	.text
	.globl	_parse_input
	.def	_parse_input;	.scl	2;	.type	32;	.endef
_parse_input:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strtok
	movl	%eax, -16(%ebp)
	jmp	L11
L13:
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%eax, (%edx)
	movl	$LC1, 4(%esp)
	movl	$0, (%esp)
	call	_strtok
	movl	%eax, -16(%ebp)
L11:
	cmpl	$0, -16(%ebp)
	je	L12
	cmpl	$62, -12(%ebp)
	jle	L13
L12:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC2:
	.ascii "exit\0"
LC3:
	.ascii "cd\0"
LC4:
	.ascii "cd: missing argument\12\0"
LC5:
	.ascii "cd failed\0"
LC6:
	.ascii "history\0"
	.text
	.globl	_builtin_cmd
	.def	_builtin_cmd;	.scl	2;	.type	32;	.endef
_builtin_cmd:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L15
	movl	$1, %eax
	jmp	L16
L15:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L17
	movl	$0, (%esp)
	call	_exit
L17:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$LC3, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L18
	movl	8(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L19
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, 12(%esp)
	movl	$21, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC4, (%esp)
	call	_fwrite
	jmp	L20
L19:
	movl	8(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	__chdir
	testl	%eax, %eax
	je	L20
	movl	$LC5, (%esp)
	call	_perror
L20:
	movl	$1, %eax
	jmp	L16
L18:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$LC6, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L21
	call	_print_history
	movl	$1, %eax
	jmp	L16
L21:
	movl	$0, %eax
L16:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "Failed to execute command: %s (Error %lu)\12\0"
	.text
	.globl	_execute_cmd
	.def	_execute_cmd;	.scl	2;	.type	32;	.endef
_execute_cmd:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$1172, %esp
	.cfi_offset 7, -12
	movl	$0, -1036(%ebp)
	leal	-1032(%ebp), %edx
	movl	$0, %eax
	movl	$255, %ecx
	movl	%edx, %edi
	rep stosl
	movl	$0, -12(%ebp)
	jmp	L23
L24:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	leal	-1036(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcat
	leal	-1036(%ebp), %eax
	movl	$-1, %ecx
	movl	%eax, %edx
	movl	$0, %eax
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	leal	-1(%eax), %edx
	leal	-1036(%ebp), %eax
	addl	%edx, %eax
	movw	$32, (%eax)
	addl	$1, -12(%ebp)
L23:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L24
	movl	$68, 8(%esp)
	movl	$0, 4(%esp)
	leal	-1104(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	movl	$68, -1104(%ebp)
	movl	$16, 8(%esp)
	movl	$0, 4(%esp)
	leal	-1120(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	leal	-1120(%ebp), %eax
	movl	%eax, 36(%esp)
	leal	-1104(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	$0, 28(%esp)
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	leal	-1036(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	_CreateProcessA@40
	subl	$40, %esp
	testl	%eax, %eax
	je	L25
	movl	-1120(%ebp), %eax
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	-1120(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
	movl	-1116(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
	jmp	L27
L25:
	call	_GetLastError@0
	movl	%eax, 12(%esp)
	leal	-1036(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC7, 4(%esp)
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_fprintf
L27:
	nop
	movl	-4(%ebp), %edi
	leave
	.cfi_restore 5
	.cfi_restore 7
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC8:
	.ascii "tinyshell> \0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$1312, %esp
	call	___main
L33:
	movl	$LC8, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$1024, 4(%esp)
	leal	284(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	testl	%eax, %eax
	je	L38
	movzbl	284(%esp), %eax
	cmpb	$10, %al
	je	L39
	leal	284(%esp), %eax
	movl	%eax, (%esp)
	call	_add_history
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	284(%esp), %eax
	movl	%eax, (%esp)
	call	_parse_input
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_builtin_cmd
	testl	%eax, %eax
	jne	L33
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_execute_cmd
	jmp	L33
L39:
	nop
	jmp	L33
L38:
	nop
	movl	$0, 1308(%esp)
	jmp	L34
L35:
	movl	1308(%esp), %eax
	movl	_history(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_free
	addl	$1, 1308(%esp)
L34:
	movl	_history_count, %eax
	cmpl	%eax, 1308(%esp)
	jl	L35
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	__strdup;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_strtok;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	__chdir;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_CreateProcessA@40;	.scl	2;	.type	32;	.endef
	.def	_WaitForSingleObject@8;	.scl	2;	.type	32;	.endef
	.def	_CloseHandle@4;	.scl	2;	.type	32;	.endef
	.def	_GetLastError@0;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
