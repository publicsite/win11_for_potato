#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

qemu-img create -f qcow2 thehdd.qcow 70G

umask "${OLD_UMASK}"
