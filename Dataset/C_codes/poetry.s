	.file	"poetry.c"
	.globl	_nouns
	.section .rdata,"dr"
LC0:
	.ascii "moon\0"
LC1:
	.ascii "river\0"
LC2:
	.ascii "dream\0"
LC3:
	.ascii "shadow\0"
LC4:
	.ascii "flame\0"
LC5:
	.ascii "forest\0"
LC6:
	.ascii "cloud\0"
LC7:
	.ascii "stone\0"
LC8:
	.ascii "song\0"
LC9:
	.ascii "silence\0"
	.data
	.align 32
_nouns:
	.long	LC0
	.long	LC1
	.long	LC2
	.long	LC3
	.long	LC4
	.long	LC5
	.long	LC6
	.long	LC7
	.long	LC8
	.long	LC9
	.globl	_verbs
	.section .rdata,"dr"
LC10:
	.ascii "whispers\0"
LC11:
	.ascii "flows\0"
LC12:
	.ascii "burns\0"
LC13:
	.ascii "wanders\0"
LC14:
	.ascii "falls\0"
LC15:
	.ascii "rises\0"
LC16:
	.ascii "sleeps\0"
LC17:
	.ascii "shines\0"
LC18:
	.ascii "calls\0"
LC19:
	.ascii "waits\0"
	.data
	.align 32
_verbs:
	.long	LC10
	.long	LC11
	.long	LC12
	.long	LC13
	.long	LC14
	.long	LC15
	.long	LC16
	.long	LC17
	.long	LC18
	.long	LC19
	.globl	_adjectives
	.section .rdata,"dr"
LC20:
	.ascii "silent\0"
LC21:
	.ascii "ancient\0"
LC22:
	.ascii "lonely\0"
LC23:
	.ascii "bright\0"
LC24:
	.ascii "dark\0"
LC25:
	.ascii "gentle\0"
LC26:
	.ascii "wild\0"
LC27:
	.ascii "fragile\0"
LC28:
	.ascii "eternal\0"
LC29:
	.ascii "hidden\0"
	.data
	.align 32
_adjectives:
	.long	LC20
	.long	LC21
	.long	LC22
	.long	LC23
	.long	LC24
	.long	LC25
	.long	LC26
	.long	LC27
	.long	LC28
	.long	LC29
	.globl	_articles
	.section .rdata,"dr"
LC30:
	.ascii "the\0"
LC31:
	.ascii "a\0"
LC32:
	.ascii "one\0"
LC33:
	.ascii "this\0"
LC34:
	.ascii "that\0"
LC35:
	.ascii "each\0"
LC36:
	.ascii "every\0"
LC37:
	.ascii "some\0"
LC38:
	.ascii "any\0"
LC39:
	.ascii "no\0"
	.data
	.align 32
_articles:
	.long	LC30
	.long	LC31
	.long	LC32
	.long	LC33
	.long	LC34
	.long	LC35
	.long	LC36
	.long	LC37
	.long	LC38
	.long	LC39
	.section .rdata,"dr"
LC40:
	.ascii "%s %s %s %s\0"
	.text
	.globl	_random_line
	.def	_random_line;	.scl	2;	.type	32;	.endef
_random_line:
LFB18:
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
	call	_rand
	movl	%eax, %ecx
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
	movl	_verbs(,%edx,4), %edi
	call	_rand
	movl	%eax, %ecx
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
	movl	_nouns(,%edx,4), %esi
	call	_rand
	movl	%eax, %ecx
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
	movl	_adjectives(,%edx,4), %ebx
	call	_rand
	movl	%eax, %ecx
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
	movl	_articles(,%edx,4), %eax
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC40, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_sprintf
	nop
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
LFE18:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC41:
	.ascii "Random Poem:\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	addl	$-128, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$5, 120(%esp)
	movl	$LC41, (%esp)
	call	_puts
	movl	$0, 124(%esp)
	jmp	L3
L4:
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_random_line
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_puts
	addl	$1, 124(%esp)
L3:
	movl	124(%esp), %eax
	cmpl	120(%esp), %eax
	jl	L4
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_sprintf;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
