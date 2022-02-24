# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# CutOut
PRODUCT_PACKAGES += \
    NoCutoutOverlay1 \
    NoCutoutOverlay2

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/curl \
    system/bin/getcap \
    system/bin/setcap

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    procmem

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/procmem
endif

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs

# Fonts
PRODUCT_PACKAGES += \
    Ancient-Fonts

# Sqlite
PRODUCT_PACKAGES += \
    sqlite3

# Packages
PRODUCT_PACKAGES += \
    CustomDoze \
    Eleven \
    GamingMode \
    Launcher3QuickStep \
    QuickAccessWallet \
    ThemePicker \
    TouchGestures \
    Recorder \
    RepainterServicePriv \
    SoftAPManager \
    StitchImage \
    OmniJaws \
    WeatherIcons

ifeq ($(ANCIENT_WEEABO), true)
PRODUCT_PACKAGES += \
#   weebstyle
else
PRODUCT_PACKAGES += \
    OmniStyle
endif

ifeq ($(ANCIENT_GAPPS), true)
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt
endif
