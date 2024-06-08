# qemu-vm-script-x86_64
If you want to install a virtual machine in a x86_64 device by QEMU, you can following the steps.

## System requirements
- At least 2 core CPU
- At least 4 GB RAM
- At least 50 GB disk space
- CPU virtualization enabled
- QEMU installed

## Steps
**This example shows installing Debian 7.5.0 based on QEMU on Ubuntu 22.04, Other versions may have some differences, please refer to the user documentation for different operating systems.**

1. Create a virtual disk:
    ```shell
    qemu-img create -f qcow2 -o cluster_size=128K virt_disk.qcow2 20G
    ```
 
2. Copy an EFI.fd file to your path:
    ```shell
    sudo cp /usr/share/ovmf/OVMF.fd EFI.fd
    ```

3. Set up launch script parameter:
    ```shell
    sudo vim launch.sh
    ```

4. Check the file structure:
    ```txt
    debian
    ├── debian-7.5.0-amd64-netinst.iso
    ├── EFI.fd
    ├── lingmo-debian-vm.qcow2
    └── start.sh
    ```

5. Launch the VM:
    ```shell
    sudo sh launch.sh
    ```
