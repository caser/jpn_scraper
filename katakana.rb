#!/bin/env ruby
# encoding: utf-8
class Katakana

  attr_accessor :list

  def initialize

    @list = self.create_katakana_list

  end

  def create_katakana_list

    list = ['あ', 'い', 'う', 'え', 'お',
    'か', 'き', 'く', 'け', 'こ',
    'さ', 'し', 'す', 'せ', 'そ',
    'た', 'ち', 'つ', 'て', 'と',
    'な', 'に', 'ぬ', 'ね', 'の',
    'は', 'ひ', 'ふ', 'へ', 'ほ',
    'ま', 'み', 'む', 'め', 'も',
    'や',      'ゆ',      'よ',
    'ら', 'り', 'る', 'れ', 'ろ',
    'わ', 'ゐ',      'ゑ', 'を',
                        'ん',
    'が', 'ぎ', 'ぐ', 'げ', 'ご',
    'ざ', 'じ', 'ず', 'ぜ', 'ぞ',
    'だ', 'ぢ', 'づ', 'で', 'ど',
    'ば', 'び', 'ぶ', 'べ', 'ぼ',
    'ぱ', 'ぴ', 'ぷ', 'ぺ', 'ぽ',
 
    'ぁ', 'ぃ', 'ぅ', 'ぇ', 'ぉ']

    return list

  end
  
end
