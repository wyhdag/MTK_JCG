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

sed -i 's/Os/O2/g' include/target.mk
sed -i "27a\echo \"DISTRIB_DESCRIPTION=\'$(TZ=UTC-8 date "+%Y-%m-%d") By:WYH\'\" >> /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)$(BOARD)$(if $(SUBTARGET),-$(SUBTARGET))/$(BOARD)$(if $(SUBTARGET),-$(SUBTARGET))/g' include/image.mk
