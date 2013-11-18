---
title: "A Refactor Session For Re-education In ThoughtWorks"
date: 2013-03-30 09:22 +08:00
tags: refactor 
author: terry
---

### 背景：

前段时间受成都社区Lite的邀请，参与了[Re-education](https://github.com/twers/re-education)的一些重构工作。这个项目是一个公益项目，它是一个老师的协作和交流平台，帮助老师更好的设计课程，从而让更多学校的学生受益。说来这也是我第一次参与公益项目的开发，也算是对公益事业尽一些绵薄之力吧。

这个项目目前已经上线[openclass.org](http://newclass.org/), 并且代码也已经[开源](https://github.com/twers/re-education)。

之前这个项目主要是由 ThoughWorks 成都的几个工程师在负责开发和设计。同样也非常敬佩他们对公益事业的热衷和支持。

整个重构过程有我，[Dingding](http://yedingding.com/), Soloara参与，目前Rails端的重构， 已经基本告一段落。 而后我要离开成都一段时间，所以离开之前在ThoughtWorks做了一个Presentation。总结了一下整个重构过程，希望能对整个项目组有一定的帮助。

BTW: 还要特别感谢 Dingding 同学做了一次 Live Show 讲解重构代码中的一些细节。此次[Live Show的视频](http://railscasts-china.com/episodes/refactor-openclass-by-dingding)也已经在[Railscasts-china](http://railscasts-china.com/)发布了。

Keynote：

    [https://speakerdeck.com/poshboytl/refactoring-re-education](https://speakerdeck.com/poshboytl/refactoring-re-education)

### 总结和解释：

其中有几点需要注意一下:

1.  一般在做重构的时候，特别是重构规模比较大的时候。通常内部接口是会发生变化的，所以unit tests通常是会failed的，而integration tests将是你正确重构下去的基础和保证。所以如果项目没有integration tests. 在重构之前添加上还是很有必要的。
2.  Rspec or Cucumber都是写 integration tests 不错的选择，这取决于你团队的爱好。我选择 Rspec + Capybara只是一个个人爱好问题。
3.  “Slim controllers, fat models” 这种提法在以前比较流行。但是已经越来越少有人提了，特别是“Fat models"。的确很多项目的model已经太fat, 需要通过各种方式来进行减肥。 Concern也好，抽出到lib也好，都是不错的选择。但是我相信 slim controllers 仍然是永恒不变的，且值得遵守的。
4.  最后我也提到了一些开源项目工作流程上的问题。里面有说 "Almost never push codes to master straightly. Create branch for every ticket.” 当时在讲到这里的时候引起了一些争论，主要争论点在给每个ticket建立branch有什么好处。我觉得好处主要还是更好利用pull request 做代码级别的沟通和review。更多相关的方法学可以参见Zack Holman的[presentation](http://zachholman.com/talk/how-github-uses-github-to-build-github/)。不光是开源项目，我们在[Pragmatic.ly](https://pragmatic.ly/)的开发中也是一直贯彻这种思想并且受益良多。

最后，希望它对你有所帮助。

Keep rocking…
