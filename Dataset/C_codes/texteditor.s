	.file	"texteditor.c"
	.comm	_lines, 4000, 5
	.globl	_line_count
	.bss
	.align 4
_line_count:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
LC1:
	.ascii "fopen\0"
LC2:
	.ascii "\12\0"
	.text
	.globl	_load_file
	.def	_load_file;	.scl	2;	.type	32;	.endef
_load_file:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$292, %esp
	.cfi_offset 3, -12
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L2
	movl	$LC1, (%esp)
	call	_perror
	jmp	L1
L2:
	movl	$0, _line_count
	jmp	L4
L6:
	movl	$LC2, 4(%esp)
	leal	-268(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -268(%ebp,%eax)
	movl	_line_count, %ebx
	leal	-268(%ebp), %eax
	movl	%eax, (%esp)
	call	_strdup
	movl	%eax, _lines(,%ebx,4)
	movl	_line_count, %eax
	addl	$1, %eax
	movl	%eax, _line_count
L4:
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$256, 4(%esp)
	leal	-268(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	testl	%eax, %eax
	je	L5
	movl	_line_count, %eax
	cmpl	$999, %eax
	jle	L6
L5:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
L1:
	addl	$292, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC3:
	.ascii "w\0"
LC4:
	.ascii "%s\12\0"
	.text
	.globl	_save_file
	.def	_save_file;	.scl	2;	.type	32;	.endef
_save_file:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC3, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L8
	movl	$LC1, (%esp)
	call	_perror
	jmp	L7
L8:
	movl	$0, -12(%ebp)
	jmp	L10
L11:
	movl	-12(%ebp), %eax
	movl	_lines(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	addl	$1, -12(%ebp)
L10:
	movl	_line_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L11
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC5:
	.ascii "Buffer full!\0"
LC6:
	.ascii "Invalid position!\0"
	.text
	.globl	_insert_line
	.def	_insert_line;	.scl	2;	.type	32;	.endef
_insert_line:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_line_count, %eax
	cmpl	$999, %eax
	jle	L13
	movl	$LC5, (%esp)
	call	_puts
	jmp	L12
L13:
	cmpl	$0, 8(%ebp)
	js	L15
	movl	_line_count, %eax
	cmpl	%eax, 8(%ebp)
	jle	L16
L15:
	movl	$LC6, (%esp)
	call	_puts
	jmp	L12
L16:
	movl	_line_count, %eax
	movl	%eax, -12(%ebp)
	jmp	L17
L18:
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	_lines(,%eax,4), %edx
	movl	-12(%ebp), %eax
	movl	%edx, _lines(,%eax,4)
	subl	$1, -12(%ebp)
L17:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jg	L18
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_strdup
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, _lines(,%eax,4)
	movl	_line_count, %eax
	addl	$1, %eax
	movl	%eax, _line_count
L12:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_delete_line
	.def	_delete_line;	.scl	2;	.type	32;	.endef
_delete_line:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	js	L20
	movl	_line_count, %eax
	cmpl	%eax, 8(%ebp)
	jl	L21
L20:
	movl	$LC6, (%esp)
	call	_puts
	jmp	L19
L21:
	movl	8(%ebp), %eax
	movl	_lines(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_free
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L23
L24:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	_lines(,%eax,4), %edx
	movl	-12(%ebp), %eax
	movl	%edx, _lines(,%eax,4)
	addl	$1, -12(%ebp)
L23:
	movl	_line_count, %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jg	L24
	movl	_line_count, %eax
	subl	$1, %eax
	movl	%eax, _line_count
L19:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC7:
	.ascii "Line %d: %s\12\0"
	.text
	.globl	_search_text
	.def	_search_text;	.scl	2;	.type	32;	.endef
_search_text:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L26
L28:
	movl	-12(%ebp), %eax
	movl	_lines(,%eax,4), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strstr
	testl	%eax, %eax
	je	L27
	movl	-12(%ebp), %eax
	movl	_lines(,%eax,4), %eax
	movl	-12(%ebp), %edx
	addl	$1, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
L27:
	addl	$1, -12(%ebp)
L26:
	movl	_line_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L28
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC8:
	.ascii "%d: %s\12\0"
	.text
	.globl	_print_lines
	.def	_print_lines;	.scl	2;	.type	32;	.endef
_print_lines:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L30
L31:
	movl	-12(%ebp), %eax
	movl	_lines(,%eax,4), %eax
	movl	-12(%ebp), %edx
	addl	$1, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L30:
	movl	_line_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L31
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC9:
	.ascii "Enter filename: \0"
LC10:
	.ascii "%s\0"
LC11:
	.ascii "\12--- Text Editor Menu ---\0"
LC12:
	.ascii "1. Print Lines\0"
LC13:
	.ascii "2. Insert Line\0"
LC14:
	.ascii "3. Delete Line\0"
LC15:
	.ascii "4. Search Text\0"
LC16:
	.ascii "5. Save & Exit\0"
LC17:
	.ascii "Choice: \0"
LC18:
	.ascii "%d\0"
LC19:
	.ascii "Enter position: \0"
LC20:
	.ascii "Enter text: \0"
LC21:
	.ascii "Enter search pattern: \0"
LC22:
	.ascii "Saved. Exiting.\0"
LC23:
	.ascii "Invalid choice.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$384, %esp
	call	___main
	movl	$LC9, (%esp)
	call	_printf
	leal	280(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	call	_getchar
	leal	280(%esp), %eax
	movl	%eax, (%esp)
	call	_load_file
L45:
	movl	$LC11, (%esp)
	call	_puts
	movl	$LC12, (%esp)
	call	_puts
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	movl	$LC15, (%esp)
	call	_puts
	movl	$LC16, (%esp)
	call	_puts
	movl	$LC17, (%esp)
	call	_printf
	leal	276(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_scanf
	call	_getchar
	movl	276(%esp), %eax
	cmpl	$5, %eax
	ja	L33
	movl	L35(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L35:
	.long	L33
	.long	L34
	.long	L36
	.long	L37
	.long	L38
	.long	L39
	.text
L34:
	call	_print_lines
	jmp	L44
L36:
	movl	$LC19, (%esp)
	call	_printf
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_scanf
	call	_getchar
	movl	$LC20, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$256, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC2, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, 20(%esp,%eax)
	movl	16(%esp), %eax
	leal	-1(%eax), %edx
	leal	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_insert_line
	jmp	L44
L37:
	movl	$LC19, (%esp)
	call	_printf
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_scanf
	call	_getchar
	movl	16(%esp), %eax
	subl	$1, %eax
	movl	%eax, (%esp)
	call	_delete_line
	jmp	L44
L38:
	movl	$LC21, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$256, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC2, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, 20(%esp,%eax)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_search_text
	jmp	L44
L39:
	leal	280(%esp), %eax
	movl	%eax, (%esp)
	call	_save_file
	movl	$LC22, (%esp)
	call	_puts
	movl	$0, 380(%esp)
	jmp	L41
L42:
	movl	380(%esp), %eax
	movl	_lines(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_free
	addl	$1, 380(%esp)
L41:
	movl	_line_count, %eax
	cmpl	%eax, 380(%esp)
	jl	L42
	movl	$0, %eax
	jmp	L46
L33:
	movl	$LC23, (%esp)
	call	_puts
L44:
	jmp	L45
L46:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
	.def	_strdup;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_strstr;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
