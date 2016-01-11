#!/usr/local/bin/ruby -Ke
# nkfライブラリにNKF.nkfが定義されているので読み込む。
require 'nkf'
euc = "るびぃすと"
# 同一オブジェクトならば当然==（同値）になる。
euc == euc          # => true
# Ruby 1.8では同じバイト列ならば==になる。
euc == "るびぃすと" # => true
# 別な文字コードにしたら当然バイト列は異なるので==にはならない。
sjis = NKF.nkf("-Es", euc)
euc == sjis         # => false

# HTTP < IMAP < SMTP < http < imap < smtp
# 文字列比較は文字コード順。
"HTTP" < "IMAP" && "IMAP" < "SMTP" && "SMTP" < "http" # => true
# ==は大文字小文字を区別する。
"SMTP" == "smtp"                                      # => false
# 「<=>」演算子は等しい場合に0、左が小さい場合は-1、左が大きい場合は1を返す。
"SMTP" <=> "SMTP"                                     # => 0
"HTTP" <=> "IMAP"                                     # => -1
"SMTP" <=> "IMAP"                                     # => 1
# 「String#casecmp」は「<=>」演算子と違って大文字小文字を区別しない。
[ "SMTP" <=> "smtp",  "SMTP".casecmp("smtp")]         # => [-1, 0]
[ "HTTP" <=> "imap",  "HTTP".casecmp("imap")]         # => [-1, -1]
[ "SMTP" <=> "imap",  "SMTP".casecmp("imap")]         # => [-1, 1]
# 大文字小文字を無視して等しい文字列ならば「OK」と表示する。
if "SMTP".casecmp("SMTP") == 0
  puts "OK"
end
# >> OK
