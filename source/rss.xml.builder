# -*- coding: utf-8 -*-
xml.instruct!
xml.rss "xmlns:atom" => "http://www.w3.org/2005/Atom", "version" => "2.0" do
  xml.channel do
    xml.id "http://terrytai.com"
    xml.title "Terr Tai's Blog"
    xml.link "http://terrytai.com"
    xml.language "zh-cn"
    xml.copyright "&#x2117; &amp; &#xA9; #{Time.now.year} Terry Tai"
    xml.link "href" => "http://terrytai.com"
    xml.link "href" => "http://terrytai.com/rss.xml", "rel" => "self"
    xml.updated blog.articles.first.date.to_time.iso8601
    xml.lastBuildDate blog.articles.first.date.to_time.iso8601
    xml.pubDate blog.articles.first.date.to_time.iso8601
    xml.description "Terry Tai is on his way!"
    xml.author { xml.name "Terry Tai" }

    blog.articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link "http://terrytai.com#{article.url}"
        xml.description article.body, "type" => "html"
        xml.guid "tag:terrytai.com,article.url"
        xml.pubDate article.date.to_time.iso8601
        xml.category article.tags.join(', ')
      end
    end
  end
end
