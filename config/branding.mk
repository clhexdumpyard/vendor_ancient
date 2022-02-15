ifndef ANCIENT_BUILD_TYPE
    ifeq ($(ANCIENT_WEEABO), true)
    ANCIENT_BUILD_TYPE := Sasuke
    else
    ANCIENT_BUILD_TYPE := Silver
    endif
endif

# Set all versions
CURRENT_DEVICE=$(shell echo "$(PRODUCT_DEVICE)" | cut -d'_' -f 2,3)
ANCIENT_DATE_YEAR := $(shell date +%Y)
ANCIENT_DATE_MONTH := $(shell date +%m)
ANCIENT_DATE_DAY := $(shell date +%d)
ANCIENT_DATE_HOUR := $(shell date +%H)
ANCIENT_DATE_MINUTE := $(shell date +%M)
ANCIENT_BUILD_DATE := $(ANCIENT_DATE_YEAR)$(ANCIENT_DATE_MONTH)$(ANCIENT_DATE_DAY)-$(ANCIENT_DATE_HOUR)$(ANCIENT_DATE_MINUTE)
BUILD_DATE_TIME := $(ANCIENT_DATE_YEAR)$(ANCIENT_DATE_MONTH)$(ANCIENT_DATE_DAY)-$(ANCIENT_DATE_HOUR)$(ANCIENT_DATE_MINUTE)

ANCIENT_PLATFORM_VERSION := 12.0

ifeq ($(ANCIENT_WEEABO), true)
ANCIENT_BASE_EDITION := Weeabo
ANCIENT_VERSION_CUSTOM := Weeabo-v6.2
else
ANCIENT_BASE_EDITION := Shield
ANCIENT_VERSION_CUSTOM := Shield-v6.2
endif
BUILD_VERSION := v6.2

ifeq ($(ANCIENT_OFFICIAL), true)
   LIST = $(shell cat vendor/ancient/ancient.devices)
   FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      ifeq ($(ANCIENT_WEEABO), true)
      ANCIENT_BUILD_TYPE := Naruto
      else
      ANCIENT_BUILD_TYPE := Steel
      endif
# OTA
ifeq ($(ANCIENT_OFFICIAL), true)
include vendor/ancient/config/ota.mk
endif

    endif
    ifneq ($(IS_OFFICIAL), true)
       ifeq ($(ANCIENT_WEEABO), true)
       ANCIENT_BUILD_TYPE := Sasuke
       else
       ANCIENT_BUILD_TYPE := Silver
       endif
       $(error Device is not official "$(FOUND)")
    endif
endif

TARGET_PRODUCT_SHORT := $(subst ancient_,,$(ANCIENT_BUILD))

ifeq ($(ANCIENT_GAPPS), true)
ANCIENT_BUILD_VARIANT := GApps
else
ANCIENT_BUILD_VARIANT := Vanilla
endif

ANCIENT_VERSION := AncientOS-S-$(ANCIENT_BASE_EDITION)-$(BUILD_VERSION)-$(ANCIENT_BUILD)-$(ANCIENT_BUILD_TYPE)-$(ANCIENT_BUILD_DATE)-$(ANCIENT_BUILD_VARIANT)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ancient.build_variant=$(ANCIENT_BUILD_VARIANT) \
    ro.ancient.custom.version=$(ANCIENT_VERSION_CUSTOM) \
    ro.ancient.version=$(ANCIENT_VERSION) \
    ro.ancient.build_date=$(ANCIENT_BUILD_DATE) \
    ro.ancient.build_type=$(ANCIENT_BUILD_TYPE) \
    ro.ancient.release_type=$(ANCIENT_BUILD_TYPE)
