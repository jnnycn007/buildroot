################################################################################
#
# mpd
#
################################################################################

MPD_VERSION_MAJOR = 0.24
MPD_VERSION = $(MPD_VERSION_MAJOR).4
MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
MPD_DEPENDENCIES = host-pkgconf fmt
MPD_LICENSE = GPL-2.0+
MPD_LICENSE_FILES = COPYING

MPD_CPE_ID_VENDOR = musicpd
MPD_CPE_ID_PRODUCT = music_player_demon

MPD_SELINUX_MODULES = mpd
MPD_CONF_OPTS = \
	-Daudiofile=disabled \
	-Ddocumentation=disabled \
	-Dopenmpt=disabled \
	-Dpipewire=disabled \
	-Dsnapcast=false

# Zeroconf support depends on libdns_sd from avahi.
ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
MPD_DEPENDENCIES += avahi
MPD_CONF_OPTS += -Dzeroconf=avahi
else
MPD_CONF_OPTS += -Dzeroconf=disabled
endif

ifeq ($(BR2_PACKAGE_EXPAT),y)
MPD_DEPENDENCIES += expat
MPD_CONF_OPTS += -Dexpat=enabled
else
MPD_CONF_OPTS += -Dexpat=disabled
endif

# MPD prefers libicu for utf8 collation instead of libglib2.
ifeq ($(BR2_PACKAGE_ICU),y)
MPD_DEPENDENCIES += icu
MPD_CONF_OPTS += -Dicu=enabled
else
MPD_CONF_OPTS += -Dicu=disabled
endif

ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
MPD_DEPENDENCIES += json-for-modern-cpp
MPD_CONF_OPTS += -Dnlohmann_json=enabled
else
MPD_CONF_OPTS += -Dnlohmann_json=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
MPD_DEPENDENCIES += alsa-lib
MPD_CONF_OPTS += -Dalsa=enabled
else
MPD_CONF_OPTS += -Dalsa=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_AO),y)
MPD_DEPENDENCIES += libao
MPD_CONF_OPTS += -Dao=enabled
else
MPD_CONF_OPTS += -Dao=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
MPD_DEPENDENCIES += bzip2
MPD_CONF_OPTS += -Dbzip2=enabled
else
MPD_CONF_OPTS += -Dbzip2=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_CDIO_PARANOIA),y)
MPD_DEPENDENCIES += libcdio-paranoia
MPD_CONF_OPTS += -Dcdio_paranoia=enabled
else
MPD_CONF_OPTS += -Dcdio_paranoia=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_CURL),y)
MPD_DEPENDENCIES += libcurl
MPD_CONF_OPTS += -Dcurl=enabled
else
MPD_CONF_OPTS += -Dcurl=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_DSD),y)
MPD_CONF_OPTS += -Ddsd=true
else
MPD_CONF_OPTS += -Ddsd=false
endif

ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
MPD_DEPENDENCIES += faad2
MPD_CONF_OPTS += -Dfaad=enabled
else
MPD_CONF_OPTS += -Dfaad=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_FFMPEG),y)
MPD_DEPENDENCIES += ffmpeg
MPD_CONF_OPTS += -Dffmpeg=enabled
else
MPD_CONF_OPTS += -Dffmpeg=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
MPD_DEPENDENCIES += flac
MPD_CONF_OPTS += -Dflac=enabled
else
MPD_CONF_OPTS += -Dflac=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_FLUIDSYNTH),y)
MPD_DEPENDENCIES += fluidsynth
MPD_CONF_OPTS += -Dfluidsynth=enabled
else
MPD_CONF_OPTS += -Dfluidsynth=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_HTTPD_OUTPUT),y)
MPD_CONF_OPTS += -Dhttpd=true
else
MPD_CONF_OPTS += -Dhttpd=false
endif

