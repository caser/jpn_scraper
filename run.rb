require 'rubygems'
require 'nokogiri'
require 'feedzirra'
require 'open-uri'
require_relative 'feed'
require_relative 'hiragana'
require_relative 'katakana'
require_relative 'link'
require_relative 'article'
require_relative 'yahoo_scraper'

url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
yahoo_domestic = Feed.new(url)

articles = []

yahoo_domestic.links.each do |link|
  scraper = YahooScraper.new(link)
  scraper.scrape_text
  article = Article.new(link, scraper.text)
  articles << article
end





=begin

scraper = Scraper.new(sample)

scraper.get_text

puts "\n"

scraper.create_kanji_hash

puts "Kanji hash: \n"

p scraper.kanji_hash

=end
