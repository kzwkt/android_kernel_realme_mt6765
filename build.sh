#!/bin/bash
export PATH="$HOME/src/prebuilts/clang/host/linux-x86/clang-r522817/bin/:$PATH"

[ -d out ] || make CC=clang ARCH=arm64 O=out karashi_defconfig

make CC=clang LLVM=1 ARCH=arm64 O=out -j4 \
        HEADER_ARCH=arm64 \
        SUBARCH=arm64 \
        CXX=c++ \
        AR=llvm-ar \
        NM=llvm-nm \
        OBJDUMP=llvm-objdump \
        STRIP=llvm-strip \
        READELF=llvm-readelf \
        HOSTCXX=clang++ \
        HOSTAR=llvm-ar \
        LLVM_IAS=1 \
	CROSS_COMPILE=aarch64-linux-gnu- \
        CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
        CLANG_TRIPLE=aarch64-linux-gnu-
