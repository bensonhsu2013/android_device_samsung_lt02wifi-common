# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/samsung/lt02wifi-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/lt02wifi-common/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_AAPT_CONFIG := xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init.pxa988.rc \
    init.pxa988.usb.rc \
    ueventd.pxa988.rc

# Recovery rootdir
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc

# Wifi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf

# Vold
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/vold.fstab:system/etc/vold.fstab

# Graphics config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/gfx.cfg:system/etc/gfx.cfg \
    $(COMMON_PATH)/configs/dms.cfg:system/etc/dms.cfg

# Prebuilt Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/keylayout/88pm80x_on.kl:system/usr/keylayout/88pm80x_on.kl \
    $(COMMON_PATH)/keylayout/88pm800_hook_vol.kl:system/usr/keylayout/88pm800_hook_vol.kl \
    $(COMMON_PATH)/keylayout/pxa27x-keypad.kl:system/usr/keylayout/pxa27x-keypad.kl \
    $(COMMON_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl\
    $(COMMON_PATH)/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(COMMON_PATH)/keylayout/vnc-kbd.kl:system/usr/keylayout/vnc-kbd.kl

# Prebuilt Keychars
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keychars/vnc-kbd.kcm:system/usr/keychars/vnc-kbd.kcm \
    $(COMMON_PATH)/keychars/pxa27x-keypad.kcm:system/usr/keychars/pxa27x-keypad.kcm \

# Prebuilt idc file
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/idc/elan-ts.idc:system/usr/idc/elan-ts.idc

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/asound.conf:system/etc/asound.conf \
    $(COMMON_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/lt02wifi-common/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/lt02wifi-common/configs/media_profiles.xml_for5640:system/etc/media_profiles.xml_for5640

PRODUCT_CHARACTERISTICS := tablet

# Device specific packages
#PRODUCT_PACKAGES += \
#    lights.mrvl

PRODUCT_PACKAGES += \
    libxml2 \
    hcitool

# adb hack
PRODUCT_COPY_FILES += \
    device/samsung/lt02wifi-common/configs/20fixup:system/etc/init.d/20fixup

# Enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115


PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    drm.service.enabled=true

# call common pxa986
$(call inherit-product, device/samsung/pxa986-common/pxa986.mk)


$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/samsung/lt02wifi-common/lt02wifi-common-vendor.mk)

