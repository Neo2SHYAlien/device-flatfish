$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/allwinner/flatfish/flatfish-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/allwinner/flatfish/overlay

LOCAL_PATH := device/allwinner/flatfish
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_flatfish
PRODUCT_DEVICE := flatfish

# Ramdisk files
PRODUCT_PACKAGES += \
	fstab.flatfish \
	init.flatfish.rc \
	init.flatfish.usb.rc \
	ueventd.flatfish.rc \
	nand.ko

############################### FIREFOX
$(call inherit-product-if-exists, vendor/vendor-blobs.mk)

$(call inherit-product, device/allwinner/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# wifi features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# bluetooth bluez
PRODUCT_PACKAGES += \
	bluetoothd \
	libbluedroid \
	libbluetooth \
	libbluetoothd \
	brcm_patchram_plus \
	auto_pair_devlist.conf \
	audio.a2dp.default

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \
	system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
	system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf

PRODUCT_COPY_FILES += \
	device/allwinner/flatfish/gps.conf:system/etc/gps.conf 

# GPU buffer size configs
PRODUCT_COPY_FILES += \
        device/allwinner/flatfish/configs/powervr.ini:system/etc/powervr.ini

#key and tp config file
PRODUCT_COPY_FILES += \
	device/allwinner/flatfish/configs/sw-keyboard.kl:system/usr/keylayout/sw-keyboard.kl \
	device/allwinner/flatfish/configs/axp22-supplyer.kl:system/usr/keylayout/axp22-supplyer.kl \
	device/allwinner/flatfish/configs/tp.idc:system/usr/idc/ft5x_ts.idc \
	device/allwinner/flatfish/configs/gsensor.cfg:system/usr/gsensor.cfg

# camera
PRODUCT_COPY_FILES += \
	device/allwinner/flatfish/configs/camera.cfg:system/etc/camera.cfg \
	device/allwinner/flatfish/configs/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

PRODUCT_PACKAGES += \
        audio.a2dp.default \
        audio.usb.default \
        audio.r_submix.default
#wlan
PRODUCT_PACKAGES += \
	libnetcmdiface

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Europe/Sofia \
	persist.sys.language=en \
	persist.sys.country=US

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwa.force=true

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage,adb \
	ro.font.scale=1.0 \
        ro.sys.bootfast=true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=16

PRODUCT_PROPERTY_OVERRIDES += \
	ro.firmware_revision=flatfish_$(shell date +%Y%m%d-%H%M)

PRODUCT_CHARACTERISTICS := tablet
