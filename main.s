	.arch armv8-a
	.file	"main.c"
	.text
	.align	2
	.global	compare
	.type	compare, %function
compare:
	sub	sp, sp, #16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x0, [x0]
	mov	w1, w0
	ldr	x0, [sp]
	ldr	x0, [x0]
	sub	w0, w1, w0
	add	sp, sp, 16
	ret
	.size	compare, .-compare
	.section	.rodata
	.align	3
.LC0:
	.string	"Testing %s\n"
	.align	3
.LC1:
	.string	"Sorting..."
	.align	3
.LC2:
	.string	"\tMinimum num of cycles: %lld\n"
	.align	3
.LC3:
	.string	"\tMedian num of cycles:  %lld\n"
	.align	3
.LC4:
	.string	"\tMaximum num of cycles: %lld\n"
	.align	3
.LC5:
	.string	""
	.text
	.align	2
	.global	test
	.type	test, %function
test:
	sub	sp, sp, #4096
	sub	sp, sp, #3936
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	str	x0, [x29, 24]
	str	x1, [x29, 16]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	ldr	x1, [x29, 24]
	bl	printf
	str	wzr, [x29, 8044]
	b	.L4
.L5:
	ldr	x0, [x29, 16]
	blr	x0
	mov	x2, x0
	ldrsw	x0, [x29, 8044]
	lsl	x0, x0, 3
	add	x1, x29, 40
	str	x2, [x1, x0]
	ldr	w0, [x29, 8044]
	add	w0, w0, 1
	str	w0, [x29, 8044]
.L4:
	ldr	w0, [x29, 8044]
	cmp	w0, 999
	ble	.L5
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	adrp	x0, compare
	add	x1, x0, :lo12:compare
	add	x0, x29, 40
	mov	x3, x1
	mov	x2, 8
	mov	x1, 1000
	bl	qsort
	ldr	x1, [x29, 40]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	ldr	x1, [x29, 4040]
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	ldr	x1, [x29, 8032]
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	nop
	ldp	x29, x30, [sp], 16
	add	sp, sp, 4096
	add	sp, sp, 3936
	ret
	.size	test, .-test
	.section	.rodata
	.align	3
.LC6:
	.string	"Welcome to microbenchmarking"
	.align	3
.LC7:
	.string	"empty"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	w0, [x29, 28]
	str	x1, [x29, 16]
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	adrp	x0, empty
	add	x1, x0, :lo12:empty
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	test
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 6.3.1 20170109"
	.section	.note.GNU-stack,"",@progbits
