# -*- coding: utf-8 -*-
require 'kconv'

# Shift_JISで書かれたファイルを読み込み、
# エンコーディングと実際の文字コードを返す関数
def read_test(external, internal=nil)
  open("sjis.txt") do |f|
# IOエンコーディングを設定する。
    f.set_encoding external, internal
# 外部エンコーディングと内部エンコーディングが設定されていればこの時点でエンコーディング変換される。
    s = f.read
# 両者が等しくないとエンコーディングを誤認していることになる。
    [ s.encoding, Kconv.guess(s) ]
  end
end

# ロケールエンコーディング＝default_externalはEUC-JP。
Encoding.default_external  # => #<Encoding:EUC-JP>
Encoding.find("locale")    # => #<Encoding:EUC-JP>
# エンコーディングを指定しない場合はdefault_externalで読み込まれるため、誤認する。
read_test nil, nil         # => [#<Encoding:EUC-JP>, #<Encoding:Shift_JIS>]
# default_externalとは異なるエンコーディングのファイルを読み込むときは外部エンコーディングを明示的に指定する必要がある。
read_test "Shift_JIS"      # => [#<Encoding:Shift_JIS>, #<Encoding:Shift_JIS>]
# 内部エンコーディングをUTF-8に指定しているため、UTF-8に変換される。
read_test "Shift_JIS", "UTF-8"       # => [#<Encoding:UTF-8>, #<Encoding:UTF-8>]
read_test "Shift_JIS", __ENCODING__  # => [#<Encoding:UTF-8>, #<Encoding:UTF-8>]
# 虚偽の外部エンコーディングを設定すると、当然誤認してしまう。
read_test "UTF-8"                    # => [#<Encoding:UTF-8>, #<Encoding:Shift_JIS>]
# UTF-8→Shift_JISの変換を指示しているが、虚偽の外部エンコーディングのためエラー。
read_test "UTF-8", "Shift_JIS" rescue $!
# => #<Encoding::InvalidByteSequenceError: "\x93" on UTF-8>
# 内部エンコーディングのみを指定することはできない。
read_test nil, "UTF-8" rescue $! # => #<TypeError: can't convert nil into String>
