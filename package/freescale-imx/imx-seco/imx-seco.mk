################################################################################
#
# imx-seco
#
################################################################################

IMX_SECO_VERSION = 5.9.4.1
IMX_SECO_REVISION = 0333596
IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION)-$(IMX_SECO_REVISION).bin

IMX_SECO_LICENSE = NXP Semiconductor Software License Agreement
IMX_SECO_LICENSE_FILES = EULA COPYING SCR.txt SCR-imx-seco.txt
IMX_SECO_REDISTRIBUTE = NO

define IMX_SECO_EXTRACT_CMDS
	$(call NXP_EXTRACT_HELPER,$(IMX_SECO_DL_DIR)/$(IMX_SECO_SOURCE))
endef

IMX_SECO_INSTALL_IMAGES = YES

# SECO firmware is needed when generating imx8-boot-sd.bin which
# is done in post-image script.
IMX_SECO_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE))

define IMX_SECO_INSTALL_IMAGES_CMDS
	cp $(@D)/firmware/seco/$(IMX_SECO_AHAB_CONTAINER_IMAGE) \
		$(BINARIES_DIR)/ahab-container.img
endef

$(eval $(generic-package))
