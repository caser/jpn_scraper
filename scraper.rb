require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Online development
# sample = "http://headlines.yahoo.co.jp/hl?a=20130929-00000106-economic-bus_all"

# Offline development
sample = "./pages/page1.html"

class Scraper

  attr_reader :url
  attr_reader :page
  attr_reader :title
  attr_accessor :text
  attr_reader :kanji_hash

  def initialize(url)

    @url = url
    @kanji_hash = {}

    # Offline
    @page = Nokogiri::HTML(open(@url))

    # Online
    # @page = Nokogiri::HTML(open(@url).read)

  end

  def get_text

    # Get the text of the article from <p> tag of class="ynDetailText"
    @text = @page.css("p.ynDetailText").text

  end

  def create_kanji_hash

    # Cycle through all characters in the string and add them to the hash if they are kanji
    @text.each_char do |char|

      if is_a_kanji?(char)

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

  def is_a_kanji?(char)

    kanji = true

    if !is_a_word_char?(char) ; return false ; end

    if is_romaji?(char) ; return false ; end

    kanji

  end

  def is_romaji?(char)

    char =~ /[a-zA-Z]/

  end

  def is_a_word_char?(char)

    char =~ /\p{Word}+/u
    # string.gsub!("/[^a-zA-Z]/u", "")

  end

end



scraper = Scraper.new(sample)

scraper.get_text

puts "\n"

scraper.create_kanji_hash

puts "Kanji hash: \n"

p scraper.kanji_hash

