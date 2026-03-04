	.file	"ts.c"
	.comm	_tasks, 11200, 5
	.globl	_task_count
	.bss
	.align 4
_task_count:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "w\0"
LC1:
	.ascii "fopen\0"
LC2:
	.ascii "%d,%s,%d,%d\12\0"
LC3:
	.ascii "Tasks saved to %s\12\0"
	.text
	.globl	_save_tasks
	.def	_save_tasks;	.scl	2;	.type	32;	.endef
_save_tasks:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	$LC0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L2
	movl	$LC1, (%esp)
	call	_perror
	jmp	L1
L2:
	movl	$0, -12(%ebp)
	jmp	L4
L5:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks+108, %eax
	movl	(%eax), %ecx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks+104, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	leal	4(%eax), %ebx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	(%eax), %eax
	movl	%ecx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	addl	$1, -12(%ebp)
L4:
	movl	_task_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L5
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L1:
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC4:
	.ascii "r\0"
LC5:
	.ascii "%d,%99[^,],%d,%d\12\0"
LC6:
	.ascii "Loaded tasks from %s\12\0"
	.text
	.globl	_load_tasks
	.def	_load_tasks;	.scl	2;	.type	32;	.endef
_load_tasks:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	$LC4, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	je	L11
	movl	$0, _task_count
	jmp	L9
L10:
	movl	_task_count, %eax
	addl	$1, %eax
	movl	%eax, _task_count
L9:
	movl	_task_count, %eax
	imull	$112, %eax, %eax
	addl	$96, %eax
	addl	$_tasks, %eax
	leal	12(%eax), %ebx
	movl	_task_count, %eax
	imull	$112, %eax, %eax
	addl	$96, %eax
	addl	$_tasks, %eax
	leal	8(%eax), %ecx
	movl	_task_count, %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	leal	4(%eax), %edx
	movl	_task_count, %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	%ebx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC5, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	cmpl	$4, %eax
	je	L10
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	jmp	L6
L11:
	nop
L6:
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC7:
	.ascii "Task list full!\0"
LC8:
	.ascii "Enter task name: \0"
LC9:
	.ascii "\12\0"
	.align 4
LC10:
	.ascii "Enter priority (1=high, 5=low): \0"
LC11:
	.ascii "%d\0"
LC12:
	.ascii "Task added.\0"
	.text
	.globl	_add_task
	.def	_add_task;	.scl	2;	.type	32;	.endef
_add_task:
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
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	_task_count, %eax
	cmpl	$99, %eax
	jle	L13
	movl	$LC7, (%esp)
	call	_puts
	jmp	L12
L13:
	movl	_task_count, %eax
	addl	$1, %eax
	movl	%eax, -136(%ebp)
	movl	$LC8, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	-136(%ebp), %eax
	addl	$4, %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC9, 4(%esp)
	leal	-136(%ebp), %eax
	addl	$4, %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -132(%ebp,%eax)
	movl	$LC10, (%esp)
	call	_printf
	leal	-136(%ebp), %eax
	addl	$104, %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	call	_getchar
	movl	$0, -28(%ebp)
	movl	_task_count, %eax
	leal	1(%eax), %edx
	movl	%edx, _task_count
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	%eax, %ebx
	leal	-136(%ebp), %eax
	movl	$28, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	movl	%edx, %ecx
	rep movsl
	movl	$LC12, (%esp)
	call	_puts
L12:
	addl	$140, %esp
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
LC13:
	.ascii "\12ID\11Name\11\11Priority\11Status\0"
LC14:
	.ascii "Done\0"
LC15:
	.ascii "Pending\0"
LC16:
	.ascii "%d\11%s\11\11%d\11\11%s\12\0"
	.text
	.globl	_list_tasks
	.def	_list_tasks;	.scl	2;	.type	32;	.endef
_list_tasks:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	$LC13, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L16
L19:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks+108, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L17
	movl	$LC14, %ebx
	jmp	L18
L17:
	movl	$LC15, %ebx
L18:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks+104, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	leal	4(%eax), %ecx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	(%eax), %eax
	movl	%ebx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L16:
	movl	_task_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L19
	nop
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC17:
	.ascii "Enter task ID to mark complete: \0"
LC18:
	.ascii "Task %d marked complete.\12\0"
LC19:
	.ascii "Task not found.\0"
	.text
	.globl	_complete_task
	.def	_complete_task;	.scl	2;	.type	32;	.endef
_complete_task:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC17, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	call	_getchar
	movl	$0, -12(%ebp)
	jmp	L21
L24:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	cmpl	%eax, %edx
	jne	L22
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks+108, %eax
	movl	$1, (%eax)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	jmp	L20
L22:
	addl	$1, -12(%ebp)
L21:
	movl	_task_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L24
	movl	$LC19, (%esp)
	call	_puts
L20:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC20:
	.ascii "Enter task ID to delete: \0"
