ANCIENT_OTA_VERSION_CODE := twelve

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ancient.ota.version_code=$(ANCIENT_OTA_VERSION_CODE)

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/ancient/config/permissions/com.ancient.ota.xml:system/etc/permissions/com.ancient.ota.xml
