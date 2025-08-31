#!/bin/sh

#run with sudo
#argv1 = the vanillaiso

if [ ! -f "$1" ]; then
	echo "Arg1: The vanilla win ISO file"
	exit
else
	if [ "$(printf "%s" "$1" | rev | cut -d '.' -f 1)" != "osi" ]; then
		echo "Argv1 is not an iso file, exiting"
		exit
	fi
fi

mkdir "${PWD}/mountpoint"

mount -o loop "$1" "${PWD}/mountpoint"

sleep 1

if [ -d "${PWD}/win_iso_for_potato" ]; then
	rm -rf "${PWD}/win_iso_for_potato"
fi

cp -a "${PWD}/mountpoint" "${PWD}/win_iso_for_potato"
sync

sleep 1

umount mountpoint

rmdir mountpoint

cp -a "${PWD}/thirdparty/autounattend.xml" "${PWD}/win_iso_for_potato/"

echo
echo "Done. Now run createImage.sh"