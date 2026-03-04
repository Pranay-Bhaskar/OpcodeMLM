	.file	"udpecho.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "WSAStartup failed. Error: %d\12\0"
	.align 4
LC1:
	.ascii "Socket creation failed. Error: %d\12\0"
LC2:
	.ascii "Bind failed. Error: %d\12\0"
	.align 4
LC3:
	.ascii "UDP Echo Server running on port %d...\12\0"
LC4:
	.ascii "recvfrom failed. Error: %d\12\0"
LC5:
	.ascii "Client: %s\12\0"
LC6:
	.ascii "sendto failed. Error: %d\12\0"
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
	subl	$1508, %esp
	call	___main
	leal	-416(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$514, (%esp)
	call	_WSAStartup@8
	subl	$8, %esp
	testl	%eax, %eax
	je	L2
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$1, %eax
	jmp	L10
L2:
	movl	$0, 8(%esp)
	movl	$2, 4(%esp)
	movl	$2, (%esp)
	call	_socket@12
	subl	$12, %esp
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	L4
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	call	_WSACleanup@0
	movl	$1, %eax
	jmp	L10
L4:
	movl	$16, 8(%esp)
	movl	$0, 4(%esp)
	leal	-1456(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	movl	$16, 8(%esp)
	movl	$0, 4(%esp)
	leal	-1472(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	movw	$2, -1456(%ebp)
	movl	$0, -1452(%ebp)
	movl	$8080, (%esp)
	call	_htons@4
	subl	$4, %esp
	movw	%ax, -1454(%ebp)
	movl	$16, 8(%esp)
	leal	-1456(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_bind@12
	subl	$12, %esp
	cmpl	$-1, %eax
	jne	L5
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	call	_WSACleanup@0
	movl	$1, %eax
	jmp	L10
L5:
	movl	$8080, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L9:
	movl	$16, -1476(%ebp)
	leal	-1476(%ebp), %eax
	movl	%eax, 20(%esp)
	leal	-1472(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	$1024, 8(%esp)
	leal	-1440(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_recvfrom@24
	subl	$24, %esp
	movl	%eax, -16(%ebp)
	cmpl	$-1, -16(%ebp)
	jne	L6
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	jmp	L7
L6:
	leal	-1440(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	leal	-1440(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	-1476(%ebp), %eax
	movl	%eax, 20(%esp)
	leal	-1472(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-1440(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_sendto@24
	subl	$24, %esp
	cmpl	$-1, %eax
	jne	L9
	call	_WSAGetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
L7:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_closesocket@4
	subl	$4, %esp
	call	_WSACleanup@0
	movl	$0, %eax
L10:
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
	.def	_WSAStartup@8;	.scl	2;	.type	32;	.endef
	.def	_WSAGetLastError@0;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_socket@12;	.scl	2;	.type	32;	.endef
	.def	_WSACleanup@0;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_htons@4;	.scl	2;	.type	32;	.endef
	.def	_bind@12;	.scl	2;	.type	32;	.endef
	.def	_closesocket@4;	.scl	2;	.type	32;	.endef
	.def	_recvfrom@24;	.scl	2;	.type	32;	.endef
	.def	_sendto@24;	.scl	2;	.type	32;	.endef
