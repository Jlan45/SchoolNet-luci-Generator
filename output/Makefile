include $(TOPDIR)/rules.mk

PKG_NAME:=CUMTLogin
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/schoolnet
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=schoolnet Script
	PKGARCH:=all
    URL:=https://github.com/Jlan45/schoolnet
    MAINTAINER:=J1an
endef

define Package/schoolnet/description
    This package contains LuCI configuration pages for schoolnet.
endef

define Package/schoolnet/install
    $(INSTALL_DIR) $(1)/etc/config
    $(INSTALL_DIR) $(1)/etc/init.d
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DIR) $(1)/usr/sbin

    $(INSTALL_CONF) ./files/config/schoolnet $(1)/etc/config/schoolnet
    $(INSTALL_BIN) ./files/init.d/schoolnet $(1)/etc/init.d/schoolnet
    $(INSTALL_DATA) ./files/model/cbi/schoolnet.lua $(1)/usr/lib/lua/luci/model/cbi/schoolnet.lua
    $(INSTALL_DATA) ./files/controller/schoolnet.lua $(1)/usr/lib/lua/luci/controller/schoolnet.lua
    $(INSTALL_BIN) ./files/sbin/schoolnet $(1)/usr/sbin/schoolnet
endef

$(eval$(call BuildPackage,$(PKG_NAME)))