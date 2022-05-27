g++-11 -O3 -march=native -o gcc_main main2.cc
clang++-14 -O3 -march=native -o clang_main main2.cc
clang++-14 -O3 -c -emit-llvm -march=native main2.cc
