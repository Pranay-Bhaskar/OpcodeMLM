	.file	"multiplayercardgame.c"
	.globl	_suits
	.section .rdata,"dr"
LC0:
	.ascii "Hearts\0"
LC1:
	.ascii "Diamonds\0"
LC2:
	.ascii "Clubs\0"
LC3:
	.ascii "Spades\0"
	.data
	.align 4
_suits:
	.long	LC0
	.long	LC1
	.long	LC2
	.long	LC3
	.globl	_ranks
	.section .rdata,"dr"
LC4:
	.ascii "2\0"
LC5:
	.ascii "3\0"
LC6:
	.ascii "4\0"
LC7:
	.ascii "5\0"
LC8:
	.ascii "6\0"
LC9:
	.ascii "7\0"
LC10:
	.ascii "8\0"
LC11:
	.ascii "9\0"
LC12:
	.ascii "10\0"
LC13:
	.ascii "J\0"
LC14:
	.ascii "Q\0"
LC15:
	.ascii "K\0"
LC16:
	.ascii "A\0"
	.data
	.align 32
_ranks:
	.long	LC4
	.long	LC5
	.long	LC6
	.long	LC7
	.long	LC8
	.long	LC9
	.long	LC10
	.long	LC11
	.long	LC12
	.long	LC13
	.long	LC14
	.long	LC15
	.long	LC16
	.comm	_deck, 416, 5
	.comm	_hands, 160, 5
	.text
	.globl	_initDeck
	.def	_initDeck;	.scl	2;	.type	32;	.endef
_initDeck:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L2
L5:
	movl	$0, -12(%ebp)
	jmp	L3
L4:
	movl	-12(%ebp), %eax
	movl	_ranks(,%eax,4), %edx
	movl	-4(%ebp), %eax
	movl	%edx, _deck(,%eax,8)
	movl	-8(%ebp), %eax
	movl	_suits(,%eax,4), %edx
	movl	-4(%ebp), %eax
	movl	%edx, _deck+4(,%eax,8)
	addl	$1, -4(%ebp)
	addl	$1, -12(%ebp)
L3:
	cmpl	$12, -12(%ebp)
	jle	L4
	addl	$1, -8(%ebp)
L2:
	cmpl	$3, -8(%ebp)
	jle	L5
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_shuffleDeck
	.def	_shuffleDeck;	.scl	2;	.type	32;	.endef
_shuffleDeck:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -12(%ebp)
	jmp	L7
L8:
	call	_rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$4, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	imull	$52, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	_deck+4(,%eax,8), %edx
	movl	_deck(,%eax,8), %eax
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	movl	-12(%ebp), %ecx
	movl	-16(%ebp), %eax
	movl	_deck+4(,%eax,8), %edx
	movl	_deck(,%eax,8), %eax
	movl	%eax, _deck(,%ecx,8)
	movl	%edx, _deck+4(,%ecx,8)
	movl	-16(%ebp), %ecx
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%eax, _deck(,%ecx,8)
	movl	%edx, _deck+4(,%ecx,8)
	addl	$1, -12(%ebp)
L7:
	cmpl	$51, -12(%ebp)
	jle	L8
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_dealCards
	.def	_dealCards;	.scl	2;	.type	32;	.endef
_dealCards:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L10
L13:
	movl	$0, -12(%ebp)
	jmp	L11
L12:
	movl	-4(%ebp), %edx
	leal	1(%edx), %eax
	movl	%eax, -4(%ebp)
	movl	-8(%ebp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	-12(%ebp), %ecx
	addl	%eax, %ecx
	movl	_deck(,%edx,8), %eax
	movl	_deck+4(,%edx,8), %edx
	movl	%eax, _hands(,%ecx,8)
	movl	%edx, _hands+4(,%ecx,8)
	addl	$1, -12(%ebp)
L11:
	cmpl	$4, -12(%ebp)
	jle	L12
	addl	$1, -8(%ebp)
L10:
	cmpl	$3, -8(%ebp)
	jle	L13
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC17:
	.ascii "Player %d hand:\12\0"
LC18:
	.ascii "%s of %s\12\0"
	.text
	.globl	_showHands
	.def	_showHands;	.scl	2;	.type	32;	.endef
_showHands:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L15
L18:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	movl	$0, -16(%ebp)
	jmp	L16
L17:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	_hands+4(,%eax,8), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	_hands(,%eax,8), %eax
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
L16:
	cmpl	$4, -16(%ebp)
	jle	L17
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L15:
	cmpl	$3, -12(%ebp)
	jle	L18
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.def	___main;	.scl	2;	.type	32;	.endef
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
	subl	$16, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	call	_initDeck
	call	_shuffleDeck
	call	_dealCards
	call	_showHands
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
