	.file	"dungeon.c"
	.comm	_map, 100, 5
	.globl	_playerX
	.bss
	.align 4
_playerX:
	.space 4
	.globl	_playerY
	.align 4
_playerY:
	.space 4
	.text
	.globl	_initMap
	.def	_initMap;	.scl	2;	.type	32;	.endef
_initMap:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L5:
	movl	$0, -8(%ebp)
	jmp	L3
L4:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	addl	$_map, %eax
	movb	$46, (%eax)
	addl	$1, -8(%ebp)
L3:
	cmpl	$9, -8(%ebp)
	jle	L4
	addl	$1, -4(%ebp)
L2:
	cmpl	$9, -4(%ebp)
	jle	L5
	movl	_playerX, %edx
	movl	_playerY, %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	addl	$_map, %eax
	movb	$80, (%eax)
	movb	$69, _map+99
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
LC0:
	.ascii "%c \0"
	.text
	.globl	_showMap
	.def	_showMap;	.scl	2;	.type	32;	.endef
_showMap:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L7
L10:
	movl	$0, -16(%ebp)
	jmp	L8
L9:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	addl	$_map, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
L8:
	cmpl	$9, -16(%ebp)
	jle	L9
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L7:
	cmpl	$9, -12(%ebp)
	jle	L10
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_movePlayer
	.def	_movePlayer;	.scl	2;	.type	32;	.endef
_movePlayer:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movl	_playerX, %edx
	movl	_playerY, %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	addl	$_map, %eax
	movb	$46, (%eax)
	cmpb	$119, -4(%ebp)
	jne	L12
	movl	_playerX, %eax
	testl	%eax, %eax
	jle	L12
	movl	_playerX, %eax
	subl	$1, %eax
	movl	%eax, _playerX
L12:
	cmpb	$115, -4(%ebp)
	jne	L13
	movl	_playerX, %eax
	cmpl	$8, %eax
	jg	L13
	movl	_playerX, %eax
	addl	$1, %eax
	movl	%eax, _playerX
L13:
	cmpb	$97, -4(%ebp)
	jne	L14
	movl	_playerY, %eax
	testl	%eax, %eax
	jle	L14
	movl	_playerY, %eax
	subl	$1, %eax
	movl	%eax, _playerY
L14:
	cmpb	$100, -4(%ebp)
	jne	L15
	movl	_playerY, %eax
	cmpl	$8, %eax
	jg	L15
	movl	_playerY, %eax
	addl	$1, %eax
	movl	%eax, _playerY
L15:
	movl	_playerX, %edx
	movl	_playerY, %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	addl	$_map, %eax
	movb	$80, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "Move (w/a/s/d): \0"
LC2:
	.ascii " %c\0"
LC3:
	.ascii "You reached the exit!\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	call	_initMap
L19:
	call	_showMap
	movl	$LC1, (%esp)
	call	_printf
	leal	31(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movzbl	31(%esp), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_movePlayer
	movl	_playerX, %eax
	cmpl	$9, %eax
	jne	L19
	movl	_playerY, %eax
	cmpl	$9, %eax
	jne	L19
	movl	$LC3, (%esp)
	call	_puts
	nop
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
