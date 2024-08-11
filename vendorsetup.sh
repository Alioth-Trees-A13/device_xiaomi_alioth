#!/bin/bash

# Clone repositories
git clone git@github.com:Darks-Den-A14/device_xiaomi_sm8250-common.git -b qpr3 device/xiaomi/sm8250-common
git clone git@github.com:alioth-aosp/vendor_xiaomi_alioth.git -b 14-stable vendor/xiaomi/alioth
git clone git@github.com:alioth-aosp/vendor_xiaomi_sm8250-common.git -b 14-stable vendor/xiaomi/sm8250-common
git clone https://github.com/EmanuelCN/kernel_xiaomi_sm8250.git -b staging kernel/xiaomi/sm8250
cd kernel/xiaomi/sm8250
git submodule init
git submodule update
cd ../../../

# Remove and clone more repositories
rm -rf hardware/xiaomi
rm -rf packages/resources/devicesettings
git clone git@github.com:Roxor-007/hardware_xiaomi.git hardware/xiaomi
rm -rf hardware/xiaomi/megvii
rm -rf system/extras/su
git clone git@github.com:Roxor-007/packages_resources_devicesettings packages/resources/devicesettings
git clone https://bitbucket.org/eidoron_1/android_vendor_xiaomi_camera.git vendor/xiaomi/camera

# Setup clang and antman
mkdir -p prebuilts/clang/host/linux-x86/clang-neutron
cd prebuilts/clang/host/linux-x86/clang-neutron
curl -LO "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman"
chmod +x antman
./antman -S=05012024

# Check if the system is not Arch Linux before running the patch command
if ! grep -q "Arch" /etc/os-release; then
  ./antman --patch=glibc
fi

cd ../../../../../

# Modify kernel build tasks and clone display repository
sed -i '/CLANG_EXTRA_FLAGS += --hip-path=\/dev\/null/d' vendor/lineage/build/tasks/kernel.mk
rm -rf hardware/qcom-caf/sm8250/display
git clone git@github.com:alioth-aosp/hardware_qcom-caf_sm8250_display.git hardware/qcom-caf/sm8250/display
