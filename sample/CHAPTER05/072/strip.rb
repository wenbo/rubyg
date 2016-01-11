#!/usr/local/bin/ruby -Ke
# 先頭と末尾の空白文字を取り除いた文字列を作成する。
" Hello ".strip                # => "Hello"
# 先頭の空白文字のみ取り除いた文字列を作成する。
" Hello ".lstrip               # => "Hello "
# 末尾の空白文字のみ取り除いた文字列を作成する。
" Hello ".rstrip               # => " Hello"
# 破壊的に取り除く。
" Hello ".strip!               # => "Hello"
# スペース以外にもタブ（\t）、キャリッジリターン（\r）、改行（\n）、^L（\f）、^K（\v）、末尾のヌル文字（\0）も取り除く。
"\0 Hello \t\r\n\f\v\0".strip  # => "\x00 Hello"
# ただし、いわゆる全角空白は取り除かない。
"全角空白→　".strip           # => "全角空白→　"
