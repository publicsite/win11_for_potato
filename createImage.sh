#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

if [ ! -f "$1" ]; then
	echo "Arg1: The vanilla win ISO file"
	exit
else
	if [ "$(printf "%s" "$1" | rev | cut -d '.' -f 1)" != "osi" ]; then
		echo "Argv1 is not an iso file, exiting"
		exit
	fi
fi

newISO="$(basename "$1" | rev | cut -d '.' -f2- | rev).for_potato.iso"

mkisofs \
  -V "$(file -s "$1" | cut -d "'" -f 2)" \
  --allow-limited-size \
  -no-emul-boot \
  -b "boot/etfsboot.com" \
  -boot-load-seg 0 \
  -boot-load-size 8 \
  -eltorito-alt-boot \
  -no-emul-boot \
  -e "efi/microsoft/boot/efisys.bin" \
  -boot-load-size 1 \
  -iso-level 4 \
  -udf \
  -o "${PWD}/${newISO}" \
  "${PWD}/win_iso_for_potato"

  umask "${OLD_MASK}"
  
