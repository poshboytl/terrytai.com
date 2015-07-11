---
title: "Ruby 基础篇之如何山寨 require 和 load"
date: 2013-04-26 09:22 +08:00
tags: ruby, require, load
author: terry
---

![](/images/shanzhai.jpg)

前几天被一个初学 Ruby 的同学问及 require 和 load 有什么区别。后来想想这个问题虽然答案并不难，但是还可以引申出不少可以探讨的内容。所以我打算通过山寨一个 require 和 load 的方法的形式，来阐述一些内容。

在开始之前我们首先假设我们有一个 person.rb 文件，内容如下:

    class Person

      attr_reader :name, :age

      def initialize(name, age)
        @name = name
        @age = age
      end

      def to_s
        "My name is #{name} and I'm #{age} years old!"
      end

    end

    person = Person.new("金将军", 30)
    puts person.to_s

## 先来山寨 load

先让我们来做做试验。

    # -*- coding: utf-8 -*-
    # try_load_require.rb

    load './person.rb'
    load './person.rb'

    $ ruby try_load_require.rb
    My name is 金将军 and I'm 30 years old!
    My name is 金将军 and I'm 30 years old!

我们这里调用了 两次 load ，发现 person.rb 被调用了两次。这说明 load 是不会判断文件是否已经加载，只是简单的加载并运行了内容。

换言之我们可以自己山寨一个 load 方法来达到同样的目的：

    # -*- coding: utf-8 -*-
    # try_load_require.rb

    def load(file_with_path)
      puts "这是山寨load()"
      eval File.read(file_with_path)
    end

    load './person.rb'
    load './person.rb'

其实如果你细心看过 load 方法的文档的话你会发现 load 实际上是可以接受第二个参数的，并且这个方法的返回值恒定为 true

    load(filename, wrap=false) #=> true

wrap 参数到底有什么用？我们需要重新来做一个试验：

    # -*- coding: utf-8 -*-
    # try_load_require.rb

    def check_person_defined
      begin
        puts "Person class is defined" if Person
      rescue NameError
        puts  "Person class is not defined"
      end
    end

    load './person.rb', true
    check_person_defined

    load './person.rb'
    check_person_defined

而输出结果是：

    ruby try_load_require.rb
    My name is 金将军 and I'm 30 years old!
    Person class is not defined
    My name is 金将军 and I'm 30 years old!
    Person class is defined

这说明当我们调用 load 时把第二个参数设为 true，虽然执行了 person.rb 的代码，但是 Person 的定义并不能在当前作用域起作用。那可以通过在一个匿名的作用域来执行person就可以达到相同效果了。所以我们可以继续做更完整的做如下山寨：

    def load(file_with_path, warp = false)
      puts "这是山寨load()"
      if warp
        Module.new.module_eval(File.read(file_with_path))
      else
        eval File.read(file_with_path)
      end
      true
    end

## 接下来山寨 require

用同样的方法我们来测试一下 require

    # -*- coding: utf-8 -*-
    # try_load_require.rb

    require './person.rb' #=> true
    require './person.rb' #=> false

而输出结果是：

    $ ruby try_load_require.rb
    My name is 金将军 and I'm 30 years old!

这说明 require 是会判断文件是否已经被加载，如果被加载的话是不会再进行重复加载的。并且第一次加载成功会返回 true，如果判断为重复加载会返回 false。

知道这个简单的规则后，我们就可以做如下山寨了并且会用到我们刚刚的山寨 load 哟 :)

    $required_files = []

    def require(file_with_path)
      puts "这是山寨require()"
      full_path = File.expand_path(file_with_path)
      if $required_files.include?(full_path)
        return false
      else
        $required_files << full_path
        load(full_path)
        return true
      end
    end

怎么样, 简单吧？ 希望通过这个简单的山寨能让初学的朋友能更好的理解和记忆 require 和 load 的区别。

那什么时候用 load 什么时候用 require 呢？在大多数情况下我们都是使用 require 的。但是有些时候需要多次加载一个变化的文件，比如像 Rails 的 development 模式的 server 启起来以后，需要再次加载改变的源文件那么就需要用到 load (或者 autoload, 以后会谈到)。

以后我还会写一系列的针对 Ruby 基础知识的文章，敬请期待哟. :)

BTW, 最近我建立了一个 Ruby/Rails 学习QQ群 231618869，学习 Ruby/Rails 的同学可以在这里交流经验和你遇到的问题哟。
