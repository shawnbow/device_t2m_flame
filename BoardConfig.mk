#
# Copyright (C) 2014 Prashant Gahlot (proxthehacker@gmail.com)
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

-include vendor/t2m/flame/BoardConfigVendor.mk

LOCAL_PATH := device/t2m/flame

BOARD_VENDOR := t2m-qcom

#TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno302
TARGET_BOARD_PLATFORM := msm8610

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
#TARGET_CPU_SMP := true
#TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
#ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8610
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel
TARGET_NO_KERNEL := false
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
TARGET_KERNEL_SOURCE := kernel/t2m/flame
TARGET_KERNEL_CONFIG := msm8610_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1 androidboot.bootloader=L1TC20011L60 androidboot.emmc=true androidboot.serialno=e477d8ec androidboot.baseband=msm mdss_mdp.panel=1:dsi:0:qcom,mdss_dsi_tianma_tm040ydh65_ili9806c_wvga_video

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	$(MAKE) -C kernel/t2m/flame O=$(KERNEL_OUT) M=$(ANDROID_BUILD_TOP)/device/t2m/flame/prima ARCH=arm CROSS_COMPILE=arm-eabi- modules WLAN_ROOT=$(ANDROID_BUILD_TOP)/device/t2m/flame/prima MODNAME=wlan BOARD_PLATFORM=msm8610 CONFIG_PRONTO_WLAN=m
	$(KERNEL_TOOLCHAIN_PATH)strip --strip-unneeded device/t2m/flame/prima/wlan.ko
	mv device/t2m/flame/prima/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(KERNEL_MODULES_OUT)/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Lights
#TARGET_PROVIDES_LIBLIGHT := true

# GPS
TARGET_NO_RPC := true

# Power
TARGET_POWERHAL_VARIANT := qcom
BOARD_CHARGER_ENABLE_SUSPEND := true

# Global flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_NR_SVC_SUPP_GIDS := 32

# Display
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
BOARD_EGL_CFG := device/t2m/flame/egl.cfg

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_FM := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
TARGET_QCOM_AUDIO_VARIANT := caf

# Camera 
USE_CAMERA_STUB := false
TARGET_USE_VENDOR_CAMERA_EXT := true

# FM
TARGET_QCOM_NO_FM_FIRMWARE := true
TARGET_USES_AOSP := false

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true
TARGET_QCOM_MEDIA_VARIANT := caf

# Hardware tunables framework
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BLUETOOTH_HCI_USE_MCT := true

# Build
TARGET_SYSTEMIMAGE_USE_SQUISHER := true

# Storage & partiiton
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6140443648
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Asserts
TARGET_OTA_ASSERT_DEVICE := flame

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/fstab.qcom
BOARD_HAS_NO_SELECT_BUTTON := true

# SELinux
HAVE_SELINUX := false
#include device/qcom/sepolicy/sepolicy.mk

#BOARD_SEPOLICY_DIRS += \
    device/t2m/flame/sepolicy

#BOARD_SEPOLICY_UNION += \
    atvc.te \
    batt_health.te \
    device.te \
    file.te \
    file_contexts \
    hw_revs.te \
    init.te \
    init_shell.te \
    keystore.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    platform_app.te \
    property_contexts \
    property.te \
    system_app.te \
    system_init.te \
    system_server.te \
    rild.te \
    rmt_storage.te \
    thermal-engine.te \
    ueventd.te \
    vold.te

MALLOC_IMPL := dlmalloc

# Enable dex-preoptimization to speed up first boot sequence
#ifeq ($(HOST_OS),linux)
#  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user),true)
#    ifeq ($(WITH_DEXPREOPT),)
#      WITH_DEXPREOPT := true
#      WITH_DEXPREOPT_BOOT_IMG_ONLY := false
#    endif
#  endif
#endif

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true
