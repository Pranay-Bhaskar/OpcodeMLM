	.file	"airlinereservation.c"
	.comm	_flights, 300600, 5
	.globl	_flightCount
	.bss
	.align 4
_flightCount:
	.space 4
	.text
	.globl	_addFlight
	.def	_addFlight;	.scl	2;	.type	32;	.endef
_addFlight:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_flightCount, %eax
	imull	$6012, %eax, %eax
	leal	_flights(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	_flightCount, %eax
	movl	-12(%ebp), %edx
	addl	$1, %edx
	movl	-12(%ebp), %ecx
	imull	$60, %ecx, %ecx
	imull	$6012, %eax, %eax
	addl	%ecx, %eax
	addl	$_flights+12, %eax
	movl	%edx, (%eax)
	movl	_flightCount, %eax
	movl	-12(%ebp), %edx
	imull	$60, %edx, %edx
	imull	$6012, %eax, %eax
	addl	%edx, %eax
	addl	$_flights+16, %eax
	movl	$0, (%eax)
	addl	$1, -12(%ebp)
L2:
	cmpl	$99, -12(%ebp)
	jle	L3
	movl	_flightCount, %eax
	addl	$1, %eax
	movl	%eax, _flightCount
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Seat %d booked for %s on flight %s\12\0"
LC1:
	.ascii "Seat already booked!\0"
LC2:
	.ascii "Flight not found!\0"
	.text
	.globl	_bookSeat
	.def	_bookSeat;	.scl	2;	.type	32;	.endef
_bookSeat:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L5
L10:
	movl	-12(%ebp), %eax
	imull	$6012, %eax, %eax
	leal	_flights(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L6
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$60, %edx, %edx
	imull	$6012, %eax, %eax
	addl	%edx, %eax
	addl	$_flights+16, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L7
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$60, %edx, %edx
	imull	$6012, %eax, %eax
	addl	%edx, %eax
	addl	$_flights+16, %eax
	movl	$1, (%eax)
	movl	12(%ebp), %eax
	subl	$1, %eax
	imull	$60, %eax, %edx
	movl	-12(%ebp), %eax
	imull	$6012, %eax, %eax
	addl	%edx, %eax
	addl	$_flights, %eax
	leal	20(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	jmp	L4
L7:
	movl	$LC1, (%esp)
	call	_puts
	jmp	L4
L6:
	addl	$1, -12(%ebp)
L5:
	movl	_flightCount, %eax
	cmpl	%eax, -12(%ebp)
	jl	L10
	movl	$LC2, (%esp)
	call	_puts
L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC3:
	.ascii "Flight %s seat map:\12\0"
LC4:
	.ascii "Available\0"
LC5:
	.ascii "Seat %d: %s\12\0"
	.text
	.globl	_showFlight
	.def	_showFlight;	.scl	2;	.type	32;	.endef
_showFlight:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L12
L19:
	movl	-12(%ebp), %eax
	imull	$6012, %eax, %eax
	leal	_flights(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L13
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	$0, -16(%ebp)
	jmp	L14
L17:
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	imull	$60, %edx, %edx
	imull	$6012, %eax, %eax
	addl	%edx, %eax
	addl	$_flights+16, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L15
	movl	-16(%ebp), %eax
	imull	$60, %eax, %edx
	movl	-12(%ebp), %eax
	imull	$6012, %eax, %eax
	addl	%edx, %eax
	addl	$_flights, %eax
	leal	20(%eax), %edx
	jmp	L16
L15:
	movl	$LC4, %edx
L16:
	movl	-16(%ebp), %ecx
	movl	-12(%ebp), %eax
	imull	$60, %ecx, %ecx
	imull	$6012, %eax, %eax
	addl	%ecx, %eax
	addl	$_flights+12, %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
L14:
	cmpl	$99, -16(%ebp)
	jle	L17
	jmp	L11
L13:
	addl	$1, -12(%ebp)
L12:
	movl	_flightCount, %eax
	cmpl	%eax, -12(%ebp)
	jl	L19
	movl	$LC2, (%esp)
	call	_puts
L11:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC6:
	.ascii "AI101\0"
LC7:
	.ascii "Pranay\0"
LC8:
	.ascii "Another Passenger\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$LC6, (%esp)
	call	_addFlight
	movl	$LC7, 8(%esp)
	movl	$10, 4(%esp)
	movl	$LC6, (%esp)
	call	_bookSeat
	movl	$LC8, 8(%esp)
	movl	$10, 4(%esp)
	movl	$LC6, (%esp)
	call	_bookSeat
	movl	$LC6, (%esp)
	call	_showFlight
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
