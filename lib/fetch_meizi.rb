#!/usr/bin/env ruby
require 'rss'
require 'nokogiri'
require 'open-uri'

class Meizi
  
  def self.fetch
    open("http://feed.feedsky.com/meizitu") do |rss|
      feed = RSS::Parser.parse(rss)
      $1 if feed.items.first.description =~ /src=\"(\S*)\"/
    end
  rescue
    "http://www.chunluoli.com/wp-content/uploads/2013/03/3b9d7c910e297d56bbfecfbe9391e420.jpg"
  end

  def self.fetch_qingchun
    meizi_list = Nokogiri::HTML open("http://www.chunluoli.com/qingchun")
    random_url = meizi_list.search("a.img").to_a.sample.attr("href")

    meizi = Nokogiri::HTML open(random_url)
    meizi.search("div.pageImg p img").attr("src").value
  rescue
    "http://www.chunluoli.com/wp-content/uploads/2013/03/3b9d7c910e297d56bbfecfbe9391e420.jpg"
  end
  
end
