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

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Sqlite
PRODUCT_PACKAGES += \
    sqlite3

# Packages
PRODUCT_PACKAGES += \
    CustomDoze \
    OmniStyle \
    Launcher3QuickStep \
    ThemePicker \
    TouchGestures \
    StitchImage \
    OmniJaws \
    WeatherIcons

# QS tile styles
PRODUCT_PACKAGES += \
    QStileCircleTrim \
    QStileDefault \
    QStileDualToneCircle \
    QStileSquircleTrim \
    QStileAttemptMountain \
    QStileDottedCircle \
    QStileNinja \
    QStilePokesign \
    QStileWavey \
    QStileSquaremedo \
    QStileInkDrop \
    QStileCookie \
    QStileCircleOutline \
    QStileCosmos \
    QStileDividedCircle \
    QStileNeonLight \
    QStileOxygen \
    QStileTriangles

# Statusbar height
PRODUCT_PACKAGES += \
    SbHeightDefault \
    SbHeight35 \
    SbHeight50

# Rounded
PRODUCT_PACKAGES += \
    DgCorner \
    DgCorner1 \
    DgCorner20

ifeq ($(ANCIENT_GAPPS), true)
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt
endif
