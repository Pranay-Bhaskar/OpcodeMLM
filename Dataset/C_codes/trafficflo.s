	.file	"trafficflo.c"
	.comm	_cars, 80, 5
	.text
	.globl	_initCars
	.def	_initCars;	.scl	2;	.type	32;	.endef
_initCars:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, _cars(,%eax,8)
	call	_rand
	movl	%eax, %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	-12(%ebp), %eax
	movl	%edx, _cars+4(,%eax,8)
	addl	$1, -12(%ebp)
L2:
	cmpl	$9, -12(%ebp)
	jle	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_updateTraffic
	.def	_updateTraffic;	.scl	2;	.type	32;	.endef
_updateTraffic:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L5
L7:
	movl	-4(%ebp), %eax
	movl	_cars(,%eax,8), %edx
	movl	-4(%ebp), %eax
	movl	_cars+4(,%eax,8), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, _cars(,%eax,8)
	movl	-4(%ebp), %eax
	movl	_cars(,%eax,8), %eax
	cmpl	$49, %eax
	jle	L6
	movl	-4(%ebp), %eax
	movl	$0, _cars(,%eax,8)
L6:
	addl	$1, -4(%ebp)
L5:
	cmpl	$9, -4(%ebp)
	jle	L7
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_showRoad
	.def	_showRoad;	.scl	2;	.type	32;	.endef
_showRoad:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	$0, -12(%ebp)
	jmp	L9
L10:
	leal	-70(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	$46, (%eax)
	addl	$1, -12(%ebp)
L9:
	cmpl	$49, -12(%ebp)
	jle	L10
	movl	$0, -16(%ebp)
	jmp	L11
L12:
	movl	-16(%ebp), %eax
	movl	_cars(,%eax,8), %eax
	movb	$67, -70(%ebp,%eax)
	addl	$1, -16(%ebp)
L11:
	cmpl	$9, -16(%ebp)
	jle	L12
	movl	$0, -20(%ebp)
	jmp	L13
L14:
	leal	-70(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_putchar
	addl	$1, -20(%ebp)
L13:
	cmpl	$49, -20(%ebp)
	jle	L14
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Step %d:\12\0"
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
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	call	_initCars
	movl	$0, 28(%esp)
	jmp	L16
L17:
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	call	_showRoad
	call	_updateTraffic
	addl	$1, 28(%esp)
L16:
	cmpl	$19, 28(%esp)
	jle	L17
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
