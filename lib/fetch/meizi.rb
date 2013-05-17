#!/usr/bin/env ruby
require 'rss'
require 'open-uri'

url = 'http://feed.feedsky.com/meizitu'
open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  if feed.items.first.description =~ /src=\"(\S*)\"/
    p $1
  end
end