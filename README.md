quicksort 50 million double point2d
====================================

quicksort implemented manually same algorithm on same data structures.

everything is on my notebook; throttling not detected: single thread always runs around 4Hz.


tool | time taken
-----|-----------
julia-1.1.1 | 5.03 sec
gcc-9 or clang 8 |5.24 sec
rust |5.39 sec
ldc-llvm8 |5.43 sec
.net core 2.2 |6.05 sec
swift-5.0.2  |6.1 sec
clang+graalvm  |7.44 sec
dmd-2.087  |8.3 sec
fpc-3.0.4 | 8.9 sec
java-graaalvm-onheap | 15 sec
