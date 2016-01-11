#!/usr/local/bin/ruby -Ke
multstr = "From: root@example.com\nTo: rubikitch@ruby-lang.org\n"
# 行ごとに繰り返すEnumeratorが作成される。
multstr.lines      # => #<Enumerator: "From: root@example.com\nTo: rubikitch@ruby-lang.org\n":lines>
# Enumeratorは「each」、「map」、「to_a」などのEnumerableのメソッドが使える。
multstr.lines.each {|line| puts "lines.each: #{line}" }
# バイトごとに繰り返すEnumeratorを作成し、それを((:Enumerator#to_a:))で配列化する。
"abc".bytes.to_a              # => [97, 98, 99]
# Ruby 1.8.7以降で文字ごとに分割する効率的なイディオム。
"アプリケーション".chars.to_a # => ["ア", "プ", "リ", "ケ", "ー", "シ", "ョ", "ン"]
# >> lines.each: From: root@example.com
# >> lines.each: To: rubikitch@ruby-lang.org
