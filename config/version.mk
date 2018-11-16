# Versioning System
EVE_BASE_VERSION = v1.0

ifndef EVE_BUILD_TYPE
    EVE_BUILD_TYPE := Unofficial
endif


TARGET_PRODUCT_SHORT := $(subst eve_,,$(EVE_BUILD_TYPE))

# Set all versions
DATE := $(shell date -u +%Y%m%d)
EVE_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
EVE_BUILD_VERSION := Eve-OS-$(EVE_BASE_VERSION)-$(DATE)-$(EVE_BUILD_TYPE)
EVE_VERSION := Eve-OS-$(EVE_BASE_VERSION)-$(DATE)-$(EVE_BUILD)-$(EVE_BUILD_TYPE)
EVE_MOD_VERSION := Eve-OS-$(EVE_BASE_VERSION)-$(EVE_BUILD_DATE)-$(EVE_BUILD_TYPE)
ROM_FINGERPRINT := Eve-OS/$(EVE_BASE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(EVE_BUILD_DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.eve.build.version=$(EVE_BUILD_VERSION) \
    ro.eve.version=$(EVE_VERSION) \
    ro.eve.releasetype=$(EVE_BUILD_TYPE) \
    ro.mod.version=$(EVE_MOD_VERSION) \
    ro.eve.fingerprint=$(ROM_FINGERPRINT)
