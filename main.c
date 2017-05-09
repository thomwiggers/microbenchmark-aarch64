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
    test("hundred_adds", hundred_adds);
    test("hundred_normal_adds_input_is_output", hundred_normal_adds_input_is_output);
    test("hundred_normal_adds_interleaved", hundred_normal_adds_interleaved);
    test("hundred_normal_adds_interleaved_margin", hundred_normal_adds_interleaved_margin);
    test("hundred_vector_adds_same", hundred_vector_adds_same);
    test("hundred_vector_adds_same_interleaved", hundred_vector_adds_same_interleaved);
    test("hundred_vector_adds_same_interleaved_two", hundred_vector_adds_same_interleaved_two);
    test("hundred_vector_adds_same_interleaved_three", hundred_vector_adds_same_interleaved_three);
    test("vector_store", vector_store);
    test("vector_load_unscaled_offset", vector_load_unscaled_offset);
    test("vector_store_result", vector_store_result);
    test("vector_store_add", vector_store_add);
    test("vector_store_load", vector_store_load);
    test("vector_load_execution", vector_load_execution);
    test("vector_load_execution_interleave_ops", vector_load_execution_interleave_ops);
    test("vector_load_execution_offset", vector_load_execution_offset);
    test("vector_load_execution_offset_delay", vector_load_execution_offset_delay);
    test("vector_load_execution_offset_neg", vector_load_execution_offset_neg);
    test("vector_store_pair_execution", vector_store_pair_execution);
    test("vector_load_pair_execution", vector_load_pair_execution);
    test("vector_load_execution_add", vector_load_execution_add);
    test("vector_load_execution_add_sched", vector_load_execution_add_sched);
    test("vector_load_pair_add_unrelated", vector_load_pair_add_unrelated);
    test("vector_load_pair_add_first", vector_load_pair_add_first);
    test("vector_load_pair_add_second", vector_load_pair_add_second);

}
