#
# Copyright (C) 2021 The PixelDust Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Redmi Note 8
export TARGET_DEVICE=ginkgo

# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from surya device
$(call inherit-product, device/xiaomi/ginkgo/device.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Don't include Google apex use the AOSP variant instead
TARGET_EXCLUDE_GOOGLE_APEX := true

# Device identifier
PRODUCT_NAME := pixeldust_ginkgo
PRODUCT_DEVICE := ginkgo
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 8
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="erwinabs" \

# Fingerprint
BUILD_FINGERPRINT := google/redfin/redfin:11/RQ3A.210605.005/7349499:user/release-keys
BUILD_DESCRIPTION := redfin-user 11 RQ3A.210605.005 7349499 release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
REMOVE_GAPPS_PACKAGES += \
    AppDirectedSMSService \
    AmbientSensePrebuilt \
    AndroidAutoStubPrebuilt \
    arcore \
    CbrsNetworkMonitor \
    DevicePolicyPrebuilt \
    DiagnosticsToolPrebuilt \
    DreamlinerPrebuilt \
    DreamlinerUpdater \
    GCS \
    GoogleCamera \
    GoogleTTS \
    MaestroPrebuilt \
    MarkupGoogle \
    MyVerizonServices \
    NgaResources \
    OBDM_Permissions \
    obdm_stub \
    OemDmTrigger \
    Ornament \
    ScribePrebuilt \
    Showcase \
    SprintDM \
    SprintHM \
    TagGoogle \
    talkback \
    Tycho \
    USCCDM \
    VzwOmaTrigger \
    VZWAPNLib \
    YouTube \
    YouTubeMusicPrebuilt
