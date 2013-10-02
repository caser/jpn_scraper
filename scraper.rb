require 'rubygems'
require 'nokogiri'
require 'open-uri'
require_relative 'feed'
require_relative 'hiragana'
require_relative 'katakana'
require_relative 'link'

# Online development
# sample = "http://headlines.yahoo.co.jp/hl?a=20130929-00000106-economic-bus_all"

# Offline development
sample = "./pages/page1.html"

class Scraper

  attr_reader :url
  attr_reader :page
  attr_reader :title
  attr_accessor :text
  attr_reader :length
  attr_reader :kanji_hash
  attr_accessor :link

  def initialize(link)

    @link = link
    @url = @link.url
    @kanji_hash = {}

    # Offline
    @page = Nokogiri::HTML(open(@url))
    # Online
    # @page = Nokogiri::HTML(open(@url).read)
    
  end

  # Get the article text from the URL

  def get_text

    # Get the text of the article from <p> tag of class="ynDetailText"
    @text = @page.css("p.ynDetailText").text

  end

  # Create a hash which stores the kanji characters as a key and each character's frequency as a value
  def create_kanji_hash

    # Cycle through all characters in the string and add them to the hash if they are kanji
    @text.each_char do |char|
      # Check if the character in the article is a kanji
      if is_kanji?(char)
        # Add character to hash or increase the kanji count for an existing entry
        unless @kanji_hash[char]
          @kanji_hash[char] = 1
        else
          @kanji_hash[char] += 1
        end
      else
        next
      end
    end

  end

  def is_kanji?(char)

    kanji = true

    # Check if character is a non-word character (.,=- etc.)
    if !is_a_word_char?(char) ; kanji = false ; end
    # Check if character is romaji (abcdefg etc.)
    if is_romaji?(char) ; kanji = false ; end
    # Check if the character is a hiragana
    if is_hiragana?(char) ; kanji = false ; end
    # Check if the character is a katakana
    if is_katakana?(char) ; kanji = false ; end
    # Check if the character is a number
    if is_number?(char) ; kanji = false ; end

    return kanji

  end

  def is_hiragana?(char)

    hiragana = Hiragana.new

    # Check if character is included in a list of hiragana
    hiragana.list.include?(char)

  end

  def is_katakana?(char)

    katakana = Katakana.new

    # Check if character is included in a list of katakana
    katakana.list.include?(char)

  end

  def is_romaji?(char)

    # Matches if char is a letter from the English alphabet
    char =~ /[a-zA-Z]/

  end

  def is_a_word_char?(char)

    # Matches if char is a non-word character (.,-= etc)
    char =~ /\p{Word}+/u

  end

  def is_number?(char)

    # Matches if char is a number
    char =~ /[0-9]/

  end

end

url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
yahoo_domestic = Feed.new(url)

links = []
yahoo_domestic.feed.entries.each do |entry|
  source = yahoo_domestic.title
  link = Link.new(entry, source)
  links << link
end

puts links.inspect

=begin

scraper = Scraper.new(sample)

scraper.get_text

puts "\n"

scraper.create_kanji_hash

puts "Kanji hash: \n"

p scraper.kanji_hash

=end
