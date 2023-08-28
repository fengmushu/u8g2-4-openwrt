#
# Copyright (C) 2015
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=u8g2
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

#CMAKE_FLAGS +=

define Package/u8g2
  CATEGORY:=LCD
  TITLE:=u8g2 linux application i2c driver
  DEPENDS:=
endef

define Package/u8g2/description
 This package contains an utility that application driver for u8g2
endef

define Package/u8g2/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/u8g2.init $(1)/etc/init.d/u8g2
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/etc/init.d/u8g2.sh $(1)/usr/sbin/u8g2
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/u8g2_hw_i2c $(1)/u8g2_hw_i2c
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
