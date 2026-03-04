	.file	"engine.c"
	.comm	_rooms, 7720, 5
	.globl	_current_room
	.bss
	.align 4
_current_room:
	.space 4
	.text
	.globl	_init_game
	.def	_init_game;	.scl	2;	.type	32;	.endef
_init_game:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$1920233029, _rooms
	movl	$1701015137, _rooms+4
	movb	$0, _rooms+8
	movl	$544567129, _rooms+50
	movl	$543519329, _rooms+54
	movl	$1948284001, _rooms+58
	movl	$1696621928, _rooms+62
	movl	$1634890862, _rooms+66
	movl	$543515502, _rooms+70
	movl	$1629513327, _rooms+74
	movl	$1918985248, _rooms+78
	movl	$1633886315, _rooms+82
	movl	$3040630, _rooms+86
	movl	$1, _rooms+256
	movl	$1, _rooms+768
	movl	$1668444020, _rooms+268
	movw	$104, _rooms+272
	movl	$1819042120, _rooms+772
	movb	$0, _rooms+776
	movl	$1869357121, _rooms+822
	movl	$1746954094, _rooms+826
	movl	$543976545, _rooms+830
	movl	$1752459639, _rooms+834
	movl	$1769104416, _rooms+838
	movl	$1852403824, _rooms+842
	movl	$1635197031, _rooms+846
	movl	$779249012, _rooms+850
	movb	$0, _rooms+854
	movl	$0, _rooms+1036
	movl	$2, _rooms+1032
	movl	$0, _rooms+1540
	movl	$1634038356, _rooms+1544
	movl	$1701999987, _rooms+1548
	movl	$1869566496, _rooms+1552
	movw	$109, _rooms+1556
	movl	$1818697793, _rooms+1594
	movl	$1702130793, _rooms+1598
	movl	$1735289202, _rooms+1602
	movl	$1869574688, _rooms+1606
	movl	$1768300653, _rooms+1610
	movl	$1684368492, _rooms+1614
	movl	$1953068832, _rooms+1618
	movl	$1869029480, _rooms+1622
	movl	$2188396, _rooms+1626
	movl	$1, _rooms+1796
	movl	$2, _rooms+2312
	movl	$1684828007, _rooms+1812
	movb	$0, _rooms+1816
	movl	$2003792483, _rooms+1862
	movw	$110, _rooms+1866
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC0:
	.ascii "== %s ==\12%s\12\0"
LC1:
	.ascii "Items here: \0"
LC2:
	.ascii "%s \0"
LC3:
	.ascii "Exits: \0"
LC4:
	.ascii "N \0"
LC5:
	.ascii "E \0"
LC6:
	.ascii "S \0"
LC7:
	.ascii "W \0"
	.text
	.globl	_look
	.def	_look;	.scl	2;	.type	32;	.endef
