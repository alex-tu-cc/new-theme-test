---
title: GPU-journey-pack-nvidia-driver
subtitle:
layout: post
date: 2017-03-17
categories: [tools]
tags:
  - 
---


In GPU-journey-install-nvidia-drivers, we talked about how to pack a new nvidia driver for Ubuntu.
But I just realized that there is a better convenient way to do those stuff.

All the packages on [ppa][] were came from the template hosted on github:
https://github.com/mamarley/nvidia-graphics-drivers/
~~But I changed a bit for version 375 because it seems different version could not share the same code base:~~
~~https://github.com/alex-tu-cc/nvidia-graphics-drivers~~
But the real code base which be used to release should be [Alberto github][] (so far is branch 375)

So, the correct way is:
1. checkout the template from ~~[my github][] branch test-375.39~~ [Alberto github][] branch 375.
2. download .run file from the ftp url in debian/rules or from [Nvidia webside][]
(but the default filename in debian/rules is that one on ftp).
ex. download version [375.39][ftp://download.nvidia.com/XFree86/Linux-x86_64/375.39]
3. copy both 32bit and 64bit to the root of folder in step 1.
4. $ dch ;to change the version to nvidia driver version.
(step 3. and 4. are interchangeable)
5. $ debclean;replace version string by debclean
6. $ debuild -i -b -us -uc ;build package 

2017-03-20 updated:
I found an old article after posting this one, it also teach people how to pack new nvidia driver by bump major version.
 * [Mini-HOWTO: Building a Deb Package for Beta NVidia Drivers](http://atomic-penguin.github.io/blog/2012/12/14/mini-howto-building-a-deb-package-for-beta-nvidia-drivers/)

[ppa]: https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
[Nvidia webside]: http://www.nvidia.com/download/driverResults.aspx/114708/en-us
[my github]: https://github.com/alex-tu-cc/nvidia-graphics-drivers
[Alberto github]: https://github.com/tseliot/nvidia-graphics-drivers
