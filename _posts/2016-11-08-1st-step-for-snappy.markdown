---
layout: post
title:  "1st step for snappy"
subtitle: "What you can do with it!"
categories: [tool]
---
# 1st step for snappy
以下是在下用有限的時間了解的淺見，有錯 .... 就算了~

[snappy](https://www.ubuntu.com/desktop/snappy) 是Canonical 最近全力發展的一個新品牌，其整個 ecosystem 包含了 snap, snapd, all snaps 因為一些都還在發展之中，這些名字都有可能再變 (之前 snappy 1.0 到 snappy 2.0 就發生過),也因為是新的品牌，常常 google 在找的時後會找到一些沒關係的東酉或是舊的設計架構 (snappy 1.0)

所以，最好每次都比較一下 snapd 版本或是文章的時間 (可能一星期就不太一樣)

整個品牌個人感覺是包含了兩大部份:

 * universal snap
 * all-snap
  * 目前最新是 [Ubuntu Core 16](https://goo.gl/O1K1FG)

## universal snap
由snap, snapd, snapcraft 組成，目地是要取代現行的 deb, rpm 等各家不同的 package format ，而用統一 format 可以裝在所有 linux base distribution 上。

### 如何作到?
#### snap
  * 新的 package format，為 squashfs image，裡面包了差不多所有執行程式時需的東西 ex. share libs
  * 執行程式時透過 snapd 準備一個臨時 rootfs ，並將需要的 folders bind mount 進去，最後 chroot 進去執行。
   * 以此達成 confinement 及 decouple dependency
   > 還是有一些 interface 可以讓 snap 之間分享資源
   * 但 size 會增加, 其目標 device 為單一或少功能的 IoT ，所以預期空間足夠使用。
   * [non-official hardware requirement](http://askubuntu.com/questions/617904/what-are-the-minimum-system-requirements-for-ubuntu-snappy-core)

#### snapcraft
  * 一個打包 snap 的工具，執行時可以 parse yaml file 抓取需要的 source code 及 build dependency 然後在獨立的 chroot 環境中編譯。
  * [snapcraft.io](http://snapcraft.io/)
  
#### snapd
  * 一個 daemon 提供所有執行 snap 所需的環境，也就是說只要有 snapd 的地方都可以執行 snap.
  * 已經發行 snapd 到眾家 distribution 的 store 中，剩下的也將慢慢完成 (連 openwrt 也在計畫當中)

## all-snap
由 system-boot, writable partitions, kernel snap, core snap (也叫 os snap), 及支持的 bootloader (u-boot or grub) 組成，
目的是一開機就進入精簡過的 core snap ubuntu rootfs, 然後所有的package 都以 snap 的形式存在，適用於IoT deivce.

### 如何作到?
#### kernel snap
  * 包含 kernel image 
  * 包含 [initramfs](http://bazaar.launchpad.net/~mvo/+junk/initramfs-tools-ubuntu-core-new-os-snap/files)
    * initramfs mout OS snap，[bindmount 需要的folder] 再 chroot 進去執行 systemd.   
    * [從 x86 core 16 beta 抓出來的 initramfs](http://people.canonical.com/~alextu/snappy/booting/initramfs/)                                                                             
  * arm base device 上，目前是解開在 system-boot partition
  * x86 base 則保留 squashfs image 讓[grub](http://paste.ubuntu.com/23219525/)載入.

#### OS snap
  * 精簡過ubuntu rootfs, 有點像 [ubuntu phone](http://ha-tech-note.blogspot.tw/2016/06/ubuntu-phone-porting.html) 上面的 ubuntu tarball.

#### bootloader
  * 透過環境變snap_try_kernel, snappy_core, snappy_kernel, snap_mode 等環境變數來決定要 load 那個 kernel snap 及 os snap，以達到開機失敗就載舊 image 的功能。
  * 目前有 u-boot 及 grub ，在 android 上因為 bootload 常不opensource ，所以可能會以 android recovery 來達成類似的效果。
