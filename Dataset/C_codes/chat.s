	.file	"chat.c"
	.comm	_clients, 560, 5
	.globl	_client_count
	.bss
	.align 4
_client_count:
	.space 4
	.comm	_lock, 4, 2
	.text
	.globl	_broadcast
	.def	_broadcast;	.scl	2;	.type	32;	.endef
_broadcast:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_lock, %eax
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L4:
	movl	-12(%ebp), %eax
	imull	$56, %eax, %eax
	addl	$_clients, %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	je	L3
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	imull	$56, %eax, %eax
	addl	$_clients, %eax
	movl	(%eax), %eax
	movl	$0, 12(%esp)
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_send@16
	subl	$16, %esp
L3:
	addl	$1, -12(%ebp)
L2:
	movl	_client_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L4
	movl	_lock, %eax
	movl	%eax, (%esp)
	call	_ReleaseMutex@4
	subl	$4, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC0:
	.ascii "%s joined the chat.\12\0"
LC1:
	.ascii "%s left the chat.\12\0"
LC2:
	.ascii "%s: %s\0"
	.text
	.globl	_handle_client@4
	.def	_handle_client@4;	.scl	2;	.type	32;	.endef
_handle_client@4:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$2216, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	$0, 12(%esp)
	movl	$49, 8(%esp)
	leal	-1098(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_recv@16
	subl	$16, %esp
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jg	L6
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	movl	$0, %eax
	jmp	L17
L6:
	leal	-1098(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	_lock, %eax
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	_client_count, %eax
	cmpl	$9, %eax
	jg	L8
	movl	_client_count, %eax
	imull	$56, %eax, %eax
	leal	_clients(%eax), %edx
	movl	-20(%ebp), %eax
	movl	%eax, (%edx)
	movl	_client_count, %eax
	imull	$56, %eax, %eax
	addl	$_clients, %eax
	leal	4(%eax), %edx
	movl	$49, 8(%esp)
	leal	-1098(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strncpy
	movl	_client_count, %eax
	addl	$1, %eax
	movl	%eax, _client_count
L8:
	movl	_lock, %eax
	movl	%eax, (%esp)
	call	_ReleaseMutex@4
	subl	$4, %esp
	leal	-1098(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	leal	-1048(%ebp), %eax
	movl	%eax, (%esp)
	call	_sprintf
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1048(%ebp), %eax
	movl	%eax, (%esp)
	call	_broadcast
L16:
	movl	$0, 12(%esp)
	movl	$1023, 8(%esp)
	leal	-1048(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_recv@16
	subl	$16, %esp
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jg	L9
	leal	-1098(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC1, 4(%esp)
	leal	-1048(%ebp), %eax
	movl	%eax, (%esp)
	call	_sprintf
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-1048(%ebp), %eax
	movl	%eax, (%esp)
	call	_broadcast
	movl	_lock, %eax
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	$0, -12(%ebp)
	jmp	L10
L15:
	movl	-12(%ebp), %eax
	imull	$56, %eax, %eax
	addl	$_clients, %eax
	movl	(%eax), %eax
	cmpl	-20(%ebp), %eax
	jne	L11
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L12
L13:
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	-16(%ebp), %eax
	imull	$56, %eax, %eax
	addl	$_clients, %eax
	imull	$56, %edx, %edx
	addl	$_clients, %edx
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
	movl	52(%edx), %edx
	movl	%edx, 52(%eax)
	addl	$1, -16(%ebp)
L12:
	movl	_client_count, %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L13
	movl	_client_count, %eax
	subl	$1, %eax
	movl	%eax, _client_count
	jmp	L14
L11:
	addl	$1, -12(%ebp)
L10:
	movl	_client_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L15
L14:
	movl	_lock, %eax
	movl	%eax, (%esp)
	call	_ReleaseMutex@4
	subl	$4, %esp
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	movl	$0, %eax
	jmp	L17
L9:
	leal	-1048(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	leal	-1048(%ebp), %eax
	movl	%eax, 16(%esp)
	leal	-1098(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$LC2, 8(%esp)
	movl	$1074, 4(%esp)
	leal	-2172(%ebp), %eax
	movl	%eax, (%esp)
	call	_snprintf
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-2172(%ebp), %eax
	movl	%eax, (%esp)
	call	_broadcast
	jmp	L16
L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
LFE26:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC3:
	.ascii "Failed to initialize Winsock: %d\12\0"
LC4:
	.ascii "Socket failed: %d\12\0"
LC5:
	.ascii "Bind failed: %d\12\0"
LC6:
	.ascii "Listen failed: %d\12\0"
	.align 4
LC7:
	.ascii "Chat server running on port %d...\12\0"
LC8:
	.ascii "Accept failed: %d\12\0"
LC9:
	.ascii "Could not create thread.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB27:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$468, %esp
	call	___main
	movl	$16, -440(%ebp)
	leal	-416(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$514, (%esp)
	call	_WSAStartup@8
	subl	$8, %esp
	testl	%eax, %eax
	je	L19
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	$1, %eax
	jmp	L28
L19:
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	$2, (%esp)
	call	_socket@12
	subl	$12, %esp
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	L21
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	call	_WSACleanup@0
	movl	$1, %eax
	jmp	L28
L21:
	movw	$2, -436(%ebp)
	movl	$0, -432(%ebp)
	movl	$8080, (%esp)
	call	_htons@4
	subl	$4, %esp
	movw	%ax, -434(%ebp)
	movl	$16, 8(%esp)
	leal	-436(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_bind@12
	subl	$12, %esp
	cmpl	$-1, %eax
	jne	L22
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	call	_WSACleanup@0
	movl	$1, %eax
	jmp	L28
L22:
	movl	$3, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_listen@8
	subl	$8, %esp
	cmpl	$-1, %eax
	jne	L23
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	call	_WSACleanup@0
	movl	$1, %eax
	jmp	L28
L23:
	movl	$8080, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_CreateMutexA@12
	subl	$12, %esp
	movl	%eax, _lock
L27:
	leal	-440(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-436(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_accept@12
	subl	$12, %esp
	movl	%eax, -420(%ebp)
	movl	-420(%ebp), %eax
	cmpl	$-1, %eax
	jne	L24
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	jmp	L25
L24:
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	leal	-420(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$_handle_client@4, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_CreateThread@24
	subl	$24, %esp
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L26
	movl	$LC9, (%esp)
	call	_puts
	movl	-420(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	jmp	L27
L26:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
L25:
	jmp	L27
L28:
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_WaitForSingleObject@8;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_send@16;	.scl	2;	.type	32;	.endef
	.def	_ReleaseMutex@4;	.scl	2;	.type	32;	.endef
	.def	_recv@16;	.scl	2;	.type	32;	.endef
	.def	_closesocket@4;	.scl	2;	.type	32;	.endef
	.def	_strncpy;	.scl	2;	.type	32;	.endef
	.def	_sprintf;	.scl	2;	.type	32;	.endef
	.def	_snprintf;	.scl	2;	.type	32;	.endef
	.def	_WSAStartup@8;	.scl	2;	.type	32;	.endef
	.def	_WSAGetLastError@0;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_socket@12;	.scl	2;	.type	32;	.endef
	.def	_WSACleanup@0;	.scl	2;	.type	32;	.endef
	.def	_htons@4;	.scl	2;	.type	32;	.endef
	.def	_bind@12;	.scl	2;	.type	32;	.endef
	.def	_listen@8;	.scl	2;	.type	32;	.endef
	.def	_CreateMutexA@12;	.scl	2;	.type	32;	.endef
	.def	_accept@12;	.scl	2;	.type	32;	.endef
	.def	_CreateThread@24;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_CloseHandle@4;	.scl	2;	.type	32;	.endef
