#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>

#include "benches.h"

#define N_TESTS 1000

int compare(const void *a, const void *b) {
    return ((int)*(long long*) a - *(long long*)b);
}

void test(char* name, long long (*fp)(uint32_t*)) {
    printf("Testing %s\n", name);
    uint32_t buffer[8] = {0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49};

    long long tests[N_TESTS];
    for (int i = 0; i < N_TESTS; ++i) {
        tests[i] = (*fp)(buffer);
    }

    puts("Sorting...");
    qsort(tests, N_TESTS, sizeof(long long), compare);
    // print
    printf("\tMinimum num of cycles: %lld\n", tests[0]);
    printf("\tMedian num of cycles:  %lld\n", tests[N_TESTS/2]);
    printf("\tMaximum num of cycles: %lld\n", tests[N_TESTS-1]);
    puts("");

}

int main(int argc, char** argv) {
    puts("Welcome to microbenchmarking");

    test("empty", empty);
    test("hundred_eors", hundred_eors);
    test("hundred_normal_eors_input_is_output", hundred_normal_eors_input_is_output);
    test("hundred_normal_eors_interleaved", hundred_normal_eors_interleaved);
    test("hundred_normal_eors_interleaved_margin", hundred_normal_eors_interleaved_margin);
    test("hundred_vector_eors_same", hundred_vector_eors_same);
    test("hundred_vector_eors_same_interleaved", hundred_vector_eors_same_interleaved);
    test("hundred_vector_eors_same_interleaved_two", hundred_vector_eors_same_interleaved_two);
    test("hundred_vector_eors_same_interleaved_three", hundred_vector_eors_same_interleaved_three);
    test("vector_store", vector_store);
    test("vector_load_unscaled_offset", vector_load_unscaled_offset);
    test("vector_store_result", vector_store_result);
    test("vector_store_eor", vector_store_eor);
    test("vector_store_load", vector_store_load);
    test("vector_load_execution", vector_load_execution);
    test("vector_load_execution_interleave_ops", vector_load_execution_interleave_ops);
    test("vector_load_execution_offset", vector_load_execution_offset);
    test("vector_load_execution_offset_delay", vector_load_execution_offset_delay);
    test("vector_load_execution_offset_neg", vector_load_execution_offset_neg);
    test("vector_store_pair_execution", vector_store_pair_execution);
    test("vector_load_pair_execution", vector_load_pair_execution);
    test("vector_load_execution_eor", vector_load_execution_eor);
    test("vector_load_execution_eor_sched", vector_load_execution_eor_sched);
    test("vector_load_pair_eor_unrelated", vector_load_pair_eor_unrelated);
    test("vector_load_pair_eor_first", vector_load_pair_eor_first);
    test("vector_load_pair_eor_second", vector_load_pair_eor_second);

}
