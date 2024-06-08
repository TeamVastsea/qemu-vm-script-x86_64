# qemu-vm-script-x86_64
If you want to install a virtual machine in a x86_64 device by QEMU, you can following the steps.

## System requirements
- At least 2 core CPU
- At least 4 GB RAM
- At least 50 GB disk space
- CPU virtualization enabled
- QEMU installed

## Steps
1. Create a virtual disk:
    ```shell
    qemu-img create -f qcow2 -o cluster_size=128K virt_disk.qcow2 20G
    ```

2. Set up launch script parameter:
    ```shell
    sudo vim launch.sh
    ```

3. Launch the VM:
    ```shell
    sudo sh launch.sh
    ```
