/*
 * Benchmark functions
 */
#ifndef BENCHES_H
#define BENCHES_H
#include <inttypes.h>

extern long long empty(uint32_t*);
extern long long hundred_eors(uint32_t*);
extern long long hundred_normal_eors_input_is_output(uint32_t*);
extern long long hundred_normal_eors_interleaved(uint32_t*);
extern long long hundred_normal_eors_interleaved_margin(uint32_t*);
extern long long hundred_vector_eors_same(uint32_t*);
extern long long hundred_vector_eors_same_interleaved(uint32_t*);
extern long long hundred_vector_eors_same_interleaved_two(uint32_t*);
extern long long hundred_vector_eors_same_interleaved_three(uint32_t*);
extern long long vector_store(uint32_t*);
extern long long vector_load_unscaled_offset(uint32_t*);
extern long long vector_store_result(uint32_t*);
extern long long vector_store_eor(uint32_t*);
extern long long vector_store_load(uint32_t*);
extern long long vector_load_execution(uint32_t*);
extern long long vector_load_execution_interleave_ops(uint32_t*);
extern long long vector_load_execution_offset(uint32_t*);
extern long long vector_load_execution_offset_delay(uint32_t*);
extern long long vector_load_execution_offset_neg(uint32_t*);
extern long long vector_store_pair_execution(uint32_t*);
extern long long vector_load_pair_execution(uint32_t*);
extern long long vector_load_execution_eor(uint32_t*);
extern long long vector_load_execution_eor_sched(uint32_t*);
extern long long vector_load_pair_eor_unrelated(uint32_t*);
extern long long vector_load_pair_eor_first(uint32_t*);
extern long long vector_load_pair_eor_second(uint32_t*);

#endif
