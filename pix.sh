git clone https://github.com/PixelPlusUI-Devices/device_xiaomi_ginkgo device/xiaomi/ginkgo
git clone --depth=1 https://github.com/ArrowOS-Devices/android_kernel_xiaomi_ginkgo kernel/xiaomi/ginkgo
git clone https://github.com/PixelPlusUI-Devices/vendor_xiaomi_ginkgo vendor/xiaomi/ginkgo
rm -rf hardware/qcom-caf/sm8150/display
git clone https://github.com/Bt-aja/hardware_qcom_display.git -b arrow-11.0-caf-sm6125 hardware/qcom-caf/sm8150/display
git clone https://github.com/Bt-aja/android_vendor_miuicamera  vendor/miuicamera
git clone https://github.com/ThankYouMario/proprietary_vendor_qcom_sdclang.git -b ruby-12 prebuilts/clang/host/linux-x86/clang-sdllvm
cd device/xiaomi/ginkgo && git revert 7438b807d7ec05b88e3e9a3fdb72e7378ac1e773 && cd ../../..
