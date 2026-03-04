	.file	"crudop.c"
	.comm	_db, 6000, 5
	.globl	_count
	.bss
	.align 4
_count:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "w\0"
LC1:
	.ascii "fopen\0"
LC2:
	.ascii "%d,%s,%d\12\0"
	.text
	.globl	_save_db
	.def	_save_db;	.scl	2;	.type	32;	.endef
_save_db:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L2
	movl	$LC1, (%esp)
	call	_perror
	jmp	L1
L2:
	movl	$0, -12(%ebp)
	jmp	L4
L5:
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db+56, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	leal	4(%eax), %ecx
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	movl	(%eax), %eax
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	addl	$1, -12(%ebp)
L4:
	movl	_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L5
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC3:
	.ascii "r\0"
LC4:
	.ascii "%d,%49[^,],%d\12\0"
	.text
	.globl	_load_db
	.def	_load_db;	.scl	2;	.type	32;	.endef
_load_db:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC3, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	je	L11
	movl	$0, _count
	jmp	L9
L10:
	movl	_count, %eax
	addl	$1, %eax
	movl	%eax, _count
L9:
	movl	_count, %eax
	imull	$60, %eax, %eax
	addl	$48, %eax
	addl	$_db, %eax
	leal	8(%eax), %ecx
	movl	_count, %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	leal	4(%eax), %edx
	movl	_count, %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	cmpl	$3, %eax
	je	L10
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	jmp	L6
L11:
	nop
L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC5:
	.ascii "DB full!\0"
LC6:
	.ascii "Enter ID: \0"
LC7:
	.ascii "%d\0"
LC8:
	.ascii "Enter Name: \0"
LC9:
	.ascii "%s\0"
LC10:
	.ascii "Enter Age: \0"
LC11:
	.ascii "Record added.\0"
	.text
	.globl	_create_record
	.def	_create_record;	.scl	2;	.type	32;	.endef
_create_record:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	_count, %eax
	cmpl	$99, %eax
	jle	L13
	movl	$LC5, (%esp)
	call	_puts
	jmp	L12
L13:
	movl	$LC6, (%esp)
	call	_printf
	leal	-68(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	$LC8, (%esp)
	call	_printf
	leal	-68(%ebp), %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_scanf
	movl	$LC10, (%esp)
	call	_printf
	leal	-68(%ebp), %eax
	addl	$56, %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	_count, %eax
	leal	1(%eax), %edx
	movl	%edx, _count
	imull	$60, %eax, %eax
	addl	$_db, %eax
	movl	-68(%ebp), %edx
	movl	%edx, (%eax)
	movl	-64(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-60(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-56(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-52(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-48(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	-44(%ebp), %edx
	movl	%edx, 24(%eax)
	movl	-40(%ebp), %edx
	movl	%edx, 28(%eax)
	movl	-36(%ebp), %edx
	movl	%edx, 32(%eax)
	movl	-32(%ebp), %edx
	movl	%edx, 36(%eax)
	movl	-28(%ebp), %edx
	movl	%edx, 40(%eax)
	movl	-24(%ebp), %edx
	movl	%edx, 44(%eax)
	movl	-20(%ebp), %edx
	movl	%edx, 48(%eax)
	movl	-16(%ebp), %edx
	movl	%edx, 52(%eax)
	movl	-12(%ebp), %edx
	movl	%edx, 56(%eax)
	movl	$LC11, (%esp)
	call	_puts
L12:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC12:
	.ascii "ID\11Name\11Age\0"
LC13:
	.ascii "%d\11%s\11%d\12\0"
	.text
	.globl	_read_records
	.def	_read_records;	.scl	2;	.type	32;	.endef
_read_records:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC12, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L16
L17:
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db+56, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	leal	4(%eax), %ecx
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L16:
	movl	_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L17
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC14:
	.ascii "Enter ID to update: \0"
LC15:
	.ascii "Enter new Name: \0"
LC16:
	.ascii "Enter new Age: \0"
LC17:
	.ascii "Record updated.\0"
LC18:
	.ascii "Record not found.\0"
	.text
	.globl	_update_record
	.def	_update_record;	.scl	2;	.type	32;	.endef
_update_record:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC14, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	jmp	L19
L22:
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	cmpl	%eax, %edx
	jne	L20
	movl	$LC15, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_scanf
	movl	$LC16, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$48, %eax
	addl	$_db, %eax
	addl	$8, %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	$LC17, (%esp)
	call	_puts
	jmp	L18
L20:
	addl	$1, -12(%ebp)
L19:
	movl	_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L22
	movl	$LC18, (%esp)
	call	_puts
L18:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC19:
	.ascii "Enter ID to delete: \0"
LC20:
	.ascii "Record deleted.\0"
	.text
	.globl	_delete_record
	.def	_delete_record;	.scl	2;	.type	32;	.endef
_delete_record:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC19, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	jmp	L25
L30:
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	cmpl	%eax, %edx
	jne	L26
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L27
L28:
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	-16(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_db, %eax
	imull	$60, %edx, %edx
	addl	$_db, %edx
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%edx), %ecx
	movl	%ecx, 12(%eax)
	movl	16(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	20(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	24(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	28(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	32(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	36(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	40(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	44(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	48(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	52(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	56(%edx), %edx
	movl	%edx, 56(%eax)
	addl	$1, -16(%ebp)
L27:
	movl	_count, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L28
	movl	_count, %eax
	subl	$1, %eax
	movl	%eax, _count
	movl	$LC20, (%esp)
	call	_puts
	jmp	L24
L26:
	addl	$1, -12(%ebp)
L25:
	movl	_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L30
	movl	$LC18, (%esp)
	call	_puts
L24:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC21:
	.ascii "\12--- Text Database Menu ---\0"
LC22:
	.ascii "1. Create Record\0"
LC23:
	.ascii "2. Read Records\0"
LC24:
	.ascii "3. Update Record\0"
LC25:
	.ascii "4. Delete Record\0"
LC26:
	.ascii "5. Save & Exit\0"
LC27:
	.ascii "Choice: \0"
LC28:
	.ascii "Saved. Exiting.\0"
LC29:
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
	subl	$48, %esp
	call	___main
	movl	$1635017060, 35(%esp)
	movl	$1702060386, 39(%esp)
	movl	$1954051118, 43(%esp)
	movb	$0, 47(%esp)
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_load_db
L42:
	movl	$LC21, (%esp)
	call	_puts
	movl	$LC22, (%esp)
	call	_puts
	movl	$LC23, (%esp)
	call	_puts
	movl	$LC24, (%esp)
	call	_puts
	movl	$LC25, (%esp)
	call	_puts
	movl	$LC26, (%esp)
	call	_puts
	movl	$LC27, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	28(%esp), %eax
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
	call	_create_record
	jmp	L40
L36:
	call	_read_records
	jmp	L40
L37:
	call	_update_record
	jmp	L40
L38:
	call	_delete_record
	jmp	L40
L39:
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_save_db
	movl	$LC28, (%esp)
	call	_puts
	movl	$0, %eax
	jmp	L43
L33:
	movl	$LC29, (%esp)
	call	_puts
L40:
	jmp	L42
L43:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
