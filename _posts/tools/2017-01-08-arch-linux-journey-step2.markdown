---
title: arch-linux-journey-step2
subtitle: prepare and install
layout: post
date: 2017-01-08
categories: [tools]
tags:
  - 
---


# Step2. prepare environment and install
This series posts are intend to collect the knowledge which I gathered while trying Arch Linux.
And the planned posts would be
 * __step3. customize archlinux__

# Outline of this post
 * create bootable media
 * partitioning (in UEFI BIOS case)
 * install
    * __Question: how to install without internet?__

## create bootable media
 * [download iso](https://www.archlinux.org/download/)
 * dd to usb disk: [``dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync``](https://wiki.archlinux.org/index.php/USB_flash_installation_media#BIOS_and_UEFI_Bootable_USB)
 * __TODO__: multi-bootable usb disk.

## partitioning
 * Testing for a UEFI Boot:
    * ``ls /sys/firmware/efi/efivars``
 * ``cfdisk /dev/sdX``
    * create GPT (partition table)
    * set tye of boot partition to "EFI partition" aka ESP (EFI System Partition) or EFISYS, type __0xEF00__
    * format EFI partition as Fat32
        * ``mkfs.fat -F32 /dev/sda1``
    * format data(filesystem partition) partition to ext4
        * ``mkfs.ext4 /dev/sda2``
    * format swap partition, and enable it btw.
        * ``mkswap /dev/sda3``
        * ``swapon /dev/sda3``

## Installation
 * just follow [this post](https://linustechtips.com/main/topic/575993-guide-installing-arch-linux-on-a-vmware-virtual-machine/) to install every thing.
    * for bootstrap
        * you need dhcp be enabled first
            * ``#systemctl enable dhcpcd.service``
        * choose a closer sit for downloading. [Select_the_mirrors](https://wiki.archlinux.org/index.php/Installation_guide#Select_the_mirrors)
    * for bootloader:
        * for configuration file, arch.conf, it could copy from /usr/share/systemd/bootctl/
        * for install systemd-boot, you can also specify the target folder to install ``bootctl --path=esp install``

    * for desktop you can pick one from this [post](http://www.2daygeek.com/install-xfce-mate-kde-gnome-cinnamon-lxqt-lxde-budgie-deepin-enlightenment-desktop-environment-on-arch-linux/), for example:
        * **lxde + lxdm failed ...**

```
[Install xfce4 Desktop Environment]
$ sudo pacman -S xfce4 xfce4-goodies

[Install, Start & Enable lightdm Display Manager]
$ sudo nano /etc/lightdm/lightdm.conf
greeter-session=lightdm-deepin-greeter

$ sudo systemctl start lightdm.service
$ sudo systemctl enable lightdm.service
```

## something special for VMware case
 * refer to this [post](https://linustechtips.com/main/topic/575993-guide-installing-arch-linux-on-a-vmware-virtual-machine/)
    * [create a guest machine which have UEFI BIOS](https://linustechtips.com/main/topic/575993-guide-installing-arch-linux-on-a-vmware-virtual-machine/)
        * By adding ``firmware = "efi"`` in configuration file _*.efi_

 * Also this comment in thread could be a reference

```
When needing to quickly install in a VM, I usually don't bother about stuff such as partitioning, swap, timezone, locale, users, etc. Minimum needed -

mkfs.btrfs /dev/sda
mount /dev/sda /mnt
pacstrap /mnt base grub btrfs-progs
genfstab /mnt >> /mnt/etc/fstab
arch-chroot /mnt
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

exit
reboot
```

## [__TODO__] install with wifi enabled

[ESP]: https://wiki.archlinux.org/index.php/EFI_System_Partition
[partition]:(https://wiki.archlinux.org/index.php/Fdisk#gdisk)
[Arch Anywhere]:https://www.ostechnix.com/arch-anywhere-an-easy-way-to-install-a-fully-custom-arch-linux-system/
