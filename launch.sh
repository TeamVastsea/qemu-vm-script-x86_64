#!/bin/bash

#Change the variables here according to your need.
VM_NAME="debian-vm"
QCOW2_FILE="debian-vm.qcow2"
ISO_FILE="debian-12.5.0-amd64-netinst.iso"
EFI_FILE="EFI.fd"

CPU_CORE_NUM=4
RAM_SIZE=24567 #unit: MB
SPICE_PORT=5901

taskset -c 0-16 qemu-system-x86_64 \
    -name ${VM_NAME} -smp ${CPU_CORE_NUM} -m ${RAM_SIZE} -vga qxl -enable-kvm \
    -device qemu-xhci -device usb-kbd -device usb-tablet -device virtio-gpu \
    -drive file=${QCOW2_FILE},if=virtio \
    -cdrom ${ISO_FILE} \
    -drive file=${EFI_FILE},index=0,if=pflash,format=raw \
    -chardev stdio,mux=on,id=char0 \
    -mon chardev=char0,mode=readline \
    -spice port=${SPICE_PORT},disable-ticketing=on
