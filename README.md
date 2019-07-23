quicksort 50 million double point2d
====================================

quicksort implemented manually same algorithm on same data structures. Conformant are implementations in idiomatic code with same memory layout.

everything is on my notebook; throttling not detected; bg processes minimized: single thread always given 4-4.1 GHz.

tool | time taken |  conforms? | comment
-----|------------|----------|------
julia-1.1.1 | 5.03 sec | + | ..
gcc-9 or clang 8 |5.24 sec | + |clang and gcc show very similar results
rust |5.39 sec | + | ..
ldc-llvm8 |5.43 sec | + | LLVM backend for D
.net core 2.2 unsafe |5.67 sec | + | ..
gcc-go 9.1.0  |5.88 sec | + | ..
java-graaalvm-packed | 6.0 sec |  | this has memory layout like in C, but non-idiomatic coding
swift-5.0.2  |6.1 sec | + | .. 
.net core 2.2 |6.40 sec | + | compiled release mode, no mono
go1.12.6 |6.84 sec | + | ..
clang+graalvm  |7.44 sec | + | LLVM bytecode interpreted by graalvm
dmd-2.087  |8.3 sec | + | canonical D
fpc-3.0.4 | 8.9 sec | + | Free Pascal
java-graaalvm-onheap | 15 sec |  | this has different memory layout, but idiomatic approach
