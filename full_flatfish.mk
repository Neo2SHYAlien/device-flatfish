# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/vendor-blobs.mk)

$(call inherit-product, device/allwinner/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

#kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/allwinner/flatfish/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

#fix overlay
DEVICE_PACKAGE_OVERLAYS := device/allwinner/flatfish/overlay
#common files
FLATFISH_COMMON := device/allwinner/flatfish/common

#########################

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
	
PRODUCT_PACKAGES += \
    lights.grouper \
    audio.primary.grouper \
    power.grouper \
    audio.a2dp.default \
    audio.usb.default \
    librs_jni \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory

# for bugmailer
PRODUCT_PACKAGES += send_bug

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
	ro.sf.lcd_density=160 \
	ro.product.firmware=v3.2

#no home key
PRODUCT_PROPERTY_OVERRIDES += \
	qemu.hw.mainkeys=0

PRODUCT_PROPERTY_OVERRIDES += \
	ro.firmware_revision=flatfish_$(shell date +%Y%m%d-%H%M)

PRODUCT_CHARACTERISTICS := tablet

# OTA
ENABLE_LIBRECOVERY := true

# Overrides
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_BRAND  := B2G
PRODUCT_NAME   := full_flatfish
PRODUCT_DEVICE := flatfish
PRODUCT_MODEL  := Neo2SHYAlien AOSP flatfish
PRODUCT_RESTRICT_VENDOR_FILES := false
