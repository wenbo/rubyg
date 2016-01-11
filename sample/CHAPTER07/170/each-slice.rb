#!/usr/local/bin/ruby -Ke
# enumeratorライブラリにEnumeratorが定義されているので読み込む。Ruby 1.8.7以降では組み込みになるので不要。
require 'enumerator'
# 目次データは章タイトルとページ数の組を並べる。
contents = [
  "はじめに", 1,
  "Rubyの基礎知識", 2,
  "基本的なツール", 20,         # 配列の最後の要素を「,」で終えられる
]
# 2要素ずつループする。
contents.each_slice(2) do |chapter, page|
  puts "#{chapter} p#{page}"
end
# >> はじめに p1
# >> Rubyの基礎知識 p2
# >> 基本的なツール p20