LC21:
	.ascii "Task %d deleted.\12\0"
	.text
	.globl	_delete_task
	.def	_delete_task;	.scl	2;	.type	32;	.endef
_delete_task:
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
	movl	$LC20, (%esp)
	call	_printf
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	call	_getchar
	movl	$0, -28(%ebp)
	jmp	L27
L32:
	movl	-28(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	(%eax), %edx
	movl	-36(%ebp), %eax
	cmpl	%eax, %edx
	jne	L28
	movl	-28(%ebp), %eax
	movl	%eax, -32(%ebp)
	jmp	L29
L30:
	movl	-32(%ebp), %eax
	leal	1(%eax), %ecx
	movl	-32(%ebp), %eax
	imull	$112, %eax, %eax
	leal	_tasks(%eax), %edx
	imull	$112, %ecx, %eax
	addl	$_tasks, %eax
	movl	%eax, %ebx
	movl	$28, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	addl	$1, -32(%ebp)
L29:
	movl	_task_count, %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jg	L30
	movl	_task_count, %eax
	subl	$1, %eax
	movl	%eax, _task_count
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	jmp	L26
L28:
	addl	$1, -28(%ebp)
L27:
	movl	_task_count, %eax
	cmpl	%eax, -28(%ebp)
	jl	L32
	movl	$LC19, (%esp)
	call	_puts
L26:
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
	.section .rdata,"dr"
LC22:
	.ascii "Tasks sorted by priority.\0"
	.text
	.globl	_sort_tasks
	.def	_sort_tasks;	.scl	2;	.type	32;	.endef
_sort_tasks:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$156, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -28(%ebp)
	jmp	L35
L39:
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	L36
L38:
	movl	-28(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks+104, %eax
	movl	(%eax), %edx
	movl	-32(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks+104, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jle	L37
	movl	-28(%ebp), %eax
	imull	$112, %eax, %eax
	leal	_tasks(%eax), %edx
	leal	-144(%ebp), %eax
	movl	%edx, %ebx
	movl	$28, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	movl	-28(%ebp), %eax
	imull	$112, %eax, %eax
	leal	_tasks(%eax), %edx
	movl	-32(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	%eax, %ebx
	movl	$28, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-32(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_tasks, %eax
	movl	%eax, %ebx
	leal	-144(%ebp), %eax
	movl	$28, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	movl	%edx, %ecx
	rep movsl
L37:
	addl	$1, -32(%ebp)
L36:
	movl	_task_count, %eax
	cmpl	%eax, -32(%ebp)
	jl	L38
	addl	$1, -28(%ebp)
L35:
	movl	_task_count, %eax
	subl	$1, %eax
	cmpl	-28(%ebp), %eax
	jg	L39
	movl	$LC22, (%esp)
	call	_puts
	nop
	addl	$156, %esp
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
LFE23:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC23:
	.ascii "\12--- Task Scheduler Menu ---\0"
LC24:
	.ascii "1. Add Task\0"
LC25:
	.ascii "2. List Tasks\0"
LC26:
	.ascii "3. Complete Task\0"
LC27:
	.ascii "4. Delete Task\0"
LC28:
	.ascii "5. Sort Tasks by Priority\0"
LC29:
	.ascii "6. Save & Exit\0"
LC30:
	.ascii "Choice: \0"
LC31:
	.ascii "Exiting.\0"
LC32:
	.ascii "Invalid choice.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$1802723700, 22(%esp)
	movl	$2020879987, 26(%esp)
	movw	$116, 30(%esp)
	leal	22(%esp), %eax
	movl	%eax, (%esp)
	call	_load_tasks
L51:
	movl	$LC23, (%esp)
	call	_puts
	movl	$LC24, (%esp)
	call	_puts
	movl	$LC25, (%esp)
	call	_puts
	movl	$LC26, (%esp)
	call	_puts
	movl	$LC27, (%esp)
	call	_puts
	movl	$LC28, (%esp)
	call	_puts
	movl	$LC29, (%esp)
	call	_puts
	movl	$LC30, (%esp)
	call	_printf
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_scanf
	call	_getchar
	movl	16(%esp), %eax
	cmpl	$6, %eax
	ja	L41
	movl	L43(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L43:
	.long	L41
	.long	L42
	.long	L44
	.long	L45
	.long	L46
	.long	L47
	.long	L48
	.text
L42:
	call	_add_task
	jmp	L49
L44:
	call	_list_tasks
	jmp	L49
L45:
	call	_complete_task
	jmp	L49
L46:
	call	_delete_task
	jmp	L49
L47:
	call	_sort_tasks
	jmp	L49
L48:
	leal	22(%esp), %eax
	movl	%eax, (%esp)
	call	_save_tasks
	movl	$LC31, (%esp)
	call	_puts
	movl	$0, %eax
	jmp	L52
L41:
	movl	$LC32, (%esp)
	call	_puts
L49:
	jmp	L51
L52:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
