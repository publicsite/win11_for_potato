#!/bin/sh
if [ "$1" = "nocd" ]; then
qemu-system-x86_64 -m 4G -smp 4 -display sdl -enable-kvm -cpu host -hda thehdd.qcow -boot d -net nic -net user -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -smbios type=1,uuid=$(uuidgen) -machine pc-q35-6.2
else
qemu-system-x86_64 -m 4G -smp 4 -display sdl -enable-kvm -cpu host -hda thehdd.qcow -cdrom $PWD/*.for_potato.iso -boot d -net nic -net user -device virtio-balloon-pci -device virtio-serial-pci -device virtio-rng-pci -smbios type=1,uuid=$(uuidgen) -machine pc-q35-6.2
fi
