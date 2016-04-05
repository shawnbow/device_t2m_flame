$(call inherit-product, device/t2m/flame/full_flame.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_flame
PRODUCT_RELEASE_NAME := T2M FLAME
