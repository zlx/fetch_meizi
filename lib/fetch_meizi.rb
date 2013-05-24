#!/usr/bin/env ruby
require 'rss'
require 'nokogiri'
require 'open-uri'

class Meizi
  
  def self.fetch
    open("http://feed.feedsky.com/meizitu") do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
        if item.description =~ /src=\"(\S*)\"/
          @image_url = $1
          break if image_url_avaliable?
        end
      end
      @image_url
    end
  end

  def self.fetch_qingchun
    meizi_list = Nokogiri::HTML open("http://www.chunluoli.com/qingchun")
    random_url = meizi_list.search("a.img").to_a.sample.attr("href")

    meizi = Nokogiri::HTML open(random_url)
    meizi.search("div.pageImg p img").attr("src").value
  end
  
  private
  def self.image_url_avaliable?
    res = Net::HTTP.get_response(URI(@image_url))
    res['content-type'].match(/image\/(jpeg|png|)/)
  end
  
end
