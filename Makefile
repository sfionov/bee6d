include $(TOPDIR)/rules.mk

PKG_NAME:=bee6d
PKG_RELEASE=2

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/bee6d
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=Beeline IPv6 hack
  DEPENDS:=+ipv6calc +ip +rdisc6
endef

define Build/Compile
endef

define Package/bee6d/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./etc/config/bee6d $(1)/etc/config/bee6d
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./usr/bin/bee6d $(1)/usr/bin/bee6d
	$(INSTALL_DIR) $(1)/etc/ppp/ip-up.d
	$(INSTALL_BIN) ./etc/ppp/ip-up.d/bee6d.sh $(1)/etc/ppp/ip-up.d/bee6d.sh
	$(INSTALL_DIR) $(1)/etc/ppp/ip-down.d
	$(INSTALL_BIN) ./etc/ppp/ip-down.d/bee6d.sh $(1)/etc/ppp/ip-down.d/bee6d.sh
endef

$(eval $(call BuildPackage,bee6d))
