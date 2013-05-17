#!/usr/bin/env ruby
require 'rss'
require 'open-uri'

class Meizi
  
  URL = 'http://feed.feedsky.com/meizitu'
  
  def self.fetch
    open(URL) do |rss|
      feed = RSS::Parser.parse(rss)
      $1 if feed.items.first.description =~ /src=\"(\S*)\"/
    end
  end
  
end

p Meizi.fetch