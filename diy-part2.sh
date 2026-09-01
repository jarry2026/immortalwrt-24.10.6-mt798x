#!/bin/bash

# 修改默认 LAN 后台地址为 192.168.6.1
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 生成首次开机自动执行脚本（仅运行一次，执行完自动删除）
mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/99-custom-firstrun <<'EOF'
#!/bin/sh
# WiFi SSID 设置：2.4G=ImmortalWrt，5G=ImmortalWrt-5G
uci set wireless.@wifi-iface[0].ssid='ImmortalWrt'
uci set wireless.@wifi-iface[1].ssid='ImmortalWrt-5G'
uci set wireless.@wifi-iface[0].disabled='0'
uci set wireless.@wifi-iface[1].disabled='0'
# 设置 LuCI 默认主题为 Argon
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit wireless
uci commit luci
EOF
chmod +x files/etc/uci-defaults/99-custom-firstrun
