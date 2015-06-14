#!/bin/bash

# https://github.com/mono/CppSharp/blob/master/docs/GettingStarted.md


# Common setup

# 1. Clone CppSharp to <CppSharp>
git clone \
	https://github.com/mono/CppSharp.git
CPPSHARP=CppSharp

# 2. Clone LLVM to <CppSharp>\/eps/llvm
git clone \
	http://llvm.org/git/llvm.git \
	$CPPSHARP/deps/llvm

# 3. Clone Clang to <CppSharp>/deps/llvm/tools/clang
git clone \
	http://llvm.org/git/clang.git \
	$CPPSHARP/deps/llvmtools/clang

# 4. Create directory <CppSharp>/deps/llvm/build
mkdir $CPPSHARP\deps\llvm\build



# Compiling LLVM on Mac OS X

cd $CPPSHARP/deps/llvm/build

cmake \
	-G "Unix Makefiles" \
	-DLLVM_ENABLE_LIBCXX=true \
	-DLLVM_BUILD_32_BITS=true \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	..

make

