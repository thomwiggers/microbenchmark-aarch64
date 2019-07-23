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

Wiggers T. (2019) Energy-Efficient ARM64 Cluster with Cryptanalytic Applications. In: Lange T., Dunkelman O. (eds) Progress in Cryptology – LATINCRYPT 2017. LATINCRYPT 2017. Lecture Notes in Computer Science, vol 11368. Springer, Cham

```bibtex
@InProceedings{LATINCRYPT:Wiggers17,
    author="Wiggers, Thom",
    editor="Lange, Tanja and Dunkelman, Orr",
    title="Energy-Efficient ARM64 Cluster with Cryptanalytic Applications",
    booktitle="Progress in Cryptology -- LATINCRYPT 2017",
    year="2019",
    month=july,
    day=20,
    publisher="Springer International Publishing",
    address="Cham",
    pages="175--188",
    isbn="978-3-030-25283-0",
    doi="10.1007/978-3-030-25283-0_10",
    url="https://thomwiggers.nl/publication/armcluster/",
}
```
