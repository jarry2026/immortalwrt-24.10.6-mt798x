#!/bin/bash

# PassWall 代理插件（底层核心 + LuCI 界面）
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/passwall-packages
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall.git package/luci-app-passwall

# Argon 主题 + 配置插件
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 修复 wget-any 依赖警告
sed -i 's/wget-any/wget/g' package/luci-theme-argon/Makefile

# ==================== DiskMan 磁盘管理插件（修复路径嵌套问题） ====================
rm -rf package/luci-app-diskman tmp_diskman
git clone --depth=1 https://github.com/sbwml/luci-app-diskman tmp_diskman
cp -r tmp_diskman/luci-app-diskman package/luci-app-diskman
rm -rf tmp_diskman
