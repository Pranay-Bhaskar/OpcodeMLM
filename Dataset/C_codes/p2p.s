	.file	"p2p.c"
	.section .rdata,"dr"
LC0:
	.ascii "Could not create socket: %d\12\0"
LC1:
	.ascii "Bind failed: %d\12\0"
	.align 4
LC2:
	.ascii "Server listening on port %d...\12\0"
LC3:
	.ascii "Accept failed: %d\12\0"
LC4:
	.ascii "Received file chunk: %s\12\0"
	.text
	.globl	_server_thread@4
	.def	_server_thread@4;	.scl	2;	.type	32;	.endef
_server_thread@4:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$1096, %esp
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	$2, (%esp)
	call	_socket@12
	subl	$12, %esp
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	L2
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$1, %eax
	jmp	L9
L2:
	movw	$2, -36(%ebp)
	movl	$0, -32(%ebp)
	movl	$9090, (%esp)
	call	_htons@4
	subl	$4, %esp
	movw	%ax, -34(%ebp)
	movl	$16, 8(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_bind@12
	subl	$12, %esp
	cmpl	$-1, %eax
	jne	L4
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	movl	$1, %eax
	jmp	L9
L4:
	movl	$5, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_listen@8
	subl	$8, %esp
	movl	$9090, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$16, -56(%ebp)
L8:
	leal	-56(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_accept@12
	subl	$12, %esp
	movl	%eax, -16(%ebp)
	cmpl	$-1, -16(%ebp)
	jne	L5
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	jmp	L6
L5:
	movl	$0, 12(%esp)
	movl	$1023, 8(%esp)
	leal	-1080(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_recv@16
	subl	$16, %esp
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jle	L7
	leal	-1080(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	leal	-1080(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
L7:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
L6:
	jmp	L8
L9:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
	.align 4
LC5:
	.ascii "Client socket creation failed: %d\12\0"
LC6:
	.ascii "127.0.0.1\0"
LC7:
	.ascii "Connection failed: %d\12\0"
	.text
	.globl	_client_send
	.def	_client_send;	.scl	2;	.type	32;	.endef
_client_send:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	$2, (%esp)
	call	_socket@12
	subl	$12, %esp
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	L11
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	jmp	L10
L11:
	movw	$2, -28(%ebp)
	movl	$9090, (%esp)
	call	_htons@4
	subl	$4, %esp
	movw	%ax, -26(%ebp)
	movl	$LC6, (%esp)
	call	_inet_addr@4
	subl	$4, %esp
	movl	%eax, -24(%ebp)
	movl	$16, 8(%esp)
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_connect@12
	subl	$12, %esp
	testl	%eax, %eax
	jns	L13
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	jmp	L10
L13:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_send@16
	subl	$16, %esp
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
L10:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC8:
	.ascii "Failed to initialize Winsock: %d\12\0"
	.align 4
LC9:
	.ascii "Could not create server thread.\0"
	.align 4
LC10:
	.ascii "Chunk %d data... with extra payload\0"
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
	subl	$1476, %esp
	call	___main
	leal	-416(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$514, (%esp)
	call	_WSAStartup@8
	subl	$8, %esp
	testl	%eax, %eax
	je	L16
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	$1, %eax
	jmp	L21
L16:
	leal	-420(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	$0, 12(%esp)
	movl	$_server_thread@4, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_CreateThread@24
	subl	$24, %esp
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L18
	movl	$LC9, (%esp)
	call	_puts
	call	_WSACleanup@0
	movl	$1, %eax
	jmp	L21
L18:
	movl	$1000, (%esp)
	call	_Sleep@4
	subl	$4, %esp
	movl	$0, -12(%ebp)
	jmp	L19
L20:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$LC10, 4(%esp)
	leal	-1444(%ebp), %eax
	movl	%eax, (%esp)
	call	_sprintf
	leal	-1444(%ebp), %eax
	movl	%eax, (%esp)
	call	_client_send
	movl	$1000, (%esp)
	call	_Sleep@4
	subl	$4, %esp
	addl	$1, -12(%ebp)
L19:
	cmpl	$4, -12(%ebp)
	jle	L20
	movl	$-1, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	call	_WSACleanup@0
	movl	$0, %eax
L21:
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
	.def	_socket@12;	.scl	2;	.type	32;	.endef
	.def	_WSAGetLastError@0;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_htons@4;	.scl	2;	.type	32;	.endef
	.def	_bind@12;	.scl	2;	.type	32;	.endef
	.def	_closesocket@4;	.scl	2;	.type	32;	.endef
	.def	_listen@8;	.scl	2;	.type	32;	.endef
	.def	_accept@12;	.scl	2;	.type	32;	.endef
	.def	_recv@16;	.scl	2;	.type	32;	.endef
	.def	_inet_addr@4;	.scl	2;	.type	32;	.endef
	.def	_connect@12;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_send@16;	.scl	2;	.type	32;	.endef
	.def	_WSAStartup@8;	.scl	2;	.type	32;	.endef
	.def	_CreateThread@24;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_WSACleanup@0;	.scl	2;	.type	32;	.endef
	.def	_Sleep@4;	.scl	2;	.type	32;	.endef
	.def	_sprintf;	.scl	2;	.type	32;	.endef
	.def	_WaitForSingleObject@8;	.scl	2;	.type	32;	.endef
