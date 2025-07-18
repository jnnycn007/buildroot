################################################################################
#
# libheif
#
################################################################################

LIBHEIF_VERSION = 1.20.1
LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
LIBHEIF_LICENSE = LGPL-3.0+
LIBHEIF_LICENSE_FILES = COPYING
LIBHEIF_CPE_ID_VENDOR = struktur
LIBHEIF_INSTALL_STAGING = YES
LIBHEIF_CONF_OPTS = \
	-DCMAKE_CXX_FLAGS="-std=c++11" \
	-DENABLE_PLUGIN_LOADING=OFF \
	-DWITH_AOM_DECODER=OFF \
	-DWITH_AOM_ENCODER=OFF \
	-DWITH_DEFLATE_HEADER_COMPRESSION=OFF \
	-DWITH_EXAMPLES=OFF \
	-DWITH_GDK_PIXBUF=OFF \
	-DWITH_LIBSHARPYUV=OFF \
	-DWITH_RAV1E=OFF \
	-DWITH_REDUCED_VISIBILITY=ON \
	-DWITH_SvtEnc=OFF

ifeq ($(BR2_PACKAGE_DAV1D),y)
LIBHEIF_CONF_OPTS += -DWITH_DAV1D=ON
LIBHEIF_DEPENDENCIES += dav1d
else
LIBHEIF_CONF_OPTS += -DWITH_DAV1D=OFF
endif

ifeq ($(BR2_PACKAGE_FFMPEG),y)
LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=ON
LIBHEIF_DEPENDENCIES += ffmpeg
else
LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=OFF
endif

ifeq ($(BR2_PACKAGE_KVAZAAR),y)
LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=ON
LIBHEIF_DEPENDENCIES += kvazaar
else
LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=OFF
endif

ifeq ($(BR2_PACKAGE_LIBDE265),y)
LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=ON
LIBHEIF_DEPENDENCIES += libde265
else
LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
LIBHEIF_DEPENDENCIES += jpeg
else
LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
endif

ifeq ($(BR2_PACKAGE_OPENJPEG),y)
LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=ON -DWITH_OpenJPEG_ENCODER=ON
LIBHEIF_DEPENDENCIES += openjpeg
else
LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=OFF -DWITH_OpenJPEG_ENCODER=OFF
endif

ifeq ($(BR2_PACKAGE_X265),y)
LIBHEIF_CONF_OPTS += -DWITH_X265=ON
LIBHEIF_DEPENDENCIES += x265
else
LIBHEIF_CONF_OPTS += -DWITH_X265=OFF
endif

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
LIBHEIF_CONF_OPTS += -DENABLE_MULTITHREADING_SUPPORT=ON
ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=OFF
else
LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=ON
endif
else
LIBHEIF_CONF_OPTS += \
	-DENABLE_MULTITHREADING_SUPPORT=OFF \
	-DENABLE_PARALLEL_TILE_DECODING=OFF
endif

$(eval $(cmake-package))