ifeq ($(BR2_PACKAGE_MPD_ID3TAG),y)
MPD_DEPENDENCIES += libid3tag
MPD_CONF_OPTS += -Did3tag=enabled
else
MPD_CONF_OPTS += -Did3tag=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_IO_URING),y)
MPD_DEPENDENCIES += liburing
MPD_CONF_OPTS += -Dio_uring=enabled
else
MPD_CONF_OPTS += -Dio_uring=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
MPD_DEPENDENCIES += jack2
MPD_CONF_OPTS += -Djack=enabled
else
MPD_CONF_OPTS += -Djack=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LAME),y)
MPD_DEPENDENCIES += lame
MPD_CONF_OPTS += -Dlame=enabled
else
MPD_CONF_OPTS += -Dlame=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LIBMPDCLIENT),y)
MPD_DEPENDENCIES += libmpdclient
MPD_CONF_OPTS += -Dlibmpdclient=enabled
else
MPD_CONF_OPTS += -Dlibmpdclient=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LIBMMS),y)
MPD_DEPENDENCIES += libmms
MPD_CONF_OPTS += -Dmms=enabled
else
MPD_CONF_OPTS += -Dmms=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
MPD_DEPENDENCIES += libnfs
MPD_CONF_OPTS += -Dnfs=enabled
else
MPD_CONF_OPTS += -Dnfs=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LIBSMBCLIENT),y)
MPD_DEPENDENCIES += samba4
MPD_CONF_OPTS += -Dsmbclient=enabled
else
MPD_CONF_OPTS += -Dsmbclient=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
MPD_DEPENDENCIES += libsamplerate
MPD_CONF_OPTS += -Dlibsamplerate=enabled
else
MPD_CONF_OPTS += -Dlibsamplerate=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LIBSNDFILE),y)
MPD_DEPENDENCIES += libsndfile
MPD_CONF_OPTS += -Dsndfile=enabled
else
MPD_CONF_OPTS += -Dsndfile=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_LIBSOXR),y)
MPD_DEPENDENCIES += libsoxr
MPD_CONF_OPTS += -Dsoxr=enabled
else
MPD_CONF_OPTS += -Dsoxr=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_MAD),y)
MPD_DEPENDENCIES += libmad
MPD_CONF_OPTS += -Dmad=enabled
else
MPD_CONF_OPTS += -Dmad=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_MODPLUG),y)
MPD_DEPENDENCIES += libmodplug
MPD_CONF_OPTS += -Dmodplug=enabled
else
MPD_CONF_OPTS += -Dmodplug=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
MPD_DEPENDENCIES += mpg123
MPD_CONF_OPTS += -Dmpg123=enabled
else
MPD_CONF_OPTS += -Dmpg123=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_MUSEPACK),y)
MPD_DEPENDENCIES += musepack
MPD_CONF_OPTS += -Dmpcdec=enabled
else
MPD_CONF_OPTS += -Dmpcdec=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT),y)
MPD_CONF_OPTS += -Dneighbor=true
else
MPD_CONF_OPTS += -Dneighbor=false
endif

ifeq ($(BR2_PACKAGE_MPD_OPENAL),y)
MPD_DEPENDENCIES += openal
MPD_CONF_OPTS += -Dopenal=enabled
else
MPD_CONF_OPTS += -Dopenal=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
MPD_DEPENDENCIES += opus libogg
MPD_CONF_OPTS += -Dopus=enabled
else
MPD_CONF_OPTS += -Dopus=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_OSS),y)
MPD_CONF_OPTS += -Doss=enabled
else
MPD_CONF_OPTS += -Doss=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
MPD_DEPENDENCIES += pulseaudio
MPD_CONF_OPTS += -Dpulse=enabled
else
MPD_CONF_OPTS += -Dpulse=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_QOBUZ),y)
MPD_DEPENDENCIES += libgcrypt
MPD_CONF_OPTS += -Dqobuz=enabled
else
MPD_CONF_OPTS += -Dqobuz=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_SHOUTCAST),y)
MPD_DEPENDENCIES += libshout
MPD_CONF_OPTS += -Dshout=enabled
else
MPD_CONF_OPTS += -Dshout=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_SIDPLAY),y)
MPD_DEPENDENCIES += libsidplay2
MPD_CONF_OPTS += -Dsidplay=enabled
else
MPD_CONF_OPTS += -Dsidplay=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
MPD_DEPENDENCIES += sqlite
MPD_CONF_OPTS += -Dsqlite=enabled
else
MPD_CONF_OPTS += -Dsqlite=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_TCP),y)
MPD_CONF_OPTS += -Dtcp=true
else
MPD_CONF_OPTS += -Dtcp=false
endif

ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
MPD_DEPENDENCIES += tremor
MPD_CONF_OPTS += -Dtremor=enabled
else
MPD_CONF_OPTS += -Dtremor=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_TWOLAME),y)
MPD_DEPENDENCIES += twolame
MPD_CONF_OPTS += -Dtwolame=enabled
else
MPD_CONF_OPTS += -Dtwolame=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_UPNP_PUPNP),y)
MPD_DEPENDENCIES += \
	libupnp
MPD_CONF_OPTS += -Dupnp=pupnp
else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
MPD_DEPENDENCIES += \
	libnpupnp
MPD_CONF_OPTS += -Dupnp=npupnp
else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
MPD_CONF_OPTS += -Dupnp=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
MPD_DEPENDENCIES += libvorbis
MPD_CONF_OPTS += -Dvorbis=enabled -Dvorbisenc=enabled
else
MPD_CONF_OPTS += -Dvorbis=disabled -Dvorbisenc=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_WAVPACK),y)
MPD_DEPENDENCIES += wavpack
MPD_CONF_OPTS += -Dwavpack=enabled
else
MPD_CONF_OPTS += -Dwavpack=disabled
endif

ifeq ($(BR2_PACKAGE_MPD_ZZIP),y)
MPD_DEPENDENCIES += zziplib
MPD_CONF_OPTS += -Dzzip=enabled
else
MPD_CONF_OPTS += -Dzzip=disabled
endif

define MPD_INSTALL_EXTRA_FILES
	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
endef

MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES

define MPD_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D package/mpd/S95mpd \
		$(TARGET_DIR)/etc/init.d/S95mpd
endef

$(eval $(meson-package))
