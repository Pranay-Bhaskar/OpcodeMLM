	.file	"inventrymanagement.c"
	.comm	_inventory, 11200, 5
	.globl	_product_count
	.bss
	.align 4
_product_count:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "w\0"
LC1:
	.ascii "fopen\0"
LC2:
	.ascii "%d,%s,%d,%.2f\12\0"
LC3:
	.ascii "Inventory saved to %s\12\0"
	.text
	.globl	_save_inventory
	.def	_save_inventory;	.scl	2;	.type	32;	.endef
_save_inventory:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
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
	addl	$_inventory+108, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory+104, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	leal	4(%eax), %ecx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	movl	(%eax), %eax
	fstpl	20(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	addl	$1, -12(%ebp)
L4:
	movl	_product_count, %eax
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
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC5:
	.ascii "r\0"
LC6:
	.ascii "%d,%99[^,],%d,%f\12\0"
LC7:
	.ascii "Loaded inventory from %s\12\0"
	.text
	.globl	_load_inventory
	.def	_load_inventory;	.scl	2;	.type	32;	.endef
_load_inventory:
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
	movl	$LC5, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	je	L11
	movl	$0, _product_count
	jmp	L9
L10:
	movl	_product_count, %eax
	addl	$1, %eax
	movl	%eax, _product_count
L9:
	movl	_product_count, %eax
	imull	$112, %eax, %eax
	addl	$96, %eax
	addl	$_inventory, %eax
	leal	12(%eax), %ebx
	movl	_product_count, %eax
	imull	$112, %eax, %eax
	addl	$96, %eax
	addl	$_inventory, %eax
	leal	8(%eax), %ecx
	movl	_product_count, %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	leal	4(%eax), %edx
	movl	_product_count, %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	movl	%ebx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC6, 4(%esp)
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
	movl	$LC7, (%esp)
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
LC8:
	.ascii "Inventory full!\0"
LC9:
	.ascii "Enter product name: \0"
LC10:
	.ascii "\12\0"
LC11:
	.ascii "Enter quantity: \0"
LC12:
	.ascii "%d\0"
LC13:
	.ascii "Enter price: \0"
LC14:
	.ascii "%f\0"
LC15:
	.ascii "Product added.\0"
	.text
	.globl	_add_product
	.def	_add_product;	.scl	2;	.type	32;	.endef
_add_product:
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
	movl	_product_count, %eax
	cmpl	$99, %eax
	jle	L13
	movl	$LC8, (%esp)
	call	_puts
	jmp	L12
L13:
	movl	_product_count, %eax
	addl	$1, %eax
	movl	%eax, -136(%ebp)
	movl	$LC9, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	-136(%ebp), %eax
	addl	$4, %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC10, 4(%esp)
	leal	-136(%ebp), %eax
	addl	$4, %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, -132(%ebp,%eax)
	movl	$LC11, (%esp)
	call	_printf
	leal	-136(%ebp), %eax
	addl	$104, %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	call	_getchar
	movl	$LC13, (%esp)
	call	_printf
	leal	-136(%ebp), %eax
	addl	$108, %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_scanf
	call	_getchar
	movl	_product_count, %eax
	leal	1(%eax), %edx
	movl	%edx, _product_count
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	movl	%eax, %ebx
	leal	-136(%ebp), %eax
	movl	$28, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	movl	%edx, %ecx
	rep movsl
	movl	$LC15, (%esp)
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
LC16:
	.ascii "\12ID\11Name\11\11Qty\11Price\0"
LC17:
	.ascii "%d\11%s\11\11%d\11%.2f\12\0"
	.text
	.globl	_list_products
	.def	_list_products;	.scl	2;	.type	32;	.endef
_list_products:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC16, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L16
L17:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory+108, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory+104, %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	leal	4(%eax), %ecx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	movl	(%eax), %eax
	fstpl	16(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L16:
	movl	_product_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L17
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC18:
	.ascii "Enter product ID to update: \0"
LC19:
	.ascii "Enter new quantity: \0"
LC20:
	.ascii "Stock updated.\0"
LC21:
	.ascii "Product not found.\0"
	.text
	.globl	_update_stock
	.def	_update_stock;	.scl	2;	.type	32;	.endef
_update_stock:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC18, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	call	_getchar
	movl	$0, -12(%ebp)
	jmp	L19
L22:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	cmpl	%eax, %edx
	jne	L20
	movl	$LC19, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$96, %eax
	addl	$_inventory, %eax
	addl	$8, %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	call	_getchar
	movl	$LC20, (%esp)
	call	_puts
	jmp	L18
L20:
	addl	$1, -12(%ebp)
L19:
	movl	_product_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L22
	movl	$LC21, (%esp)
	call	_puts
L18:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC22:
	.ascii "Enter product ID sold: \0"
LC23:
	.ascii "Enter quantity sold: \0"
LC24:
	.ascii "Sale recorded. Total = %.2f\12\0"
LC25:
	.ascii "Not enough stock!\0"
	.text
	.globl	_record_sale
	.def	_record_sale;	.scl	2;	.type	32;	.endef
_record_sale:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC22, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	movl	$LC23, (%esp)
	call	_printf
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	call	_getchar
	movl	$0, -12(%ebp)
	jmp	L25
L30:
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	cmpl	%eax, %edx
	jne	L26
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory+104, %eax
	movl	(%eax), %edx
	movl	-24(%ebp), %eax
	cmpl	%eax, %edx
	jl	L27
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory+104, %eax
	movl	(%eax), %edx
	movl	-24(%ebp), %eax
	subl	%eax, %edx
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory+104, %eax
	movl	%edx, (%eax)
	movl	-24(%ebp), %eax
	movl	%eax, -28(%ebp)
	fildl	-28(%ebp)
	movl	-12(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory+108, %eax
	flds	(%eax)
	fmulp	%st, %st(1)
	fstps	-16(%ebp)
	flds	-16(%ebp)
	fstpl	4(%esp)
	movl	$LC24, (%esp)
	call	_printf
	jmp	L24
L27:
	movl	$LC25, (%esp)
	call	_puts
	jmp	L24
L26:
	addl	$1, -12(%ebp)
L25:
	movl	_product_count, %eax
	cmpl	%eax, -12(%ebp)
	jl	L30
	movl	$LC21, (%esp)
	call	_puts
L24:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC26:
	.ascii "Enter product ID to delete: \0"
LC27:
	.ascii "Product deleted.\0"
	.text
	.globl	_delete_product
	.def	_delete_product;	.scl	2;	.type	32;	.endef
_delete_product:
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
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$LC26, (%esp)
	call	_printf
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	call	_getchar
	movl	$0, -28(%ebp)
	jmp	L33
L38:
	movl	-28(%ebp), %eax
	imull	$112, %eax, %eax
	addl	$_inventory, %eax
	movl	(%eax), %edx
	movl	-36(%ebp), %eax
	cmpl	%eax, %edx
	jne	L34
	movl	-28(%ebp), %eax
	movl	%eax, -32(%ebp)
	jmp	L35
L36:
	movl	-32(%ebp), %eax
	leal	1(%eax), %ecx
	movl	-32(%ebp), %eax
	imull	$112, %eax, %eax
	leal	_inventory(%eax), %edx
	imull	$112, %ecx, %eax
	addl	$_inventory, %eax
	movl	%eax, %ebx
	movl	$28, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	addl	$1, -32(%ebp)
L35:
	movl	_product_count, %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jg	L36
	movl	_product_count, %eax
	subl	$1, %eax
	movl	%eax, _product_count
	movl	$LC27, (%esp)
	call	_puts
	jmp	L32
L34:
	addl	$1, -28(%ebp)
L33:
	movl	_product_count, %eax
	cmpl	%eax, -28(%ebp)
	jl	L38
	movl	$LC21, (%esp)
	call	_puts
L32:
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
LFE23:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC28:
	.ascii "\12--- Inventory Menu ---\0"
LC29:
	.ascii "1. Add Product\0"
LC30:
	.ascii "2. List Products\0"
LC31:
	.ascii "3. Update Stock\0"
LC32:
	.ascii "4. Record Sale\0"
LC33:
	.ascii "5. Delete Product\0"
LC34:
	.ascii "6. Save & Exit\0"
LC35:
	.ascii "Choice: \0"
LC36:
	.ascii "Exiting.\0"
LC37:
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
	subl	$48, %esp
	call	___main
	movl	$1702260329, 34(%esp)
	movl	$1919906926, 38(%esp)
	movl	$2020879993, 42(%esp)
	movw	$116, 46(%esp)
	leal	34(%esp), %eax
	movl	%eax, (%esp)
	call	_load_inventory
L51:
	movl	$LC28, (%esp)
	call	_puts
	movl	$LC29, (%esp)
	call	_puts
	movl	$LC30, (%esp)
	call	_puts
	movl	$LC31, (%esp)
	call	_puts
	movl	$LC32, (%esp)
	call	_puts
	movl	$LC33, (%esp)
	call	_puts
	movl	$LC34, (%esp)
	call	_puts
	movl	$LC35, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_scanf
	call	_getchar
	movl	28(%esp), %eax
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
	call	_add_product
	jmp	L49
L44:
	call	_list_products
	jmp	L49
L45:
	call	_update_stock
	jmp	L49
L46:
	call	_record_sale
	jmp	L49
L47:
	call	_delete_product
	jmp	L49
L48:
	leal	34(%esp), %eax
	movl	%eax, (%esp)
	call	_save_inventory
	movl	$LC36, (%esp)
	call	_puts
	movl	$0, %eax
	jmp	L52
L41:
	movl	$LC37, (%esp)
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
