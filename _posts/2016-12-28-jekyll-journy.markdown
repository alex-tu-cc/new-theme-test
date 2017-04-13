---
title: jekyll-journy
layout: post
date: 2016-12-28
categories: [tools]
tags:
  - 
---
This post is used to collect all Q&A during I'm using jekyll in in github pages.

# Q: how to embed image in post?
refer to [this thread](http://stackoverflow.com/questions/27386169/change-site-url-to-localhost-during-jekyll-local-development), to set up 'url' and 'baseurl' then 'sit.baseurl' could be a reference  base path.
```
... which is shown in the screenshot below:
![My helpful screenshot]({{ site.baseurl }}/images/screenshot.jpg)

OR
<img src="\{\{ site.baseurl \}\}/images/something.png">

OR provide a link for downloading something

... you can [get the PDF](\{\{ site.baseurl \}\}/other_stuff/mydoc.pdf) directly.

```
![example_cc]({{ site.baseurl }}/images/CC_presentation_example.jpg)

