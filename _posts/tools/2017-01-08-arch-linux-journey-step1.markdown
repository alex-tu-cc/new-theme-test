---
title: arch-linux-journey-step1
subtitle: background knowledge
layout: post
date: 2017-01-08
categories: [productivity]
tags:
  - 
---

# Step 1. background knowledge.
This series posts are intend to
And the planned posts would be
 * __step2. prepare environment
     * introduce the ways on VM
     * introduce the steps to i
 * __step3. customize archlinux


# Outline of this post
## terms in Arch comparing to U
 * [repository](https://wiki.ar
    * list in /etc/pacman.conf 
    * [unofficial user reposito
 * [pacman](https://wiki.archli

## others
 * popularity constent
    * https://www.archlinux.de/
    * http://popcon.debian.org/

## Linux components
 * kernel, initramfs
 * bootloader
     * grub
     * systemd-boot (only for U
 * Xserver
     * Xorg
     * Mir
     * wayland
 * display manager
     * GDM
     * lightDM
     * ....
 * [windows manager](https://wi
 * desktop manager (which inclu
     * gnome
     * xfce
     * unity

## PC environments
 * BIOS type:
     * UEFI(Unified Extensible 
     * Lagacy
 * Partition table options:
     * GPT (GUID Partition Tabl
     * MBR (Master Boot Record)
 * Partitions options:
     * [ESP][](EFI System Parti
     * BIOS boot partition, typ

## Installer media options
 * ISO file for VMware
 * bootable USB disk or liveCD 
 * [Arch Anywhere][] (I didn't 


# Something detail
 * for options of bootloader, b type as __0xEF00__ if you would like to use systemd-boot as bootloader.
 * partition could be done by `

# Reference information
## MBR (Master Boot Record) (La
 * old partition table format w
 * 4 primary partitions and add
 * GRUB is embedded in the area

## GPT (GUID Partition Table) (
 * part of EFI(Extensible Firmw
 * reserve a whild partition fo
 * ``# parted /dev/disk set par

## BIOS,  bootloader and partit
 * Lagcy BIOS
    * MBR
        * GRUB
            * No need special b
    * GPT
        * GRUB
            *  _BIOS boot parti
                * GRUB can then
 * UEFI BIOS
    * GPT
        * GRUB
        * systemd-boot
            * [ESP][](EFI Syste


[ESP]: https://wiki.archlinux.o
[partition]:(https://wiki.archl
[Arch Anywhere]:https://www.ost
