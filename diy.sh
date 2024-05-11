#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/wyhdag/dns -b v5 package/emortal/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://github.com/derisamedia/luci-theme-alpha-alk-net.git package/emortal/luci-theme-alpha-alk
sed -i 's/Os/O2/g' include/target.mk
sed -i 's/luci-theme-bootstrap/luci-theme-alphaproto/g' feeds/luci/collections/luci/Makefile
sed -i "27a\echo \"DISTRIB_DESCRIPTION=\'$(TZ=UTC-8 date "+%Y-%m-%d") By:WYH\'\" >> /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)$(BOARD)$(if $(SUBTARGET),-$(SUBTARGET))/$(shell date +"%Y-%m-%d%H.%M.%S)-$(if $(SUBTARGET))g' include/image.mk
