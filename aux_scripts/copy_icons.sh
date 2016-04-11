#!/bin/bash
# Authors:
#   Rafael Pezzuto <rafael.pezzuto@gmail.com>
# 
# Original script (Nathan Dier's dropbox mod for elementary OS): 
#   https://github.com/nathandyer/elementary-dropbox-mods/blob/master/dropbox-elementary.sh
#
# This script free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This file is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# Copies icons
function copy_icons {
    script_dir=$(dirname $(readlink -f $0))
    cd /usr/share/icons/
    if [[ -d elementary-extra ]]; then
        echo "[0] Removing previous Extra Icons for elementary OS installation..."
        rm -r /usr/share/icons/elementary-extra
    fi
    echo "[1] Making dir..."
    mkdir /usr/share/icons/elementary-extra
    echo "[2] Copying icon theme..."
    cd $(echo $script_dir)
    cp ../index.theme /usr/share/icons/elementary-extra/index.theme
    cp -ar ../apps /usr/share/icons/elementary-extra/
    echo "[OK] Extra Icons for elementary OS have been instaled."
	exit 0
}

clear

echo '#---------------------------------------------#'
echo '#        Extra Icons for elementary OS#       #'
echo '#---------------------------------------------#'

# Check for admin rights
if [[ "$(id -u)" = "0" ]]; then
    echo "[I] This part of the script is running as root."
else
    echo "[E] This part of the script does not have root privileges."
    echo "[E] If you wish to install Extra Icons for elementary OS re-run this part of the script with root privileges."
fi

# If root, install the custom icons and exit
if [[ "$(id -u)" = "0" ]]; then
    read -p "[?] Would you like to install the Extra Icons for elementary OS? (Y)es, (N)o: " INPUT
    case $INPUT in
        [Yy]* ) copy_icons;;
        [Nn]* ) exit 1;;
        * ) echo "[E] Sorry, you have to insert Y or N. Run the script again." && exit -1 
    esac
fi