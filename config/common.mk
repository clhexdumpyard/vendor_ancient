PRODUCT_BRAND ?= Ancient-OS

ifeq ($(ANCIENT_GAPPS), true)
ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    ro.setupwizard.rotation_locked=true

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.usb.config=adb
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.usb.config=none

# Disable extra StrictMode features on all non-engineering builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.strictmode.disable=true
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/ancient/prebuilt/common/bin/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.sh \
    vendor/ancient/prebuilt/common/bin/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.functions \
    vendor/ancient/prebuilt/common/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh

# OTA
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/ancient/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/ancient/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/ancient/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Pixel permissions
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/ancient/config/permissions/pixel,$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig)

# Some permissions
PRODUCT_COPY_FILES += \
    vendor/ancient/config/permissions/ancient-sysconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/ancient-sysconfig.xml \
    vendor/ancient/config/permissions/org.lineageos.livedisplay.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.lineageos.livedisplay.xml \
    vendor/ancient/config/permissions/privapp-permissions-system-ancient.xml:system/etc/permissions/privapp-permissions-system-ancient.xml \
    vendor/ancient/config/permissions/privapp-permissions-product-ancient.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-product-ancient.xml \
    vendor/ancient/config/permissions/privapp-permissions-system-google-ancient.xml:system/etc/permissions/privapp-permissions-system-google-ancient.xml \
    vendor/ancient/config/permissions/privapp-permissions-product-google-ancient.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-product-google-ancient.xml \
    vendor/ancient/config/permissions/privapp-permissions-elgoog.xml:system/etc/permissions/privapp-permissions-elgoog.xml \
    vendor/ancient/config/permissions/privapp-permissions-system_ext-ancient.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-system_ext-ancient.xml

# Live Display
PRODUCT_COPY_FILES += \
    vendor/ancient/config/permissions/privapp-permissions-livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-livedisplay.xml

# AncientOS-specific init rc file
PRODUCT_COPY_FILES += \
    vendor/ancient/prebuilt/common/etc/init/init.ancient-system_ext.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.ancient-system_ext.rc \
    vendor/ancient/prebuilt/common/etc/init/init.ancient-ssh.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.ancient-ssh.rc \
    vendor/ancient/prebuilt/common/etc/init/init.ancient-livedisplay.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.ancient-livedisplay.rc \
    vendor/ancient/prebuilt/common/etc/init/init.ancient-updates.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.ancient-updates.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/ancient/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/ancient/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/ancient/config/permissions/custom-power-whitelist.xml:system/etc/sysconfig/custom-power-whitelist.xml

# Face Unlock
#TARGET_FACE_UNLOCK_SUPPORTED ?= true
#ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
#PRODUCT_PACKAGES += \
#    FaceUnlockService
#PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
#    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
#endif

# Flatten APEXs for performance
OVERRIDE_TARGET_FLATTEN_APEX := true
# This needs to be specified explicitly to override ro.apex.updatable=true from
# # prebuilt vendors, as init reads /product/build.prop after /vendor/build.prop
PRODUCT_PRODUCT_PROPERTIES += ro.apex.updatable=false

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Enable ccache
USE_SYSTEM_CCACHE := true

ifneq ($(TARGET_BUILD_VARIANT),user)
# Sepolicy
SELINUX_IGNORE_NEVERALLOWS := true
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/ancient/overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ancient/overlay/common

#Weeabo Overlays
ifeq ($(ANCIENT_WEEABO), true)
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/weeabostyle
PRODUCT_PACKAGE_OVERLAYS += vendor/weeabostyle
endif

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    NexusLauncherRelease

# Branding
$(call inherit-product, vendor/ancient/config/branding.mk)

# Overlays
$(call inherit-product, vendor/overlays/config.mk)

# Variant
ifeq ($(ANCIENT_GAPPS), true)
$(call inherit-product, vendor/gms/products/gms.mk)
else
$(call inherit-product, vendor/ancient/config/basicapps.mk)
endif

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.video_enabled=false

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Fonts
$(call inherit-product, vendor/fonts/config.mk)

# Pixelstyle
$(call inherit-product, vendor/pixelstyle/config.mk)

# Prebuilts
$(call inherit-product, vendor/prebuilts/config.mk)

# Packages
$(call inherit-product, vendor/ancient/config/packages.mk)

ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    UdfpsResources
endif

-include $(WORKSPACE)/build_env/image-auto-bits.mk
