#Export CROSS_COMPILE to point toolchain
export CROSS_COMPILE=/home/guneetatwal/android/kernel/toolchains/arm-linux-androideabi-4.6/bin/arm-linux-androideabi-

#Target Product
export TARGET_PRODUCT=wiko

#Create directory for your device
mkdir -p out/wiko/

#Kernel part
make mediatek-configs
make -j16
mediatek/build/tools/mkimage arch/arm/boot/zImage KERNEL > out/$TARGET_PRODUCT/zImage

#Modules part
make modules
make INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=./out/$TARGET_PRODUCT/system INSTALL_MOD_DIR=./out/$TARGET_PRODUCT/system android_modules_install
