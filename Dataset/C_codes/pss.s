	.file	"pss.c"
	.comm	_procs, 560, 5
	.comm	_n, 4, 2
	.section .rdata,"dr"
LC0:
	.ascii "Enter number of processes: \0"
LC1:
	.ascii "%d\0"
LC2:
	.ascii "Process %d burst time: \0"
LC3:
	.ascii "Process %d arrival time: \0"
LC4:
	.ascii "Process %d priority: \0"
	.text
	.globl	_input
	.def	_input;	.scl	2;	.type	32;	.endef
_input:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC0, (%esp)
	call	_printf
	movl	$_n, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs, %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs, %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs, %eax
	addl	$8, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs, %eax
	addl	$12, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	imull	$28, %edx, %edx
	addl	$_procs+24, %edx
	movl	%eax, (%edx)
	addl	$1, -12(%ebp)
L2:
	movl	_n, %eax
	cmpl	%eax, -12(%ebp)
	jl	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.section .rdata,"dr"
LC5:
	.ascii "\12--- FCFS Scheduling ---\0"
LC6:
	.ascii "PID\11WT\11TAT\0"
LC7:
	.ascii "%d\11%d\11%d\12\0"
	.text
	.globl	_fcfs
	.def	_fcfs;	.scl	2;	.type	32;	.endef
_fcfs:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$LC5, (%esp)
	call	_puts
	movl	$0, -16(%ebp)
	jmp	L5
L7:
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+8, %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	jle	L6
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+8, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L6:
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+8, %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	subl	%eax, %edx
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	addl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+20, %eax
	movl	%edx, (%eax)
	addl	$1, -16(%ebp)
L5:
	movl	_n, %eax
	cmpl	%eax, -16(%ebp)
	jl	L7
	movl	$LC6, (%esp)
	call	_puts
	movl	$0, -20(%ebp)
	jmp	L8
L9:
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+20, %eax
	movl	(%eax), %ecx
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs, %eax
	movl	(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	addl	$1, -20(%ebp)
L8:
	movl	_n, %eax
	cmpl	%eax, -20(%ebp)
	jl	L9
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
LC8:
	.ascii "\12--- Priority Scheduling ---\0"
	.text
	.globl	_priority_sched
	.def	_priority_sched;	.scl	2;	.type	32;	.endef
_priority_sched:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$LC8, (%esp)
	call	_puts
	jmp	L11
L17:
	movl	$-1, -20(%ebp)
	movl	$0, -24(%ebp)
	jmp	L12
L15:
	movl	-24(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+24, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jle	L13
	movl	-24(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+8, %eax
	movl	(%eax), %eax
	cmpl	-16(%ebp), %eax
	jg	L13
	cmpl	$-1, -20(%ebp)
	je	L14
	movl	-24(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+12, %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+12, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jge	L13
L14:
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L13:
	addl	$1, -24(%ebp)
L12:
	movl	_n, %eax
	cmpl	%eax, -24(%ebp)
	jl	L15
	cmpl	$-1, -20(%ebp)
	jne	L16
	addl	$1, -16(%ebp)
	jmp	L11
L16:
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+8, %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	subl	%eax, %edx
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+20, %eax
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+24, %eax
	movl	$0, (%eax)
	addl	$1, -12(%ebp)
L11:
	movl	_n, %eax
	cmpl	%eax, -12(%ebp)
	jl	L17
	movl	$LC6, (%esp)
	call	_puts
	movl	$0, -28(%ebp)
	jmp	L18
L19:
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+20, %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs, %eax
	movl	(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	addl	$1, -28(%ebp)
L18:
	movl	_n, %eax
	cmpl	%eax, -28(%ebp)
	jl	L19
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.section .rdata,"dr"
LC9:
	.ascii "\12--- Round Robin (q=%d) ---\12\0"
	.text
	.globl	_round_robin
	.def	_round_robin;	.scl	2;	.type	32;	.endef
_round_robin:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	jmp	L21
L22:
	movl	-20(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	imull	$28, %edx, %edx
	addl	$_procs+24, %edx
	movl	%eax, (%edx)
	addl	$1, -20(%ebp)
L21:
	movl	_n, %eax
	cmpl	%eax, -20(%ebp)
	jl	L22
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	jmp	L23
L28:
	movl	$0, -24(%ebp)
	movl	$0, -28(%ebp)
	jmp	L24
L27:
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+24, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jle	L25
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+8, %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L25
	movl	$1, -24(%ebp)
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+24, %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	jle	L26
	movl	8(%ebp), %eax
	addl	%eax, -12(%ebp)
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+24, %eax
	movl	(%eax), %eax
	subl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	imull	$28, %edx, %edx
	addl	$_procs+24, %edx
	movl	%eax, (%edx)
	jmp	L25
L26:
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+24, %eax
	movl	(%eax), %eax
	addl	%eax, -12(%ebp)
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+8, %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	subl	%eax, %edx
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	subl	%eax, %edx
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	%edx, (%eax)
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+4, %eax
	movl	(%eax), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+20, %eax
	movl	%edx, (%eax)
	movl	-28(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+24, %eax
	movl	$0, (%eax)
	addl	$1, -16(%ebp)
L25:
	addl	$1, -28(%ebp)
L24:
	movl	_n, %eax
	cmpl	%eax, -28(%ebp)
	jl	L27
	cmpl	$0, -24(%ebp)
	jne	L23
	addl	$1, -12(%ebp)
L23:
	movl	_n, %eax
	cmpl	%eax, -16(%ebp)
	jl	L28
	movl	$LC6, (%esp)
	call	_puts
	movl	$0, -32(%ebp)
	jmp	L29
L30:
	movl	-32(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+20, %eax
	movl	(%eax), %ecx
	movl	-32(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs+16, %eax
	movl	(%eax), %edx
	movl	-32(%ebp), %eax
	imull	$28, %eax, %eax
	addl	$_procs, %eax
	movl	(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	addl	$1, -32(%ebp)
L29:
	movl	_n, %eax
	cmpl	%eax, -32(%ebp)
	jl	L30
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___main;	.scl	2;	.type	32;	.endef
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
	subl	$16, %esp
	call	___main
	call	_input
	call	_fcfs
	call	_priority_sched
	movl	$2, (%esp)
	call	_round_robin
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
