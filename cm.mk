## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := flatfish

# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/allwinner/flatfish/device_flatfish.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := flatfish
PRODUCT_NAME := cm_flatfish
PRODUCT_BRAND := allwinner
PRODUCT_MODEL := flatfish
PRODUCT_MANUFACTURER := allwinner
