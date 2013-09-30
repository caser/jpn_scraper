#!/bin/env ruby
# encoding: utf-8
class Hiragana

 attr_accessor :list

  def initialize

    @list = self.create_hiragana_list

  end

  def create_hiragana_list

    list = ['ア', 'イ', 'ウ', 'エ', 'オ', 
    'カ', 'キ', 'ク', 'ケ', 'コ', 
    'サ', 'シ', 'ス', 'セ', 'ソ', 
    'タ', 'チ', 'ツ', 'テ', 'ト', 
    'ナ', 'ニ', 'ヌ', 'ネ', 'ノ', 
    'ハ', 'ヒ', 'フ', 'ヘ', 'ホ', 
    'マ', 'ミ', 'ム', 'メ', 'モ', 
    'ヤ',      'ユ',      'ヨ', 
    'ラ', 'リ', 'ル', 'レ', 'ロ', 
    'ワ', 'ヰ',      'ヱ', 'ヲ', 
                        'ン',
    'ガ', 'ギ', 'グ', 'ゲ', 'ゴ', 
    'ザ', 'ジ', 'ズ', 'ゼ', 'ゾ', 
    'ダ', 'ヂ', 'ヅ', 'デ', 'ド', 
    'バ', 'ビ', 'ブ', 'ベ', 'ボ', 
    'パ', 'ピ', 'プ', 'ペ', 'ポ', 
 
    'ァ', 'ィ', 'ゥ', 'ェ', 'ォ', 
    'ー']

    return list

  end
  
end