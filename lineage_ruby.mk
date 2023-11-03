#
# Copyright (C) 2023 The Alphadroid Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/ruby/device.mk)

# Inherit some common Alphadroid stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_ruby
PRODUCT_DEVICE := ruby
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22101316G

# Inherit some common Alphadroid stuff
ALPHA_MAINTAINER := Pichuiscute
ALPHA_BUILD_TYPE := Unofficial
TARGET_BOOT_ANIMATION_RES := 1440
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_INCLUDE_GOOGLE_PHOTOS := true
TARGET_INCLUDE_GOOGLE_MAPS := true
TARGET_INCLUDE_GOOGLE_APP := true
TARGET_INCLUDE_GOOGLE_CALCULATOR := true
TARGET_INCLUDE_GOOGLE_CALENDAR := true
TARGET_INCLUDE_GOOGLE_CHROME := true
TARGET_INCLUDE_GOOGLE_DESKCLOCK := true
TARGET_INCLUDE_GOOGLE_DRIVE := true
TARGET_INCLUDE_GMAIL := true
TARGET_INCLUDE_GOOGLE_TELEPHONY := true
TARGET_INCLUDE_PIXEL_FRAMEWORK := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
WITH_GAPPS := true
TARGET_ENABLE_BLUR := true

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ruby-user 12 SP1A.210812.016 V14.0.1.0.TMOMIXM release-keys"

BUILD_FINGERPRINT := Redmi/ruby_global/ruby:12/SP1A.210812.016/V14.0.1.0.TMOMIXM:user/release-keys
