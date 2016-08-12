#!/bin/bash
# Authors:
#   Rafael Pezzuto <rafael.pezzuto@gmail.com>
# 

echo ""
echo "[I] This part of the script is running as normal user."

# Changes gtk icon theme to elementary-extra
current_icon_theme=$(dconf read /org/gnome/desktop/interface/icon-theme)
new_icon_theme="'elementary-extra'"
echo "[3] Changing icon theme from $current_icon_theme to 'elementary-extra'..."
gsettings set org.gnome.desktop.interface icon-theme $new_icon_theme
echo "[OK] Success."
echo ""
exit 0