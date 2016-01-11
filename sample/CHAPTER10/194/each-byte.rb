#!/usr/local/bin/ruby -Ke
# Ruby 1.8.6ではInteger#ordが定義されていないので定義する。
unless 1.respond_to? :ord
  class Integer;  def ord() self end;  end
end
File.read("sample.txt")         # => "abc日本語\n\n"
open("sample.txt") do |f|
# バイトを表す整数を表示する。
  f.each_byte {|b| print b, " " }
  puts
# ファイルポインタを先頭に戻す。
  f.rewind
  f.each_byte do |b|
    case b
# 文字で場合分けし、「b」が来たときに評価する。
    when ?b.ord then puts "bです。"
    end
  end
end
# >> 97 98 99 198 252 203 220 184 236 10 10 
# >> bです。
