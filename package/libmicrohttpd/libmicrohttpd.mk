################################################################################
#
# libmicrohttpd
#
################################################################################

LIBMICROHTTPD_VERSION = 1.0.2
LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
LIBMICROHTTPD_LICENSE_FILES = COPYING
LIBMICROHTTPD_CPE_ID_VENDOR = gnu
LIBMICROHTTPD_INSTALL_STAGING = YES
LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99

LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"

ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
LIBMICROHTTPD_LICENSE = LGPL-2.1+
LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
else
LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
LIBMICROHTTPD_CONF_OPTS += --disable-https
endif

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
LIBMICROHTTPD_CONF_OPTS += --with-threads=auto
else
LIBMICROHTTPD_CONF_OPTS += --with-threads=none
endif

$(eval $(autotools-package))
