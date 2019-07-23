quicksort 50 million double point2d
====================================

quicksort implemented manually same algorithm on same data structures.

everything is on my notebook; throttling not detected: single thread always runs around 4Hz.


tool | time taken |  comment
-----|------------|----------------
julia-1.1.1 | 5.03 sec | -
gcc-9 or clang 8 |5.24 sec | clang and gcc show very similar results
rust |5.39 sec |  -
ldc-llvm8 |5.43 sec | LLVM backend for D
java-graaalvm-packed | 6.0 sec | this has memory layout like in C, but non-pretty/non-traditional coding, can't cound as part of shootout
swift-5.0.2  |6.1 sec |  -
.net core 2.2 |6.40 sec | compiled release mode, no mono
clang+graalvm  |7.44 sec | LLVM bytecode interpreted by graalvm
dmd-2.087  |8.3 sec | canonical D
fpc-3.0.4 | 8.9 sec | Free Pascal
java-graaalvm-onheap | 15 sec | this has different memory layout, but traditional approach
