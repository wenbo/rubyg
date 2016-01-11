# -*- coding: euc-jp -*-
# i、m、oオプションは共通
# いろいろなエンコーディングで正規表現にマッチさせる例
euc  = "こんにちは、世界。こんにちは、Ruby。"
sjis = euc.encode "Shift_JIS"
utf8 = euc.encode "UTF-8"
hello = "世界。こんにちは"
# EUCをデフォルトの文字コードとする。
euc =~ /#{hello}/      # => 6
# 正規表現文字列のエンコーディングが正規表現のエンコーディングになるのでマッチする。
/#{hello.encode("Shift_JIS")}/.encoding  # => #<Encoding:Shift_JIS>
sjis =~ /#{hello.encode("Shift_JIS")}/   # => 6
utf8 =~ /#{hello.encode("UTF-8")}/       # => 6
