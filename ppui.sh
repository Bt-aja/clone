
echo "-----------------------------------------------------------------"
echo "------| Setting Up global config for easy sync private repo------"
echo "-----------------------------------------------------------------"
git config --global credential.helper cache
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "=============================================================="
echo "==========| Making room for official stuff |=================="
echo "=============================================================="
echo " "
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
echo " "
echo "=============================================================="
echo "=======| Completed Making room for official stuff |==========="
echo "=============================================================="
echo " "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++++++++++++++| Cloning official Plus stuff |+++++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_external_faceunlock external/faceunlock
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_packages_apps_FaceUnlockService packages/apps/FaceUnlockService
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_frameworks_native frameworks/native
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_packages_services_Telecomm packages/services/Telecomm
git clone --depth=1 https://github.com/PixelPlusUI-Elle/packages_apps_Pixelizer packages/apps/Pixelizer
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_packages_apps_Settings packages/apps/Settings
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_vendor_aosp vendor/aosp
git clone --depth=1 https://github.com/PixelPlusUI-Elle/android_frameworks_base frameworks/base
git clone --depth=1 https://github.com/PixelPlusUI-Elle/packages_apps_Plugins packages/apps/Plugins
echo " "
echo "##################################################################"
echo "#########################| cloning completed |####################"
echo "##################################################################"
echo " "
echo "******************************************************************"
echo "***************| starting work for pixelizer |********************"
echo "******************************************************************"
echo " "
rm -rf packages/apps/Settings/res-customisation/ packages/apps/Settings/src_customisation/
cp -r packages/apps/Pixelizer/res/ packages/apps/Settings/res-customisation/
cp -r packages/apps/Pixelizer/src/ packages/apps/Settings/src_customisation/
echo " "
echo "......................................................................"
echo ".....| work completed of all stuff+ official are in place |..........."
echo "......................................................................"
echo "-------Dont forget to Add these in your aosp_device.mk |--------------"
echo "-----------| TARGET_FACE_UNLOCK_SUPPORTED = true |--------------------"
echo "------------------| CUSTOM_BUILD_TYPE=OFFICIAL |----------------------"
echo "......................................................................"
echo " "
echo "--------------------------------------------------------"
echo "-------------| Thanks For Using My Script |-------------"
echo "-------------|       By @alworkdone       |-------------"