_look:
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
	subl	$812, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	_current_room, %eax
	imull	$772, %eax, %eax
	leal	_rooms(%eax), %edx
	leal	-800(%ebp), %eax
	movl	%edx, %ebx
	movl	$193, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	leal	-800(%ebp), %eax
	addl	$50, %eax
	movl	%eax, 8(%esp)
	leal	-800(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-32(%ebp), %eax
	testl	%eax, %eax
	jle	L3
	movl	$LC1, (%esp)
	call	_printf
	movl	$0, -28(%ebp)
	jmp	L4
L5:
	leal	-800(%ebp), %eax
	movl	-28(%ebp), %edx
	imull	$50, %edx, %edx
	addl	$256, %edx
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	addl	$1, -28(%ebp)
L4:
	movl	-32(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jg	L5
	movl	$10, (%esp)
	call	_putchar
L3:
	movl	$LC3, (%esp)
	call	_printf
	movl	-548(%ebp), %eax
	cmpl	$-1, %eax
	je	L6
	movl	$LC4, (%esp)
	call	_printf
L6:
	movl	-544(%ebp), %eax
	cmpl	$-1, %eax
	je	L7
	movl	$LC5, (%esp)
	call	_printf
L7:
	movl	-540(%ebp), %eax
	cmpl	$-1, %eax
	je	L8
	movl	$LC6, (%esp)
	call	_printf
L8:
	movl	-536(%ebp), %eax
	cmpl	$-1, %eax
	je	L9
	movl	$LC7, (%esp)
	call	_printf
L9:
	movl	$10, (%esp)
	call	_putchar
	nop
	addl	$812, %esp
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
	.section .rdata,"dr"
LC8:
	.ascii "north\0"
LC9:
	.ascii "east\0"
LC10:
	.ascii "south\0"
LC11:
	.ascii "west\0"
LC12:
	.ascii "Unknown direction.\0"
LC13:
	.ascii "No exit that way.\0"
	.text
	.globl	_move
	.def	_move;	.scl	2;	.type	32;	.endef
_move:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$-1, -12(%ebp)
	movl	$LC8, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L11
	movl	$0, -12(%ebp)
	jmp	L12
L11:
	movl	$LC9, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L13
	movl	$1, -12(%ebp)
	jmp	L12
L13:
	movl	$LC10, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L14
	movl	$2, -12(%ebp)
	jmp	L12
L14:
	movl	$LC11, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L12
	movl	$3, -12(%ebp)
L12:
	cmpl	$-1, -12(%ebp)
	jne	L15
	movl	$LC12, (%esp)
	call	_puts
	jmp	L10
L15:
	movl	_current_room, %eax
	imull	$193, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	addl	$60, %eax
	movl	_rooms+12(,%eax,4), %eax
	cmpl	$-1, %eax
	je	L17
	movl	_current_room, %eax
	imull	$193, %eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	addl	$60, %eax
	movl	_rooms+12(,%eax,4), %eax
	movl	%eax, _current_room
	call	_look
	jmp	L10
L17:
	movl	$LC13, (%esp)
	call	_puts
L10:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC14:
	.ascii "You take the %s.\12\0"
LC15:
	.ascii "No such item here.\0"
	.text
	.globl	_take
	.def	_take;	.scl	2;	.type	32;	.endef
_take:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_current_room, %eax
	imull	$772, %eax, %eax
	addl	$_rooms, %eax
	movl	%eax, -20(%ebp)
	movl	$0, -12(%ebp)
	jmp	L19
L24:
	movl	-12(%ebp), %eax
	imull	$50, %eax, %eax
	leal	256(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L20
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L21
L22:
	movl	-16(%ebp), %eax
	addl	$1, %eax
	imull	$50, %eax, %eax
	leal	256(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	12(%eax), %edx
	movl	-16(%ebp), %eax
	imull	$50, %eax, %eax
	leal	256(%eax), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	addl	$12, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	addl	$1, -16(%ebp)
L21:
	movl	-20(%ebp), %eax
	movl	768(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jg	L22
	movl	-20(%ebp), %eax
	movl	768(%eax), %eax
	leal	-1(%eax), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 768(%eax)
	jmp	L18
L20:
	addl	$1, -12(%ebp)
L19:
	movl	-20(%ebp), %eax
	movl	768(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L24
	movl	$LC15, (%esp)
	call	_puts
L18:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC16:
	.ascii "> \0"
LC17:
	.ascii "\12\0"
LC18:
	.ascii "quit\0"
LC19:
	.ascii "look\0"
LC20:
	.ascii "go \0"
LC21:
	.ascii "take \0"
LC22:
	.ascii "Unknown command.\0"
LC23:
	.ascii "Game over.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	addl	$-128, %esp
	call	___main
	movl	$0, 124(%esp)
	jmp	L26
L29:
	movl	$0, 120(%esp)
	jmp	L27
L28:
	movl	124(%esp), %eax
	imull	$193, %eax, %edx
	movl	120(%esp), %eax
	addl	%edx, %eax
	addl	$60, %eax
	movl	$-1, _rooms+12(,%eax,4)
	addl	$1, 120(%esp)
L27:
	cmpl	$3, 120(%esp)
	jle	L28
	movl	124(%esp), %eax
	imull	$772, %eax, %eax
	addl	$_rooms+768, %eax
	movl	$0, (%eax)
	addl	$1, 124(%esp)
L26:
	cmpl	$9, 124(%esp)
	jle	L29
	call	_init_game
	call	_look
L37:
	movl	$LC16, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	testl	%eax, %eax
	je	L39
	movl	$LC17, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, 20(%esp,%eax)
	movl	$LC18, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	je	L40
	movl	$LC19, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L33
	call	_look
	jmp	L37
L33:
	movl	$3, 8(%esp)
	movl	$LC20, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	jne	L35
	leal	20(%esp), %eax
	addl	$3, %eax
	movl	%eax, (%esp)
	call	_move
	jmp	L37
L35:
	movl	$5, 8(%esp)
	movl	$LC21, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	jne	L36
	leal	20(%esp), %eax
	addl	$5, %eax
	movl	%eax, (%esp)
	call	_take
	jmp	L37
L36:
	movl	$LC22, (%esp)
	call	_puts
	jmp	L37
L39:
	nop
	jmp	L31
L40:
	nop
L31:
	movl	$LC23, (%esp)
	call	_puts
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
	.def	_strncmp;	.scl	2;	.type	32;	.endef
