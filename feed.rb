require 'rubygems'
require 'feedzirra'

class Feed

  attr_accessor :feed, :title, :url

  def initialize(feed_url)

    @feed = Feedzirra::Feed.fetch_and_parse(feed_url)

    @title = @feed.title
    @url = @feed.url
    
  end

end

