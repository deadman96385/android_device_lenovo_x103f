# Copyright (C) 2011 The Android Open-Source Project
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
DEVICE_PATH := device/lenovo/x103f

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8909
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8909

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon

# Assert
TARGET_OTA_ASSERT_DEVICE := msm8909,x103f

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.selinux=permissive
TARGET_KERNEL_SOURCE := kernel/lenovo/msm8909
TARGET_KERNEL_CONFIG := msm8909_ar650x_defconfig
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
BOARD_KERNEL_SEPARATED_DT := true
TARGET_USES_UNCOMPRESSED_KERNEL := false
TARGET_COMPILE_WITH_MSM_KERNEL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
#AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
USE_CAMERA_STUB := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    ifeq ($(TARGET_BUILD_VARIANT),user)
               WITH_DEXPREOPT := true
               DEX_PREOPT_DEFAULT := true
               WITH_DEXPREOPT_PIC := true
    endif
  endif
endif

# Memory Config
MALLOC_SVELTE := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11811160064
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# FM Radio
TARGET_QCOM_NO_FM_FIRMWARE := true
BOARD_HAVE_QCOM_FM := true

# Graphics
TARGET_HAVE_HDMI_OUT := false
TARGET_USES_OVERLAY := true
TARGET_USES_PCI_RCS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
GET_FRAMEBUFFER_FORMAT_FROM_HWC := false
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_QCOM_BSP := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_HARDWARE_3D := false

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg

# set the cryptfs_hw directory path
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

# GPS
TARGET_NO_RPC := true

# Added to indicate that protobuf-c is not supported in this build
PROTOBUF_SUPPORTED := false

# Init
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_msm
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# Enable sensor multi HAL
USE_SENSOR_MULTI_HAL := true

# Ril
FEATURE_QCRIL_UIM_SAP_SERVER_MODE := true

# Control flag between KM versions
TARGET_HW_KEYMASTER_V03 := true

# Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# SELinux policies
include device/qcom/sepolicy/sepolicy.mk

# Wifi
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
