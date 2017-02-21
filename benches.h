/*
 * Benchmark functions
 */
#ifndef BENCHES_H
#define BENCHES_H
#include <inttypes.h>

extern long long empty(uint32_t*);
extern long long hundred_adds(uint32_t*);
extern long long hundred_normal_adds_input_is_output(uint32_t*);
extern long long hundred_normal_adds_interleaved(uint32_t*);
extern long long hundred_normal_adds_interleaved_margin(uint32_t*);
extern long long hundred_vector_adds_same(uint32_t*);
extern long long hundred_vector_adds_same_interleaved(uint32_t*);
extern long long hundred_vector_adds_same_interleaved_two(uint32_t*);
extern long long hundred_vector_adds_same_interleaved_three(uint32_t*);
extern long long vector_load_execution(uint32_t*);
extern long long vector_load_execution_interleave_ops(uint32_t*);
extern long long vector_load_execution_offset(uint32_t*);
extern long long vector_load_execution_offset_delay(uint32_t*);
extern long long vector_load_execution_offset_neg(uint32_t*);
extern long long vector_load_pair_execution(uint32_t*);
extern long long vector_load_execution_add(uint32_t*);
extern long long vector_load_execution_add_sched(uint32_t*);
extern long long vector_load_pair_add_first(uint32_t*);
extern long long vector_load_pair_add_second(uint32_t*);

#endif
