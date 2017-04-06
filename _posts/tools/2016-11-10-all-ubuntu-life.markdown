---
layout: post
subtitle: "keep updating ..."
categories: [tool]
---

此篇記載本人將 Ubuntu 作為生活使用所遇到的問題及解決方式。  
目前使用 Ubuntu Xenial 14.04.1

# Commuication 
## Skype
 * Q: 沒有聲音，sound devices 中只有Virtual Device 可選:
   * [因為skype 目前只有出 32bit ，所以需要再裝相對應的 library ](https://community.skype.com/t5/Linux/After-4-3-0-37-the-divices-only-show-up-as-quot-virtual-device/td-p/3228886)
   * ```sudo apt-get install libpulse0:i386```  
<br />
 * Q: 怎麼錄音?
   * skype-call-recorder_0.11a 目前跟skype 4.3.0.37-0ubuntu0.12.04.1 運作正常錄出來的檔案放在 /${home}/Skype Calls
