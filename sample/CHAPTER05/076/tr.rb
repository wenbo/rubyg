#!/usr/local/bin/ruby -Ke
# a→Aの置換を行う。
"abcde".tr("a", "A")      # => "Abcde"
# a→A、b→B、c→Cの置換を行う。
"abcde".tr("a-c", "A-C")  # => "ABCde"
# a→A、b→A、c→Aの置換を行う。
"abcde".tr("a-c", "A")    # => "AAAde"
# a→A、b→B、c→Bの置換を行う。
"abcde".tr("a-c", "AB")   # => "ABBde"
# bとcを削除する。
"abcde".tr("bc","")       # => "ade"
"abcde".delete("bc")      # => "ade"
# a以外を@に置換する
"abcde".tr("^a", "@")     # => "a@@@@"
# 数字の（いわゆる）半角全角変換の例
# ZENKAKU_NO[0] == '０' 〜 ZENKAKU_NO[9] == '９' なる配列を作成し、インデックスと対応付ける。
ZENKAKU_NO = %w[０ １ ２ ３ ４ ５ ６ ７ ８ ９]
# 全角数字に変換する。$&は半角数字1文字からなる文字列なので整数に変換する。
"1234".gsub(/[0-9]/){ ZENKAKU_NO[$&.to_i] }         # => "１２３４"
# 半角数字に変換する。$&は全角数字1文字からなる文字列で対応するインデックスを求める。
"１２３４".gsub(/[０-９]/){ ZENKAKU_NO.index($&) }  # => "1234"
# NKF.nkfでも全角→半角変換が可能。
require 'nkf'; NKF.nkf("-eZ", "１２３４")           # => "1234"
