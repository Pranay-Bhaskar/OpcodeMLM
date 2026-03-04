	.file	"wether.c"
	.globl	_conditions
	.section .rdata,"dr"
LC0:
	.ascii "Sunny\0"
LC1:
	.ascii "Rainy\0"
LC2:
	.ascii "Cloudy\0"
LC3:
	.ascii "Stormy\0"
LC4:
	.ascii "Snowy\0"
	.data
	.align 4
_conditions:
	.long	LC0
	.long	LC1
	.long	LC2
	.long	LC3
	.long	LC4
	.section .rdata,"dr"
LC5:
	.ascii "Day %d: %s, Temp: %d\302\260C\12\0"
	.text
	.globl	_simulateWeather
	.def	_simulateWeather;	.scl	2;	.type	32;	.endef
_simulateWeather:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$1, -12(%ebp)
	jmp	L2
L3:
	call	_rand
	movl	%eax, %ecx
	movl	$-368140053, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%edx,%ecx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$35, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$5, %eax
	movl	%eax, -16(%ebp)
	call	_rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	_conditions(,%eax,4), %eax
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jle	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC6:
	.ascii "Enter number of days to simulate: \0"
LC7:
	.ascii "%d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC6, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_simulateWeather
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
