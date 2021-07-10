git clone https://github.com/PixelPlusUI-Devices/device_xiaomi_ginkgo device/xiaomi/ginkgo
git clone --depth=1 https://github.com/ArrowOS-Devices/android_kernel_xiaomi_ginkgo kernel/xiaomi/ginkgo
git clone https://github.com/PixelPlusUI-Devices/vendor_xiaomi_ginkgo vendor/xiaomi/ginkgo
rm -rf hardware/qcom-caf/sm8150/display
git clone https://github.com/Bt-aja/hardware_qcom_display.git -b arrow-11.0-caf-sm6125 hardware/qcom-caf/sm8150/display
git clone https://github.com/Bt-aja/android_vendor_miuicamera  vendor/miuicamera
git clone https://github.com/ThankYouMario/proprietary_vendor_qcom_sdclang.git -b ruby-12 prebuilts/clang/host/linux-x86/clang-sdllvm
rm -rf packages/apps/FaceUnlockService
rm -rf packages/apps/Pixel*er
rm -rf external/faceunlock
rm -rf external/motorola/faceunlock
rm -rf frameworks/base
rm -rf packages/apps/Settings
rm -rf vendor/aosp
rm -rf packages/services/Telecomm
rm -rf frameworks/native
rm -rf packages/apps/Plugins
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_external_faceunlock external/faceunlock
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_packages_apps_FaceUnlockService packages/apps/FaceUnlockService
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_frameworks_native frameworks/native
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_packages_services_Telecomm packages/services/Telecomm
git clone --depth=1 https://github.com/PixelPlusUI-Elle/packages_apps_Pixelizer packages/apps/Pixelizer
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_packages_apps_Settings packages/apps/Settings
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_vendor_aosp vendor/aosp
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_frameworks_base frameworks/base
git clone --depth=1 https://github.com/PixelPlusUI-Elle/packages_apps_Plugins packages/apps/Plugins
rm -rf packages/apps/Settings/res-customisation/ packages/apps/Settings/src_customisation/
cp -r packages/apps/Pixelizer/res/ packages/apps/Settings/res-customisation/
cp -r packages/apps/Pixelizer/src/ packages/apps/Settings/src_customisation/
