
git clone git@github.com:alioth-aosp/device_xiaomi_sm8250-common.git -b 14-staging device/xiaomi/sm8250-common;
git clone git@github.com:alioth-aosp/vendor_xiaomi_alioth.git -b 14-staging vendor/xiaomi/alioth;
git clone git@github.com:alioth-aosp/vendor_xiaomi_sm8250-common.git -b 14-staging vendor/xiaomi/sm8250-common;
git clone https://github.com/EmanuelCN/kernel_xiaomi_sm8250.git -b staging kernel/xiaomi/sm8250;
cd kernel/xiaomi/sm8250;git submodule init;git submodule update; cd ../../../;
rm -rf hardware/xiaomi;rm -rf packages/resources/devicesettings;
git clone git@github.com:Roxor-007/hardware_xiaomi.git hardware/xiaomi;
rm -rf hardware/xiaomi/megvii; rm -rf system/extras/su
git clone git@github.com:Roxor-007/packages_resources_devicesettings packages/resources/devicesettings;
git clone https://gitlab.com/Roxor-007/vendor_xiaomi_camera.git vendor/xiaomi/camera
mkdir prebuilts/clang/host/linux-x86/clang-neutron; cd prebuilts/clang/host/linux-x86/clang-neutron; 
curl -LO "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman";
chmod +x antman; ./antman -S=05012024; ./antman --patch=glibc; cd ../../../../../;
sed -i '/CLANG_EXTRA_FLAGS += --hip-path=\/dev\/null/d' vendor/lineage/build/tasks/kernel.mk;
