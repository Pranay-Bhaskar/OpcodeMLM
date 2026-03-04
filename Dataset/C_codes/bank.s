	.file	"bank.c"
	.comm	_accs, 3000, 5
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
	.ascii "%d,%s,%.2f\12\0"
LC3:
	.ascii "Accounts saved.\0"
	.text
	.globl	_save
	.def	_save;	.scl	2;	.type	32;	.endef
_save:
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
	addl	$_accs+56, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	leal	4(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	movl	(%eax), %eax
	fstpl	16(%esp)
	movl	%edx, 12(%esp)
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
	movl	$LC3, (%esp)
	call	_puts
L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC5:
	.ascii "r\0"
LC6:
	.ascii "%d,%49[^,],%f\12\0"
LC7:
	.ascii "Accounts loaded.\0"
	.text
	.globl	_load
	.def	_load;	.scl	2;	.type	32;	.endef
_load:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC5, 4(%esp)
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
	addl	$_accs, %eax
	leal	8(%eax), %ecx
	movl	_count, %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	leal	4(%eax), %edx
	movl	_count, %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC6, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	cmpl	$3, %eax
	je	L10
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC7, (%esp)
	call	_puts
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
LC8:
	.ascii "Max accounts reached!\0"
LC9:
	.ascii "Enter name: \0"
LC10:
	.ascii "%s\0"
LC11:
	.ascii "Enter initial balance: \0"
LC12:
	.ascii "%f\0"
LC13:
	.ascii "Account created with ID %d.\12\0"
	.text
	.globl	_create
	.def	_create;	.scl	2;	.type	32;	.endef
_create:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	_count, %eax
	cmpl	$49, %eax
	jle	L13
	movl	$LC8, (%esp)
	call	_puts
	jmp	L12
L13:
	movl	_count, %eax
	addl	$1, %eax
	movl	%eax, -68(%ebp)
	movl	$LC9, (%esp)
	call	_printf
	leal	-68(%ebp), %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	$LC11, (%esp)
	call	_printf
	leal	-68(%ebp), %eax
	addl	$56, %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	_count, %eax
	leal	1(%eax), %edx
	movl	%edx, _count
	imull	$60, %eax, %eax
	addl	$_accs, %eax
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
	movl	-68(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
L12:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC14:
	.ascii "\12ID\11Name\11Balance\0"
LC15:
	.ascii "%d\11%s\11%.2f\12\0"
	.text
	.globl	_list
	.def	_list;	.scl	2;	.type	32;	.endef
_list:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC14, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L16
L17:
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_accs+56, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	leal	4(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	movl	(%eax), %eax
	fstpl	12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
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
LC16:
	.ascii "Enter account ID: \0"
LC17:
	.ascii "%d\0"
LC18:
	.ascii "Enter amount: \0"
LC19:
	.ascii "Invalid ID.\0"
LC20:
	.ascii "Deposited %.2f to %s.\12\0"
	.text
	.globl	_deposit
	.def	_deposit;	.scl	2;	.type	32;	.endef
_deposit:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC16, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC18, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	testl	%eax, %eax
	jle	L19
	movl	-12(%ebp), %edx
	movl	_count, %eax
	cmpl	%eax, %edx
	jle	L20
L19:
	movl	$LC19, (%esp)
	call	_puts
	jmp	L18
L20:
	movl	-12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs+56, %eax
	flds	(%eax)
	flds	-16(%ebp)
	faddp	%st, %st(1)
	imull	$60, %edx, %eax
	addl	$_accs+56, %eax
	fstps	(%eax)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	addl	$4, %eax
	flds	-16(%ebp)
	movl	%eax, 12(%esp)
	fstpl	4(%esp)
	movl	$LC20, (%esp)
	call	_printf
L18:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC21:
	.ascii "Withdrew %.2f from %s.\12\0"
LC22:
	.ascii "Insufficient funds.\0"
	.text
	.globl	_withdraw
	.def	_withdraw;	.scl	2;	.type	32;	.endef
_withdraw:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC16, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC18, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	testl	%eax, %eax
	jle	L23
	movl	-12(%ebp), %edx
	movl	_count, %eax
	cmpl	%eax, %edx
	jle	L24
L23:
	movl	$LC19, (%esp)
	call	_puts
	jmp	L22
L24:
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs+56, %eax
	flds	(%eax)
	flds	-16(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L30
	movl	-12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs+56, %eax
	flds	(%eax)
	flds	-16(%ebp)
	fsubrp	%st, %st(1)
	imull	$60, %edx, %eax
	addl	$_accs+56, %eax
	fstps	(%eax)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	addl	$4, %eax
	flds	-16(%ebp)
	movl	%eax, 12(%esp)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	jmp	L22
L30:
	movl	$LC22, (%esp)
	call	_puts
L22:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC23:
	.ascii "From ID: \0"
LC24:
	.ascii "To ID: \0"
LC25:
	.ascii "Amount: \0"
LC26:
	.ascii "Invalid IDs.\0"
	.align 4
LC27:
	.ascii "Transferred %.2f from %s to %s.\12\0"
	.text
	.globl	_transfer
	.def	_transfer;	.scl	2;	.type	32;	.endef
_transfer:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC23, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC24, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC25, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	testl	%eax, %eax
	jle	L32
	movl	-12(%ebp), %edx
	movl	_count, %eax
	cmpl	%eax, %edx
	jg	L32
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	jle	L32
	movl	-16(%ebp), %edx
	movl	_count, %eax
	cmpl	%eax, %edx
	jle	L33
L32:
	movl	$LC26, (%esp)
	call	_puts
	jmp	L31
L33:
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs+56, %eax
	flds	(%eax)
	flds	-20(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L39
	movl	-12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs+56, %eax
	flds	(%eax)
	flds	-20(%ebp)
	fsubrp	%st, %st(1)
	imull	$60, %edx, %eax
	addl	$_accs+56, %eax
	fstps	(%eax)
	movl	-16(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-16(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs+56, %eax
	flds	(%eax)
	flds	-20(%ebp)
	faddp	%st, %st(1)
	imull	$60, %edx, %eax
	addl	$_accs+56, %eax
	fstps	(%eax)
	movl	-16(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	leal	4(%eax), %edx
	movl	-12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %eax
	addl	$_accs, %eax
	addl	$4, %eax
	flds	-20(%ebp)
	movl	%edx, 16(%esp)
	movl	%eax, 12(%esp)
	fstpl	4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	jmp	L31
L39:
	movl	$LC22, (%esp)
	call	_puts
L31:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC28:
	.ascii "\12--- Banking Menu ---\0"
LC29:
	.ascii "1. Create Account\0"
LC30:
	.ascii "2. List Accounts\0"
LC31:
	.ascii "3. Deposit\0"
LC32:
	.ascii "4. Withdraw\0"
LC33:
	.ascii "5. Transfer\0"
LC34:
	.ascii "6. Save & Exit\0"
LC35:
	.ascii "Choice: \0"
LC36:
	.ascii "Exiting.\0"
LC37:
	.ascii "Invalid choice.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$1868784481, 35(%esp)
	movl	$1937010293, 39(%esp)
	movl	$1954051118, 43(%esp)
	movb	$0, 47(%esp)
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_load
L51:
	movl	$LC28, (%esp)
	call	_puts
	movl	$LC29, (%esp)
	call	_puts
	movl	$LC30, (%esp)
	call	_puts
	movl	$LC31, (%esp)
	call	_puts
	movl	$LC32, (%esp)
	call	_puts
	movl	$LC33, (%esp)
	call	_puts
	movl	$LC34, (%esp)
	call	_puts
	movl	$LC35, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	28(%esp), %eax
	cmpl	$6, %eax
	ja	L41
	movl	L43(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L43:
	.long	L41
	.long	L42
	.long	L44
	.long	L45
	.long	L46
	.long	L47
	.long	L48
	.text
L42:
	call	_create
	jmp	L49
L44:
	call	_list
	jmp	L49
L45:
	call	_deposit
	jmp	L49
L46:
	call	_withdraw
	jmp	L49
L47:
	call	_transfer
	jmp	L49
L48:
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_save
	movl	$LC36, (%esp)
	call	_puts
	movl	$0, %eax
	jmp	L52
L41:
	movl	$LC37, (%esp)
	call	_puts
L49:
	jmp	L51
L52:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
