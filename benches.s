.text

.align	2
.global	empty
.type	empty, %function
empty:
    mrs x9, PMCCNTR_EL0
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
    add v0.4s, v0.4s, v0.4s
    ldr q1, [x1, #16]
    add v1.4s, v1.4s, v1.4s
    ldr q2, [x1, #16]
    add v2.4s, v2.4s, v2.4s
    ldr q3, [x1, #16]
    add v3.4s, v3.4s, v3.4s
    ldr q4, [x1, #16]
    add v4.4s, v4.4s, v4.4s
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
    add x1, x1, #16
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
.global vector_load_pair_add_unrelated
.type vector_load_pair_add_unrelated, %function
vector_load_pair_add_unrelated:
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
    add v3.4s, v3.4s, v3.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align 2
.global vector_load_pair_add_first
.type vector_load_pair_add_first, %function
vector_load_pair_add_first:
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
    add v0.4s, v0.4s, v0.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_pair_add_second
.type vector_load_pair_add_second, %function
vector_load_pair_add_second:
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
    add v1.4s, v1.4s, v1.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret
    
.align 2
.global vector_load_execution_add
.type vector_load_execution_add, %function
vector_load_execution_add:
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
    add v0.4s, v0.4s, v0.4s
    ldr q1, [x1]
    add v1.4s, v1.4s, v1.4s
    ldr q2, [x1]
    add v2.4s, v2.4s, v2.4s
    ldr q3, [x1]
    add v3.4s, v3.4s, v3.4s
    ldr q4, [x1]
    add v4.4s, v4.4s, v4.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align 2
.global vector_load_execution_add_sched
.type vector_load_execution_add_sched, %function
vector_load_execution_add_sched:
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
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v3.4s, v3.4s, v3.4s
    add v4.4s, v4.4s, v4.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align	2
.global	hundred_adds
.type	hundred_adds, %function
hundred_adds:
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
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x15
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    add x9, xzr, xzr
    add x10, x11, x12
    add x11, x12, x13
    add x12, x13, x14
    add x15, x16, x17
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

    sub x0, x10, x9
    ret

.align	2
.global	hundred_normal_adds_input_is_output
.type	hundred_normal_adds_input_is_output, %function
hundred_normal_adds_input_is_output:
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
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    add x9, x9, x9
    mrs x17, PMCCNTR_EL0
    sub x0, x17, x18
    ret

.align	2
.global	hundred_normal_adds_interleaved
.type	hundred_normal_adds_interleaved, %function
hundred_normal_adds_interleaved:
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
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    add x9, x10, x11
    add x10, x9, x11
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_normal_adds_interleaved_margin
.type	hundred_normal_adds_interleaved_margin, %function
hundred_normal_adds_interleaved_margin:
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
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    add x9, x9, x11
    add x13, x12, x11
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_vector_adds_same
.type	hundred_vector_adds_same, %function
hundred_vector_adds_same:
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
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    add v0.4s, v0.4s, v0.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_vector_adds_same_interleaved
.type	hundred_vector_adds_same_interleaved, %function
hundred_vector_adds_same_interleaved:
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
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret


.align	2
.global	hundred_vector_adds_same_interleaved_two
.type	hundred_vector_adds_same_interleaved_two, %function
hundred_vector_adds_same_interleaved_two:
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
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v0.4s, v0.4s, v0.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret

.align	2
.global	hundred_vector_adds_same_interleaved_three
.type	hundred_vector_adds_same_interleaved_three, %function
hundred_vector_adds_same_interleaved_three:
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
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    add v0.4s, v0.4s, v0.4s
    add v1.4s, v1.4s, v1.4s
    add v2.4s, v2.4s, v2.4s
    add v4.4s, v4.4s, v4.4s
    mrs x18, PMCCNTR_EL0
    sub x0, x18, x17
    ret
