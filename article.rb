# encoding: utf-8

class Article

  attr_accessor :text, :kanji_hash, :url, :source, :title
  attr_accessor :date, :category, :length

  def initialize(link, text)

    # Initialize variables from the link object
    @url = link.url
    @source = link.source
    @date = link.date
    @title = link.title
    @category = link.category

    @text = text
    @length = @text.length

    # Create empty  hash to store kanji & their frequency
    @kanji_hash = {}

    self.create_kanji_hash

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
    char =~ /[０-９]/

  end

end