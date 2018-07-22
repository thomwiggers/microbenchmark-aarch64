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

Cite
----

If you use this work, please refer to the parent work:

Thom Wiggers _Energy-efficient ARM64 Cluster with Cryptanalytic Applications: 80 cores that do not cost you an ARM and a leg._ Latincrypt 2017. _to appear_
