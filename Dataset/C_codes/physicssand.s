	.file	"physicssand.c"
	.comm	_particles, 80, 5
	.text
	.globl	_initParticles
	.def	_initParticles;	.scl	2;	.type	32;	.endef
_initParticles:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L3:
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -24(%ebp)
	fildl	-24(%ebp)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles, %eax
	fstps	(%eax)
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -24(%ebp)
	fildl	-24(%ebp)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+4, %eax
	fstps	(%eax)
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	fildl	-24(%ebp)
	fldl	LC0
	fmulp	%st, %st(1)
	fstps	-20(%ebp)
	flds	-20(%ebp)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+8, %eax
	fstps	(%eax)
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	fildl	-24(%ebp)
	fldl	LC1
	fmulp	%st, %st(1)
	fstps	-20(%ebp)
	flds	-20(%ebp)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+12, %eax
	fstps	(%eax)
	addl	$1, -4(%ebp)
L2:
	cmpl	$4, -4(%ebp)
	jle	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_updateParticles
	.def	_updateParticles;	.scl	2;	.type	32;	.endef
_updateParticles:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L5
L6:
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles, %eax
	flds	(%eax)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+8, %eax
	flds	(%eax)
	faddp	%st, %st(1)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles, %eax
	fstps	(%eax)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+4, %eax
	flds	(%eax)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+12, %eax
	flds	(%eax)
	faddp	%st, %st(1)
	movl	-4(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+4, %eax
	fstps	(%eax)
	addl	$1, -4(%ebp)
L5:
	cmpl	$4, -4(%ebp)
	jle	L6
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
LC3:
	.ascii "Particle %d: (%.2f, %.2f)\12\0"
	.text
	.globl	_showParticles
	.def	_showParticles;	.scl	2;	.type	32;	.endef
_showParticles:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	jmp	L8
L9:
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_particles+4, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	$_particles, %eax
	flds	(%eax)
	fxch	%st(1)
	fstpl	16(%esp)
	fstpl	8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L8:
	cmpl	$4, -12(%ebp)
	jle	L9
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "Step %d:\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	call	_initParticles
	movl	$0, 28(%esp)
	jmp	L11
L12:
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	call	_showParticles
	call	_updateParticles
	addl	$1, 28(%esp)
L11:
	cmpl	$4, 28(%esp)
	jle	L12
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
	.align 8
LC0:
	.long	0
	.long	1071644672
	.align 8
LC1:
	.long	858993459
	.long	1070805811
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
