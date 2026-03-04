	.file	"email.c"
	.comm	_users, 700560, 5
	.globl	_user_count
	.bss
	.align 4
_user_count:
	.space 4
	.text
	.globl	_find_user
	.def	_find_user;	.scl	2;	.type	32;	.endef
_find_user:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L5:
	movl	-12(%ebp), %eax
	imull	$70056, %eax, %eax
	leal	_users(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L3
	movl	-12(%ebp), %eax
	imull	$70056, %eax, %eax
	addl	$_users, %eax
	jmp	L4
L3:
	addl	$1, -12(%ebp)
L2:
	movl	_user_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L5
	movl	$0, %eax
L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC0:
	.ascii "Max users reached!\0"
LC1:
	.ascii "Enter username: \0"
LC2:
	.ascii "%s\0"
LC3:
	.ascii "User already exists.\0"
LC4:
	.ascii "User %s registered.\12\0"
	.text
	.globl	_register_user
	.def	_register_user;	.scl	2;	.type	32;	.endef
_register_user:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	_user_count, %eax
	cmpl	$9, %eax
	jle	L7
	movl	$LC0, (%esp)
	call	_puts
	jmp	L6
L7:
	movl	$LC1, (%esp)
	call	_printf
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	leal	-58(%ebp), %eax
	movl	%eax, (%esp)
	call	_find_user
	testl	%eax, %eax
	je	L9
	movl	$LC3, (%esp)
	call	_puts
	jmp	L6
L9:
	movl	_user_count, %eax
	imull	$70056, %eax, %eax
	leal	_users(%eax), %edx
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
	movl	_user_count, %eax
	imull	$70056, %eax, %eax
	addl	$_users+70052, %eax
	movl	$0, (%eax)
	movl	_user_count, %eax
	addl	$1, %eax
	movl	%eax, _user_count
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC5:
	.ascii "To: \0"
LC6:
	.ascii "Subject: \0"
LC7:
	.ascii "\12\0"
LC8:
	.ascii "Body: \0"
LC9:
	.ascii "Recipient not found.\0"
LC10:
	.ascii "Inbox full!\0"
LC11:
	.ascii "Email sent to %s.\12\0"
	.text
	.globl	_compose_email
	.def	_compose_email;	.scl	2;	.type	32;	.endef
_compose_email:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$1388, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$LC5, (%esp)
	call	_printf
	leal	-78(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	call	_getchar
	movl	$LC6, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	-178(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC7, 4(%esp)
	leal	-178(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -178(%ebp,%eax)
	movl	$LC8, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$500, 4(%esp)
	leal	-678(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC7, 4(%esp)
	leal	-678(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -678(%ebp,%eax)
	leal	-78(%ebp), %eax
	movl	%eax, (%esp)
	call	_find_user
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	L12
	movl	$LC9, (%esp)
	call	_puts
	jmp	L11
L12:
	movl	-28(%ebp), %eax
	movl	70052(%eax), %eax
	cmpl	$99, %eax
	jle	L14
	movl	$LC10, (%esp)
	call	_puts
	jmp	L11
L14:
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1378(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcpy
	leal	-78(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1378(%ebp), %eax
	addl	$50, %eax
	movl	%eax, (%esp)
	call	_strcpy
	leal	-178(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1378(%ebp), %eax
	addl	$100, %eax
	movl	%eax, (%esp)
	call	_strcpy
	leal	-678(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1378(%ebp), %eax
	addl	$200, %eax
	movl	%eax, (%esp)
	call	_strcpy
	movl	-28(%ebp), %eax
	movl	70052(%eax), %eax
	leal	1(%eax), %ecx
	movl	-28(%ebp), %edx
	movl	%ecx, 70052(%edx)
	movl	-28(%ebp), %edx
	imull	$700, %eax, %eax
	addl	%edx, %eax
	addl	$48, %eax
	addl	$2, %eax
	leal	-1378(%ebp), %edx
	movl	$700, %ecx
	movl	(%edx), %ebx
	movl	%ebx, (%eax)
	movl	-4(%edx,%ecx), %ebx
	movl	%ebx, -4(%eax,%ecx)
	leal	4(%eax), %ebx
	andl	$-4, %ebx
	subl	%ebx, %eax
	subl	%eax, %edx
	addl	%eax, %ecx
	andl	$-4, %ecx
	movl	%ecx, %eax
	shrl	$2, %eax
	movl	%ebx, %edi
	movl	%edx, %esi
	movl	%eax, %ecx
	rep movsl
	leal	-78(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
L11:
	addl	$1388, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC12:
	.ascii "User not found.\0"
LC13:
	.ascii "\12Inbox of %s:\12\0"
LC14:
	.ascii "%d. From: %s | Subject: %s\12\0"
	.text
	.globl	_view_inbox
	.def	_view_inbox;	.scl	2;	.type	32;	.endef
_view_inbox:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_find_user
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L17
	movl	$LC12, (%esp)
	call	_puts
	jmp	L16
L17:
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L19
L20:
	movl	-12(%ebp), %eax
	imull	$700, %eax, %eax
	leal	144(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	leal	6(%eax), %ecx
	movl	-12(%ebp), %eax
	imull	$700, %eax, %eax
	leal	48(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	leal	2(%eax), %edx
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L19:
	movl	-16(%ebp), %eax
	movl	70052(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L20
L16:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC15:
	.ascii "Enter email number: \0"
LC16:
	.ascii "%d\0"
LC17:
	.ascii "Invalid ID.\0"
LC18:
	.ascii "\12--- Email ---\0"
	.align 4
LC19:
	.ascii "From: %s\12To: %s\12Subject: %s\12Body:\12%s\12\0"
	.text
	.globl	_read_email
	.def	_read_email;	.scl	2;	.type	32;	.endef
_read_email:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	subl	$752, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_find_user
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L22
	movl	$LC12, (%esp)
	call	_puts
	jmp	L21
L22:
	movl	$LC15, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	call	_getchar
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	jle	L24
	movl	-12(%ebp), %eax
	movl	70052(%eax), %edx
	movl	-16(%ebp), %eax
	cmpl	%eax, %edx
	jge	L25
L24:
	movl	$LC17, (%esp)
	call	_puts
	jmp	L21
L25:
	movl	-16(%ebp), %eax
	subl	$1, %eax
	movl	-12(%ebp), %edx
	imull	$700, %eax, %eax
	addl	%edx, %eax
	leal	48(%eax), %edx
	leal	-716(%ebp), %eax
	addl	$2, %edx
	movl	$175, %ecx
	movl	%eax, %edi
	movl	%edx, %esi
	rep movsl
	movl	$LC18, (%esp)
	call	_puts
	leal	-716(%ebp), %eax
	addl	$200, %eax
	movl	%eax, 16(%esp)
	leal	-716(%ebp), %eax
	addl	$100, %eax
	movl	%eax, 12(%esp)
	leal	-716(%ebp), %eax
	addl	$50, %eax
	movl	%eax, 8(%esp)
	leal	-716(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_printf
L21:
	addl	$752, %esp
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
	.align 4
LC20:
	.ascii "Enter email number to delete: \0"
LC21:
	.ascii "Email deleted.\0"
	.text
	.globl	_delete_email
	.def	_delete_email;	.scl	2;	.type	32;	.endef
_delete_email:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_find_user
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	L28
	movl	$LC12, (%esp)
	call	_puts
	jmp	L27
L28:
	movl	$LC20, (%esp)
	call	_printf
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	call	_getchar
	movl	-36(%ebp), %eax
	testl	%eax, %eax
	jle	L30
	movl	-32(%ebp), %eax
	movl	70052(%eax), %edx
	movl	-36(%ebp), %eax
	cmpl	%eax, %edx
	jge	L31
L30:
	movl	$LC17, (%esp)
	call	_puts
	jmp	L27
L31:
	movl	-36(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -28(%ebp)
	jmp	L32
L33:
	movl	-28(%ebp), %eax
	leal	1(%eax), %ebx
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %eax
	imull	$700, %eax, %eax
	addl	%edx, %eax
	leal	48(%eax), %ecx
	movl	-32(%ebp), %edx
	imull	$700, %ebx, %eax
	addl	%edx, %eax
	leal	48(%eax), %edx
	leal	2(%ecx), %eax
	addl	$2, %edx
	movl	$700, %ecx
	movl	(%edx), %ebx
	movl	%ebx, (%eax)
	movl	-4(%edx,%ecx), %ebx
	movl	%ebx, -4(%eax,%ecx)
	leal	4(%eax), %ebx
	andl	$-4, %ebx
	subl	%ebx, %eax
	subl	%eax, %edx
	addl	%eax, %ecx
	andl	$-4, %ecx
	movl	%ecx, %eax
	shrl	$2, %eax
	movl	%ebx, %edi
	movl	%edx, %esi
	movl	%eax, %ecx
	rep movsl
	addl	$1, -28(%ebp)
L32:
	movl	-32(%ebp), %eax
	movl	70052(%eax), %eax
	subl	$1, %eax
	cmpl	-28(%ebp), %eax
	jg	L33
	movl	-32(%ebp), %eax
	movl	70052(%eax), %eax
	leal	-1(%eax), %edx
	movl	-32(%ebp), %eax
	movl	%edx, 70052(%eax)
	movl	$LC21, (%esp)
	call	_puts
L27:
	addl	$44, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC22:
	.ascii "\12--- Email Client Menu ---\0"
LC23:
	.ascii "1. Register User\0"
LC24:
	.ascii "2. Login\0"
LC25:
	.ascii "3. Exit\0"
LC26:
	.ascii "Choice: \0"
LC27:
	.ascii "\12--- User Menu (%s) ---\12\0"
LC28:
	.ascii "1. Compose Email\0"
LC29:
	.ascii "2. View Inbox\0"
LC30:
	.ascii "3. Read Email\0"
LC31:
	.ascii "4. Delete Email\0"
LC32:
	.ascii "5. Logout\0"
LC33:
	.ascii "Invalid choice.\0"
LC34:
	.ascii "Exiting.\0"
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
	subl	$80, %esp
	call	___main
L49:
	movl	$LC22, (%esp)
	call	_puts
	movl	$LC23, (%esp)
	call	_puts
	movl	$LC24, (%esp)
	call	_puts
	movl	$LC25, (%esp)
	call	_puts
	movl	$LC26, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	call	_getchar
	movl	24(%esp), %eax
	cmpl	$1, %eax
	jne	L36
	call	_register_user
	jmp	L49
L36:
	movl	24(%esp), %eax
	cmpl	$2, %eax
	jne	L38
	movl	$LC1, (%esp)
	call	_printf
	leal	30(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	call	_getchar
	leal	30(%esp), %eax
	movl	%eax, (%esp)
	call	_find_user
	testl	%eax, %eax
	jne	L39
	movl	$LC12, (%esp)
	call	_puts
	jmp	L49
L39:
	leal	30(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
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
	movl	$LC26, (%esp)
	call	_printf
	leal	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	call	_getchar
	movl	20(%esp), %eax
	cmpl	$1, %eax
	jne	L40
	leal	30(%esp), %eax
	movl	%eax, (%esp)
	call	_compose_email
	jmp	L39
L40:
	movl	20(%esp), %eax
	cmpl	$2, %eax
	jne	L42
	leal	30(%esp), %eax
	movl	%eax, (%esp)
	call	_view_inbox
	jmp	L39
L42:
	movl	20(%esp), %eax
	cmpl	$3, %eax
	jne	L43
	leal	30(%esp), %eax
	movl	%eax, (%esp)
	call	_read_email
	jmp	L39
L43:
	movl	20(%esp), %eax
	cmpl	$4, %eax
	jne	L44
	leal	30(%esp), %eax
	movl	%eax, (%esp)
	call	_delete_email
	jmp	L39
L44:
	movl	20(%esp), %eax
	cmpl	$5, %eax
	je	L52
	movl	$LC33, (%esp)
	call	_puts
	jmp	L39
L38:
	movl	24(%esp), %eax
	cmpl	$3, %eax
	jne	L47
	movl	$LC34, (%esp)
	call	_puts
	jmp	L51
L47:
	movl	$LC33, (%esp)
	call	_puts
	jmp	L49
L52:
	nop
	jmp	L49
L51:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
