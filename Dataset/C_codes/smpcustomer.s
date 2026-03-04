	.file	"smpcustomer.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Global\\MySharedMemory\0"
	.align 4
LC1:
	.ascii "Could not create file mapping object (%lu).\12\0"
	.align 4
LC2:
	.ascii "Could not map view of file (%lu).\12\0"
LC3:
	.ascii "Global\\Empty\0"
LC4:
	.ascii "Global\\Full\0"
LC5:
	.ascii "Global\\Mutex\0"
	.align 4
LC6:
	.ascii "Could not create synchronization objects.\0"
LC7:
	.ascii "Produced %d at index %d\12\0"
LC8:
	.ascii "Consumed %d from index %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB25:
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
	subl	$68, %esp
	call	___main
	movl	$LC0, 20(%esp)
	movl	$48, 16(%esp)
	movl	$0, 12(%esp)
	movl	$4, 8(%esp)
	movl	$0, 4(%esp)
	movl	$-1, (%esp)
	call	_CreateFileMappingA@24
	subl	$24, %esp
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jne	L2
	call	_GetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$1, %eax
	jmp	L3
L2:
	movl	$48, 16(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$983071, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_MapViewOfFile@20
	subl	$20, %esp
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jne	L4
	call	_GetLastError@0
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
	movl	$1, %eax
	jmp	L3
L4:
	movl	-24(%ebp), %eax
	movl	$0, 44(%eax)
	movl	-24(%ebp), %eax
	movl	44(%eax), %edx
	movl	-24(%ebp), %eax
	movl	%edx, 40(%eax)
	movl	$LC3, 12(%esp)
	movl	$10, 8(%esp)
	movl	$10, 4(%esp)
	movl	$0, (%esp)
	call	_CreateSemaphoreA@16
	subl	$16, %esp
	movl	%eax, -28(%ebp)
	movl	$LC4, 12(%esp)
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_CreateSemaphoreA@16
	subl	$16, %esp
	movl	%eax, -32(%ebp)
	movl	$LC5, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_CreateMutexA@12
	subl	$12, %esp
	movl	%eax, -36(%ebp)
	cmpl	$0, -28(%ebp)
	je	L5
	cmpl	$0, -32(%ebp)
	je	L5
	cmpl	$0, -36(%ebp)
	jne	L6
L5:
	movl	$LC6, (%esp)
	call	_puts
	movl	$1, %eax
	jmp	L3
L6:
	movl	$0, -12(%ebp)
	jmp	L7
L8:
	movl	$-1, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	$-1, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	-24(%ebp), %eax
	movl	40(%eax), %edx
	movl	-24(%ebp), %eax
	movl	-12(%ebp), %ecx
	movl	%ecx, (%eax,%edx,4)
	movl	-24(%ebp), %eax
	movl	40(%eax), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	-24(%ebp), %eax
	movl	40(%eax), %eax
	leal	1(%eax), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	-24(%ebp), %eax
	movl	%edx, 40(%eax)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_ReleaseMutex@4
	subl	$4, %esp
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_ReleaseSemaphore@12
	subl	$12, %esp
	movl	$500, (%esp)
	call	_Sleep@4
	subl	$4, %esp
	addl	$1, -12(%ebp)
L7:
	cmpl	$19, -12(%ebp)
	jle	L8
	movl	$0, -16(%ebp)
	jmp	L9
L10:
	movl	$-1, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	$-1, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_WaitForSingleObject@8
	subl	$8, %esp
	movl	-24(%ebp), %eax
	movl	44(%eax), %edx
	movl	-24(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	movl	%eax, -40(%ebp)
	movl	-24(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, 8(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	-24(%ebp), %eax
	movl	44(%eax), %eax
	leal	1(%eax), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	-24(%ebp), %eax
	movl	%edx, 44(%eax)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_ReleaseMutex@4
	subl	$4, %esp
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_ReleaseSemaphore@12
	subl	$12, %esp
	movl	$700, (%esp)
	call	_Sleep@4
	subl	$4, %esp
	addl	$1, -16(%ebp)
L9:
	cmpl	$19, -16(%ebp)
	jle	L10
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_UnmapViewOfFile@4
	subl	$4, %esp
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_CloseHandle@4
	subl	$4, %esp
	movl	$0, %eax
L3:
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_CreateFileMappingA@24;	.scl	2;	.type	32;	.endef
	.def	_GetLastError@0;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_MapViewOfFile@20;	.scl	2;	.type	32;	.endef
	.def	_CloseHandle@4;	.scl	2;	.type	32;	.endef
	.def	_CreateSemaphoreA@16;	.scl	2;	.type	32;	.endef
	.def	_CreateMutexA@12;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_WaitForSingleObject@8;	.scl	2;	.type	32;	.endef
	.def	_ReleaseMutex@4;	.scl	2;	.type	32;	.endef
	.def	_ReleaseSemaphore@12;	.scl	2;	.type	32;	.endef
	.def	_Sleep@4;	.scl	2;	.type	32;	.endef
	.def	_UnmapViewOfFile@4;	.scl	2;	.type	32;	.endef
