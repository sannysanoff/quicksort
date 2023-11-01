quicksort 50 million double point2d
====================================

quicksort implemented manually same algorithm on same data structures. Conformant are implementations in idiomatic code with same memory layout.

The initial point of this benchmark is to intentionally give all possible advantage to C++ over Java, because Point2D cannot be layed out in canonic java without being indirectly addressed (i.e. only array of pointers).

Benchmarking is done on the hardware du jour, by running program 2 times, for total 10 results and then choosing the best result.

as run on Apple M2 on Macbook Air 15 (2023)

tool | time taken |  conforms? 
-----|------------|----------
clang 15 arm native |4.271 sec | + 
clang 15 arm ubuntu orbstack |4.317 sec | + 
julia 1.9.3 native |4.476 sec | + 
gcc 13 arm ubuntu orbstack |4.607 sec | + 
gcc 13 x64 ubuntu orbstack |5.532 sec | + 
clang 15 x64 ubuntu orbstack |5.649 sec | + 
clang 15 arm native - economy cores only |7.375 sec | + 


as run on Intel i5-11300H on boost frequency (around 4.1-4.2 GHz) on Redmibook Pro 15

tool | time taken |  conforms? | comment
-----|------------|----------|------
clang 14 |4.596 sec | + |..
julia 1.7.3 |4.713 sec | + |..
gcc 11.2 |4.927 sec | + |..
go1.18.2 |5.162 sec | + | ..
jdk15.0.2 |6.146 sec |   | non-idiomatic coding
jdk15.0.2 |28+ sec | +  | idiomatic coding, indirect access


as run on AMD Ryzen 3900X cpu with default cooler

tool | time taken |  conforms? | comment
-----|------------|----------|------
julia-1.4.0 | 5.002 sec | + | ..
clang 10 |5.230 sec | + |..
gcc 9.2.1 |5.377 sec | + |..
java-graaalvm-ee-packed | 5.660 sec |  | this has memory layout like in C, but non-idiomatic coding
go1.14.2 |5.89 | + | 
java-graaalvm-ce-packed | 6.155 sec |  | this has memory layout like in C, but non-idiomatic coding
java-graaalvm-ce-onheap | 20.4 sec | + | this has different memory layout, but idiomatic approach


as run on google cloud n1-standard-2 (2 vCPUs, 7.5 GB memory) skylake cpu

tool | time taken |  conforms? | comment
-----|------------|----------|------
clang 8 |7.630 sec | + |..
julia-1.2.0 | 7.810 sec | + | ..
gcc-8 |8.244 sec | + | ..
rust |8.272 sec | + | ..
ldc-1.8.0/llvm5 |8.460 sec | + | ..
.net core 3.0 unsafe |8.995 sec | + | ..
java-graaalvm-packed | 9.308 sec |  | this has memory layout like in C, but non-idiomatic coding
.net core 3.0 safe |9.508 sec | + | ..
gcc-go 8  |10.035 sec | + | ..
java-valhalla | 11.094 | + | Java with structs!
clang+graalvm  |11.863 sec | + | LLVM bytecode interpreted by graalvm
fbc-1.07.1 | 13.230 sec | + | Free Basic, credits to @mabu
fpc-3.0.4 | 13.592 sec | + | Free Pascal


as run on my notebook (Lenovo X1 Extreme i7-8850H); single user mode; single thread always caused 4-4.1 GHz.

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
.net core 2.2 |5.65 sec | + | compiled release mode, no mono
swift-5.0.2  |5.76 sec | + | .. 
go1.12.6 |gccgo+10% | + | ..uninstalled it already due to conflict with gccgo
dmd-2.087  |6.61 sec| + | canonical D
clang+graalvm  |6.97 sec | + | LLVM bytecode interpreted by graalvm
fpc-3.0.4 | 8.34 sec | + | Free Pascal
java-graaalvm-onheap | 14.4 sec | + | this has different memory layout, but idiomatic approach



