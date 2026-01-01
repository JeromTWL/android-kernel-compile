ROOTDIR=$PWD

rm -rf build
mkdir build

cd android_kernel_xiaomi_sm8550

BINARIES=$PATH:$ROOTDIR/build-tools/linux-x86/bin:$ROOTDIR/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-gnu-9.3/aarch64-linux-android/bin:$ROOTDIR/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-gnu-9.3/bin:$ROOTDIR/linux-x86/clang-r574158/bin:$ROOTDIR/android_prebuilts_tools-lineage/linux-x86/bin

make clean

make mrproper

make O=../build ARCH=arm64 PATH=$BINARIES CC=clang CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- BRAND_SHOW_FLAG=oneplus TARGET_PRODUCT=msmkalama nuwa_GKI.config

make -j8 O=$ROOTDIR/build ARCH=arm64 PATH=$BINARIES CC=clang CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- DEFCONFIG=nuwa_GKI.config DTC_EXT=$ROOTDIR/android_prebuilts_tools-lineage/linux-x86/dtc/dtc BRAND_SHOW_FLAG=xiaomi TARGET_PRODUCT=msmkalama
