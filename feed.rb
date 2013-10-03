require 'rubygems'
require 'feedzirra'
require_relative 'link'

class Feed

  attr_accessor :feed, :title, :url

  def initialize(feed_url)

    @feed = Feedzirra::Feed.fetch_and_parse(feed_url)

    @title = @feed.title
    @url = @feed.url

  end

  def links

    links = []

    @feed.entries.each do |entry|
      source = @feed.title
      link = Link.new(entry, source)
      links << link
    end

    return links

  end

end

