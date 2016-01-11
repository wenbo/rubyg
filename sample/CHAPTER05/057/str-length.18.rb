#!/usr/local/bin/ruby -Ke
# <%= require_description 'String#toutf8', "kconv" %>
require 'kconv'
# 日本語を含まない文字列はバイト数＝文字数である。
"abcdef".length     # => 6
# EUC-JPでは漢字は2バイトなので6バイトになる。
ja = "日本語"
ja.length           # => 6
ja.size             # => 6
# UTF-8では漢字は3バイトなので9バイトになる。
ja.toutf8.length    # => 9
# 文字数を得るには「split(//).length」、「scan(/./).length」のイディオムを使う。
ja.split(//).length # => 3
ja.scan(/./).length # => 3
# Ruby 1.8.7以降で使える効率的なイディオム。
ja.chars.count      # => 3
