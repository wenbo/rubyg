#!/usr/local/bin/ruby -Ke
restr = "名前:.+商品名:.+"
# 正規表現文字列をRegexpに変換する。両者は等価。
Regexp.new(restr)   # => /名前:.+商品名:.+/
/#{restr}/          # => /名前:.+商品名:.+/
# 大文字小文字を区別せず、かつ複数行モード、さらにEUC-JP文字コードのRegexpを作成する。両者は等価。
re_im = Regexp.new(restr, Regexp::IGNORECASE | Regexp::MULTILINE, "e") # => /名前:.+商品名:.+/mie
/#{restr}/mie       # => /名前:.+商品名:.+/mie
# Regexp.newにRegexpを与えたときは複製する。オプションや文字コードはそのまま。
Regexp.new(re_im)   # => /名前:.+商品名:.+/mie
