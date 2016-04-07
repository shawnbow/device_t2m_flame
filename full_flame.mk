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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from flame device
$(call inherit-product, device/t2m/flame/device.mk)

PRODUCT_NAME := full_flame
PRODUCT_DEVICE := flame
PRODUCT_BRAND := t2m
PRODUCT_MODEL := flame
PRODUCT_MANUFACTURER := t2m

$(call inherit-product-if-exists, vendor/t2m/flame/flame-vendor-blobs.mk)
