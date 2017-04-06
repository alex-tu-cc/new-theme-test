---
title: "GPU-journey-nvidia-deb-driver"
layout: post
date: 2016-12-29
categories: [tools]
tags:
  - 
---

# [deprecated]
 * please refer to [GPU-journey-install-nvidia-drivers](https://alex-tu-cc.github.io/tools/2017/01/05/GPU-journey-install-nvidia-drivers.html) instead.

The ppa we used to get debian package for nvidia driver is there: [ppa](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa)

But how if we'd like to try more newer driver which has been released to [nvidia offical website][nvidia_driver] but not be collected to [ppa][] yet?

there are some [threads](http://askubuntu.com/questions/130662/how-can-i-convert-the-nvidia-driver-installer-into-a-deb) talk about that, but seems all out of date, the package _nvidia-graphics-drivers_  is not there anymore.

So, we could achive it by a tricky way:

 * download xxx.run from [nvidia offical website][nvidia_driver], ex. 375.xx.run
 * get the closet version of package source code, ex. 357.oo.deb
    * [example of the content of source.](nvidia-graphics-drivers-375-375.26)
 * copy the downloaded 375.xx.run to package source, and release the old one.
    * NVIDIA-Linux-x86-375.26.run
    * NVIDIA-Linux-x86_64-375.26-no-compat32.run
 * replace all version related strings:
```bash
$ find debian -type f | xargs sed 's/375.26/375.30/g' -i
```
 * bump version, ``dch``
 * build it ``debuild -i -b -us -uc``
 * then you get the packages needed.
 * btw, nvidia-prime package is a common tool used to select active GPU by ``prime-select``

[nvidia_driver]:http://www.nvidia.com/Download/driverResults.aspx/109244/en-us
[ppa]:https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
