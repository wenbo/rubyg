#!/usr/local/bin/ruby -Ke
# 2行にわたる文字列。
multstr = "From: root@example.com\nTo: rubikitch@ruby-lang.org\n"
# 行ごとに繰り返す。
multstr.each_line {|line| puts "each_line: #{line}" }
# 「split(//)」、「scan(/./)」は文字ごとに分割する旧来のイディオム。
"アプリケーション".split(//)  # => ["ア", "プ", "リ", "ケ", "ー", "シ", "ョ", "ン"]
"アプリケーション".scan(/./)  # => ["ア", "プ", "リ", "ケ", "ー", "シ", "ョ", "ン"]
# >> each_line: From: root@example.com
# >> each_line: To: rubikitch@ruby-lang.org
