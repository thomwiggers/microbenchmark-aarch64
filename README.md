Microbenchmarks for Cortex A53
==============================

Relies on access to the cycle counter, so you may need [this kernel module][enable_arm_pmu].


[enable_arm_pmu]: https://github.com/rdolbeau/enable_arm_pmu

Running
-------

Simply run `make`.
If you only want the binary, run `make bench`.

Dependencies
------------

* Aarch64 (ARMv8) device
* Make
* C compiler
