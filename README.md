quicksort 50 million double point2d
====================================

quicksort implemented manually same algorithm on same data structures. Conformant are implementations in idiomatic code with same memory layout.

everything is on my notebook; single user mode; single thread always caused 4-4.1 GHz.

tool | time taken |  conforms? | comment
-----|------------|----------|------
julia-1.1.1 | 4.75 sec | + | ..
clang 8 |4.81 sec | + |..
gcc-9 |4.93 sec | + | ..
rust |5.08 sec | + | ..
ldc-llvm8 |5.16 sec | + | LLVM backend for D
.net core 2.2 unsafe |5.30 sec | + | ..
gcc-go 9.1.0  |5.52 sec | + | ..
java-graaalvm-packed | 5.62 sec |  | this has memory layout like in C, but non-idiomatic coding
swift-5.0.2  |5.76 sec | + | .. 
.net core 2.2 |5.65 sec | + | compiled release mode, no mono
go1.12.6 |gccgo+10% | + | ..
clang+graalvm  |6.97 sec | + | LLVM bytecode interpreted by graalvm
dmd-2.087  |i 6.61 | + | canonical D, uninstalled it already due to conflict with gccgo
fpc-3.0.4 | 8.34 sec | + | Free Pascal
java-graaalvm-onheap | 14.4 sec |  | this has different memory layout, but idiomatic approach
