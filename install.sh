#!/bin/bash
#
# Authors
#   Rafael Pezzuto <rafael.pezzuto@gmail.com>
#

# Check for admin rights
if [[ "$(id -u)" = "0" ]]; then
    echo "[I] Does not run the main script as root."
    exit -1
else
	sudo ./aux_scripts/copy_icons.sh
	if [ $? -eq 0 ]; then
		./aux_scripts/change_theme.sh
	else
		echo "[E] The script cannot complete the installation."
		exit -1
	fi
fi