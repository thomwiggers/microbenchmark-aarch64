CFLAGS=-O3 -march=native -mtune=cortex-a53

.PHONY: run
run:
	python3 benchmarks.py

bench: main.c benches.o
	$(CC) ${CFLAGS} -o $@ $^


%.o: %.s
	$(AS) -o $@ -c $<
