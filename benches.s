.text

.align	2
.global	empty
.type	empty, %function
empty:
    mrs x9, PMCCNTR_EL0
    mrs x10, PMCCNTR_EL0
    sub x0, x10, x9
    ret

 .align	2
.global	vector_load_unscaled_offset
.type	vector_load_unscaled_offset, %function
vector_load_unscaled_offset:
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x9, PMCCNTR_EL0
    ldur q0, [x1, #16]
    mrs x10, PMCCNTR_EL0
    sub x0, x10, x9
    ret

 .align	2
.global	vector_store
.type	vector_store, %function
vector_store:
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x9, PMCCNTR_EL0
    str q0, [x1]
    mrs x10, PMCCNTR_EL0
    sub x0, x10, x9
    ret

 .align	2
.global	vector_store_result
.type	vector_store_result, %function
vector_store_result:
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x9, PMCCNTR_EL0
    eor v0.8b, v0.8b, v0.8b
    str q0, [x1]
    mrs x10, PMCCNTR_EL0
    sub x0, x10, x9
    ret

 .align	2
.global	vector_store_eor
.type	vector_store_eor, %function
vector_store_eor:
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x9, PMCCNTR_EL0
    str q0, [x1]
    eor v0.8b, v0.8b, v0.8b
    mrs x10, PMCCNTR_EL0
    sub x0, x10, x9
    ret

 .align	2
.global	vector_store_load
.type	vector_store_load, %function
vector_store_load:
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x9, PMCCNTR_EL0
    str q0, [x1]
    ldr q0, [x1]
    mrs x10, PMCCNTR_EL0
    sub x0, x10, x9
    ret


.align 2
.global vector_load_execution
.type vector_load_execution, %function
vector_load_execution:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldr q0, [x1]
    ldr q1, [x1]
    ldr q2, [x1]
    ldr q3, [x1]
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_execution_interleave_ops
.type vector_load_execution_interleave_ops, %function
vector_load_execution_interleave_ops:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldr q0, [x1]
    eor v2.8b, v5.8b, v15.8b
    ldr q1, [x1]
    eor v6.8b, v14.8b, v4.8b
    ldr q2, [x1]
    eor v7.8b, v10.8b, v9.8b
    ldr q3, [x1]
    eor v4.8b, v11.8b, v12.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align 2
.global vector_load_execution_offset
.type vector_load_execution_offset, %function
vector_load_execution_offset:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldr q0, [x1, #16]
    ldr q1, [x1, #16]
    ldr q2, [x1, #16]
    ldr q3, [x1, #16]
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_execution_offset_delay
.type vector_load_execution_offset_delay, %function
vector_load_execution_offset_delay:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldr q0, [x1, #16]
    eor v0.8b, v0.8b, v0.8b
    ldr q1, [x1, #16]
    eor v1.8b, v1.8b, v1.8b
    ldr q2, [x1, #16]
    eor v2.8b, v2.8b, v2.8b
    ldr q3, [x1, #16]
    eor v3.8b, v3.8b, v3.8b
    ldr q4, [x1, #16]
    eor v4.8b, v4.8b, v4.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align 2
.global vector_load_execution_offset_neg
.type vector_load_execution_offset_neg, %function
vector_load_execution_offset_neg:
    nop
    nop
    nop
    mov x1, x0
    eor x1, x1, #16
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldr q0, [x1, #-16]
    ldr q1, [x1, #-16]
    ldr q2, [x1, #-16]
    ldr q3, [x1, #-16]
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_store_pair_execution
.type vector_store_pair_execution, %function
vector_store_pair_execution:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    stp q0, q1, [x1]
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_pair_execution
.type vector_load_pair_execution, %function
vector_load_pair_execution:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldp q0, q1, [x1]
    ldp q2, q3, [x1]
    ldp q4, q5, [x1]
    ldp q6, q7, [x1]
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_pair_eor_unrelated
.type vector_load_pair_eor_unrelated, %function
vector_load_pair_eor_unrelated:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldp q0, q1, [x1]
    eor v3.8b, v3.8b, v3.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align 2
.global vector_load_pair_eor_first
.type vector_load_pair_eor_first, %function
vector_load_pair_eor_first:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldp q0, q1, [x1]
    eor v0.8b, v0.8b, v0.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_pair_eor_second
.type vector_load_pair_eor_second, %function
vector_load_pair_eor_second:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldp q0, q1, [x1]
    nop
    nop
    eor v1.8b, v1.8b, v1.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret
    
.align 2
.global vector_load_execution_eor
.type vector_load_execution_eor, %function
vector_load_execution_eor:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldr q0, [x1]
    eor v0.8b, v0.8b, v0.8b
    ldr q1, [x1]
    eor v1.8b, v1.8b, v1.8b
    ldr q2, [x1]
    eor v2.8b, v2.8b, v2.8b
    ldr q3, [x1]
    eor v3.8b, v3.8b, v3.8b
    ldr q4, [x1]
    eor v4.8b, v4.8b, v4.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_execution_eor_sched
.type vector_load_execution_eor_sched, %function
vector_load_execution_eor_sched:
    nop
    nop
    nop
    mov x1, x0
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    ldr q0, [x1]
    ldr q1, [x1]
    ldr q2, [x1]
    ldr q3, [x1]
    ldr q4, [x1]
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v3.8b, v3.8b, v3.8b
    eor v4.8b, v4.8b, v4.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align	2
.global	hundred_eors
.type	hundred_eors, %function
hundred_eors:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x15
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    eor x9, xzr, xzr
    eor x10, x11, x12
    eor x11, x12, x13
    eor x12, x13, x14
    eor x15, x16, x17
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

    sub x0, x10, x9
    ret

.align	2
.global	hundred_normal_eors_input_is_output
.type	hundred_normal_eors_input_is_output, %function
hundred_normal_eors_input_is_output:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x18, PMCCNTR_EL0
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    eor x9, x9, x9
    mrs x17, PMCCNTR_EL0
    sub x0, x17, x18
    ret

.align	2
.global	hundred_normal_eors_interleaved
.type	hundred_normal_eors_interleaved, %function
hundred_normal_eors_interleaved:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    eor x9, x10, x11
    eor x10, x9, x11
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_normal_eors_interleaved_margin
.type	hundred_normal_eors_interleaved_margin, %function
hundred_normal_eors_interleaved_margin:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    eor x9, x9, x11
    eor x13, x12, x11
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_vector_eors_same
.type	hundred_vector_eors_same, %function
hundred_vector_eors_same:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    eor v0.8b, v0.8b, v0.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_vector_eors_same_interleaved
.type	hundred_vector_eors_same_interleaved, %function
hundred_vector_eors_same_interleaved:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align	2
.global	hundred_vector_eors_same_interleaved_two
.type	hundred_vector_eors_same_interleaved_two, %function
hundred_vector_eors_same_interleaved_two:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v0.8b, v0.8b, v0.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_vector_eors_same_interleaved_three
.type	hundred_vector_eors_same_interleaved_three, %function
hundred_vector_eors_same_interleaved_three:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    mrs x17, PMCCNTR_EL0
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    eor v0.8b, v0.8b, v0.8b
    eor v1.8b, v1.8b, v1.8b
    eor v2.8b, v2.8b, v2.8b
    eor v4.8b, v4.8b, v4.8b
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret
