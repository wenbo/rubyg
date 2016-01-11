#!/usr/local/bin/ruby -Ke
# 「scan(/./)」、「split(//)」、「chars.to_a」（Ruby 1.8.7以降）は1文字ずつに分割するイディオム。
"<こんにちは>".scan(/./)   # => ["<", "こ", "ん", "に", "ち", "は", ">"]
"<こんにちは>".split(//)   # => ["<", "こ", "ん", "に", "ち", "は", ">"]
"<こんにちは>".chars.to_a  # => ["<", "こ", "ん", "に", "ち", "は", ">"]

header = <<EOH
From: rubikitch@ruby-lang.org
To: ruby-list@ruby-lang.org
Reply-To: ruby-list@ruby-lang.org
Subject: I love Ruby!
EOH
# マッチしない正規表現の場合は空配列が返る。
header.scan(/no match/)         # => []
# 正規表現にマッチした部分の配列を得る。
header.scan(/^.+ruby-list.+$/)
# => ["To: ruby-list@ruby-lang.org", "Reply-To: ruby-list@ruby-lang.org"]
# ()付き正規表現の場合はキャプチャの配列の配列が返る。
header.scan(/^(\S+): (.+)$/)
# => [["From", "rubikitch@ruby-lang.org"],
#     ["To", "ruby-list@ruby-lang.org"],
#     ["Reply-To", "ruby-list@ruby-lang.org"],
#     ["Subject", "I love Ruby!"]]
# キャプチャだけでなく、正規表現にマッチした部分も欲しければ、正規表現全体を()で囲む。
header.scan(/(^(\S+): (.+)$)/)
# => [["From: rubikitch@ruby-lang.org", "From", "rubikitch@ruby-lang.org"],
#     ["To: ruby-list@ruby-lang.org", "To", "ruby-list@ruby-lang.org"],
#     ["Reply-To: ruby-list@ruby-lang.org", "Reply-To", "ruby-list@ruby-lang.org"],
#     ["Subject: I love Ruby!", "Subject", "I love Ruby!"]]
# ()がひとつのみの場合、かなりの頻度で((:Array#flatten:))と併用される。
header.scan(/^(.+):/)          # => [["From"], ["To"], ["Reply-To"], ["Subject"]]
header.scan(/^(.+):/).flatten  # => ["From", "To", "Reply-To", "Subject"]
# ブロックをつければマッチごとにブロックを評価する。
header.scan(/^(\S+): (.+)$/) do |name, value|
  puts "送信アドレスは#{value}です。" if name == "From"
end
# >> 送信アドレスはrubikitch@ruby-lang.orgです。
