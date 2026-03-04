	.file	"commandliness.c"
	.comm	_sheet, 20000, 5
	.section .rdata,"dr"
LC0:
	.ascii "\12--- Spreadsheet ---\0"
LC1:
	.ascii "%s\11\0"
LC2:
	.ascii ".\11\0"
	.text
	.globl	_print_sheet
	.def	_print_sheet;	.scl	2;	.type	32;	.endef
_print_sheet:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L2
L7:
	movl	$0, -16(%ebp)
	jmp	L3
L6:
	movl	-16(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-12(%ebp), %eax
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	addl	$_sheet, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L4
	movl	-16(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-12(%ebp), %eax
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	addl	$_sheet, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	jmp	L5
L4:
	movl	$LC2, (%esp)
	call	_printf
L5:
	addl	$1, -16(%ebp)
L3:
	cmpl	$9, -16(%ebp)
	jle	L6
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L2:
	cmpl	$19, -12(%ebp)
	jle	L7
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC3:
	.ascii "Invalid cell!\0"
	.text
	.globl	_edit_cell
	.def	_edit_cell;	.scl	2;	.type	32;	.endef
_edit_cell:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	js	L9
	cmpl	$19, 8(%ebp)
	jg	L9
	cmpl	$0, 12(%ebp)
	js	L9
	cmpl	$9, 12(%ebp)
	jle	L10
L9:
	movl	$LC3, (%esp)
	call	_puts
	jmp	L8
L10:
	movl	12(%ebp), %eax
	imull	$100, %eax, %edx
	movl	8(%ebp), %eax
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	leal	_sheet(%eax), %edx
	movl	$99, 8(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strncpy
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	imull	$100, %edx, %edx
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	addl	$_sheet+99, %eax
	movb	$0, (%eax)
L8:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC4:
	.ascii "SUM\0"
LC5:
	.ascii "SUM%d\0"
	.text
	.globl	_eval_formula
	.def	_eval_formula;	.scl	2;	.type	32;	.endef
_eval_formula:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$3, 8(%esp)
	movl	$LC4, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	jne	L13
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC5, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_sscanf
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	js	L14
	movl	-20(%ebp), %eax
	cmpl	$19, %eax
	jle	L15
L14:
	movl	$0, %eax
	jmp	L20
L15:
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L17
L19:
	movl	-20(%ebp), %eax
	movl	-16(%ebp), %edx
	imull	$100, %edx, %edx
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	addl	$_sheet, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L18
	movl	-20(%ebp), %eax
	movl	-16(%ebp), %edx
	imull	$100, %edx, %edx
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	addl	$_sheet, %eax
	movl	%eax, (%esp)
	call	_atoi
	addl	%eax, -12(%ebp)
L18:
	addl	$1, -16(%ebp)
L17:
	cmpl	$9, -16(%ebp)
	jle	L19
	movl	-12(%ebp), %eax
	jmp	L20
L13:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_atoi
L20:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC6:
	.ascii "w\0"
LC7:
	.ascii "fopen\0"
LC8:
	.ascii "%s,\0"
LC9:
	.ascii "Saved to %s\12\0"
	.text
	.globl	_save_sheet
	.def	_save_sheet;	.scl	2;	.type	32;	.endef
_save_sheet:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC6, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jne	L22
	movl	$LC7, (%esp)
	call	_perror
	jmp	L21
L22:
	movl	$0, -12(%ebp)
	jmp	L24
L27:
	movl	$0, -16(%ebp)
	jmp	L25
L26:
	movl	-16(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-12(%ebp), %eax
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	addl	$_sheet, %eax
	movl	%eax, 8(%esp)
	movl	$LC8, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	addl	$1, -16(%ebp)
L25:
	cmpl	$9, -16(%ebp)
	jle	L26
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	_fputc
	addl	$1, -12(%ebp)
L24:
	cmpl	$19, -12(%ebp)
	jle	L27
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
L21:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC10:
	.ascii "r\0"
LC11:
	.ascii ",\0"
LC12:
	.ascii "Loaded from %s\12\0"
	.text
	.globl	_load_sheet
	.def	_load_sheet;	.scl	2;	.type	32;	.endef
_load_sheet:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$1048, %esp
	movl	$LC10, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jne	L29
	movl	$LC7, (%esp)
	call	_perror
	jmp	L28
L29:
	movl	$0, -12(%ebp)
	jmp	L31
L36:
	movl	$LC11, 4(%esp)
	leal	-1024(%ebp), %eax
	movl	%eax, (%esp)
	call	_strtok
	movl	%eax, -16(%ebp)
	movl	$0, -20(%ebp)
	jmp	L32
L34:
	movl	-20(%ebp), %eax
	imull	$100, %eax, %edx
	movl	-12(%ebp), %eax
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	leal	_sheet(%eax), %edx
	movl	$99, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strncpy
	movl	-20(%ebp), %edx
	movl	-12(%ebp), %eax
	imull	$100, %edx, %edx
	imull	$1000, %eax, %eax
	addl	%edx, %eax
	addl	$_sheet+99, %eax
	movb	$0, (%eax)
	movl	$LC11, 4(%esp)
	movl	$0, (%esp)
	call	_strtok
	movl	%eax, -16(%ebp)
	addl	$1, -20(%ebp)
L32:
	cmpl	$0, -16(%ebp)
	je	L33
	cmpl	$9, -20(%ebp)
	jle	L34
L33:
	addl	$1, -12(%ebp)
L31:
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$1000, 4(%esp)
	leal	-1024(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	testl	%eax, %eax
	je	L35
	cmpl	$19, -12(%ebp)
	jle	L36
L35:
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
L28:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC13:
	.ascii "\12Commands: print, edit r c val, eval formula, save file, load file, quit\12> \0"
LC14:
	.ascii "\12\0"
LC15:
	.ascii "quit\0"
LC16:
	.ascii "print\0"
LC17:
	.ascii "edit\0"
LC18:
	.ascii "edit %d %d %s\0"
LC19:
	.ascii "Usage: edit row col value\0"
LC20:
	.ascii "eval\0"
LC21:
	.ascii "eval %s\0"
LC22:
	.ascii "Result = %d\12\0"
LC23:
	.ascii "save\0"
LC24:
	.ascii "save %s\0"
LC25:
	.ascii "load\0"
LC26:
	.ascii "load %s\0"
LC27:
	.ascii "Unknown command.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$256, %esp
	call	___main
L52:
	movl	$LC13, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	testl	%eax, %eax
	je	L54
	movl	$LC14, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, 152(%esp,%eax)
	movl	$LC15, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L55
	movl	$LC16, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L41
	call	_print_sheet
	jmp	L52
L41:
	movl	$4, 8(%esp)
	movl	$LC17, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	jne	L43
	leal	44(%esp), %eax
	movl	%eax, 16(%esp)
	leal	144(%esp), %eax
	movl	%eax, 12(%esp)
	leal	148(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC18, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_sscanf
	cmpl	$3, %eax
	jne	L44
	movl	144(%esp), %edx
	movl	148(%esp), %eax
	leal	44(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_edit_cell
	jmp	L52
L44:
	movl	$LC19, (%esp)
	call	_puts
	jmp	L52
L43:
	movl	$4, 8(%esp)
	movl	$LC20, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	jne	L46
	leal	44(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC21, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_sscanf
	cmpl	$1, %eax
	jne	L52
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_eval_formula
	movl	%eax, 252(%esp)
	movl	252(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC22, (%esp)
	call	_printf
	jmp	L52
L46:
	movl	$4, 8(%esp)
	movl	$LC23, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	jne	L48
	leal	44(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC24, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_sscanf
	cmpl	$1, %eax
	jne	L52
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_save_sheet
	jmp	L52
L48:
	movl	$4, 8(%esp)
	movl	$LC25, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	jne	L50
	leal	44(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC26, 4(%esp)
	leal	152(%esp), %eax
	movl	%eax, (%esp)
	call	_sscanf
	cmpl	$1, %eax
	jne	L52
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_load_sheet
	jmp	L52
L50:
	movl	$LC27, (%esp)
	call	_puts
	jmp	L52
L54:
	nop
	jmp	L39
L55:
	nop
L39:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_strncpy;	.scl	2;	.type	32;	.endef
	.def	_strncmp;	.scl	2;	.type	32;	.endef
	.def	_sscanf;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_strtok;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
