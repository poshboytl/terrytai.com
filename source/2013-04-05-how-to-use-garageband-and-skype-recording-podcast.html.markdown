---
title: "如何使用GarageBand和Skype录制Podcast"
date: 2013-04-05 09:22 +08:00
tags: podcast
author: terry
---

上周Daniel, Dingding 和我一起录制我们的第一期Podcast。 我们的核心成员还有Kevin Wang，他会在即将推出的第二期和大家见面。

这篇文章主要是分享一下第一期的录制方法，以免我的同伴们重复研究。如果你也有需求录制Skype call，那么希望对你也有所帮助。

首先整个录制过程需要用到三个软件：

1.  [GarageBand](http://www.apple.com.cn/ilife/garageband/)
2.  [Soundflower](http://cycling74.com/products/soundflower/)
3.  [LineIn](http://rogueamoeba.com/freebies/)

GarageBand 应该不用多做介绍，大家都很熟悉了。

我这里着重介绍一下 Soundflower 和 LineIn。 Soundflower本质上是一个虚拟声卡，它可以作为输入，也可以作为输出。 而它的作用是为了把声音从一个应用传到另一个硬件里。

以我们podcast为例，我们需要用GarageBand录制Skype里其他成员的声音。所以我们需要把声音从Skype这个应用里传输到GarageBand里。 而做法实际上就是把Skype的输出从耳机换成虚拟的Soundflower设备, 而在GarageBand里把输入从话筒改为Soundflower。 这样当你同伴说话时，声音就传入GarageBand被录下来了。

但这样就会导致另外一个问题，我们GarageBand的输入被设置成了Soundflower这个虚拟设备。 这样虽然能录下来Skype里其他同伴的声音，但我们自己的声音就不能被GarageBand录到。 所以我们需要让我们自己的声音也进入Soundflower。

此时就需要LineIn登场了。LineIn的作用也十分简单，它能把一个输入设备的输入，直接在另一个输出设备中播放。举例来说， 你如果想通过耳机听到你自己在话筒里说话的声音， 那么你就可以把话筒作为输入，然后在你的耳机里播放。这样你自己就能听到自己说话了。

而这里我们需要把我话筒里的声音也转发到Soundflower里，这样GarageBand就能同时录制到我和我同伴的声音了。

问题还没有完全解决，虽然GarageBand能录到Soundflower里的声音。但是我们自己如何才能同时又听到Soundflower里的声音呢？ 方法也很简单，我们需要打开GarageBand的“监听器”，这样Soundflower里的声音就可以在耳机里被监听了。 当然这样仍然有点美中不足，那就是你说话的时候会听到自己声音的。Anyway, 这也不算个太大的缺点。多说两句话就能习惯了。

如果你对以上原理并无兴趣，没关系，你只要按照以下图示进行设置即可：

### Skype 声音设置：

![](/images/podcast_record_1.png)

### GarageBand 声音设置

![](/images/podcast_record_2.png)

### GarageBand 监听功能设置

![](/images/podcast_record_3.png)

### LineIn 设置

![](/images/podcast_record_4.png)

### 参考

-   [Recording a Skype Call for a Podcast for Free](http://umwdtlt.org/newmedia/recording-a-skype-call-for-a-podcast-for-free-mac/)
-   [Recording a Skype Call Using GarageBand, SoundFlower, and LineIn](http://digitalmediacookbook.com/recording-a-skype-call-using-garageband-soundflower-and-linein/)
