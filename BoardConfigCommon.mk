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

# inherit from common pxa986
-include device/samsung/pxa986-common/BoardConfigCommon.mk

BOARD_VENDOR := samsung

TARGET_BOARD_PLATFORM := mrvl
TARGET_BOOTLOADER_BOARD_NAME := PXA986

# Kernel
TARGET_KERNEL_SOURCE         := kernel/samsung/lt02wifi
BOARD_KERNEL_CMDLINE         := 
BOARD_KERNEL_BASE            := 0x10000000
BOARD_MKBOOTIMG_ARGS         := --ramdisk_offset 0x11000000
BOARD_KERNEL_PAGESIZE        := 2048

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_UMS_LUNFILE := "/sys/devices/platform/mv-udc/gadget/lun0/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/samsung/lt02wifi-common/recovery.fstab

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1507852288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5775556608
BOARD_FLASH_BLOCK_SIZE := 131072

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/lt02wifi-common/bluetooth

