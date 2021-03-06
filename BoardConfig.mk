# BoardConfig.mk
#
# Product-specific compile-time definitions.
#
include device/allwinner/common/BoardConfigCommon.mk

# cpu stuff
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_EXTRA_CFLAGS += $(call cc-option,"-march=armv7-a -mtune=cortex-a9", $(call cc-option,"-march=armv7-a -mtune=cortex-a8"))

BOARD_KERNEL_BASE = 0x40000000
BOARD_KERNEL_CMDLINE += console=ttyS0,115200
BOARD_KERNEL_CMDLINE += rw
BOARD_KERNEL_CMDLINE += init=/init
BOARD_KERNEL_CMDLINE += androidboot.hardware=flatfish
BOARD_KERNEL_CMDLINE += ion_reserve=256M
BOARD_KERNEL_CMDLINE += loglevel=7
BOARD_KERNEL_CMDLINE += selinux=0

SYSTEM_FS_TYPE        := ext4
SYSTEM_PARTITION_TYPE := EMMC
SYSTEM_LOCATION       := /dev/block/mmcblk0p7

TARGET_BOARD_PLATFORM := flatfish

TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT_RC = true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736

BOARD_WIFI_VENDOR := broadcom
SW_BOARD_USR_WIFI := GB9663

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA    := "/system/vendor/modules/fw_bcm40183b2.bin"
WIFI_DRIVER_FW_PATH_P2P    := "/system/vendor/modules/fw_bcm40183b2_p2p.bin"
WIFI_DRIVER_FW_PATH_AP     := "/system/vendor/modules/fw_bcm40183b2_apsta.bin"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_BLUETOOTH_BLUEZ := true

#data partition size
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
