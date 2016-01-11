#!/usr/local/bin/ruby -Ke
# 大文字小文字を無視する。
"Alice" =~ /^alice/             # => nil
"Alice" =~ /^alicE/i            # => 0
# 複数行文字列にはmを忘れないように。
"abc\ndef\nghi\n" =~ /a.c.def/   # => nil
"abc\ndef\nghi\n" =~ /a.c.def/m  # => 0

# oオプションのベンチマーク
require 'benchmark'
a="a"
# 式展開つき正規表現を100000回評価するのにかかった秒数を計測する。このように式の結果が一定のときは高速化が図れる。
Benchmark.measure{ 100000.times{ /#{a}/ }}.total   # => 0.59
Benchmark.measure{ 100000.times{ /#{a}/o }}.total  # => 0.0299999999999999
# oオプションの誤用例
["foo","bar"].map{|s| /#{s}/ }            # => [/foo/, /bar/]
["foo","bar"].map{|s| /#{s}/o }           # => [/foo/, /foo/]
["foo","bar"].map{|s| "foo" =~ /#{s}/o }  # => [0, 0]

# いろいろな文字コードで正規表現にマッチさせる例
require 'kconv'
euc  = "こんにちは、世界。こんにちは、Ruby。".toeuc
sjis = euc.tosjis
utf8 = euc.toutf8
hello = "世界。こんにちは"
euc =~ /#{hello.toeuc}/      # => 12
# この行を実行すると「-:26: premature end of regular expression: ... (RegexpError)」というエラーが出てしまう。
# sjis =~ /#{hello.tosjis}/
# 文字コードが食い違うと本来ならばマッチするはずの正規表現がマッチしなくなることも。
utf8 =~ /#{hello.toutf8}/s   # => nil
# 文字コード指定オプションをつける。
sjis =~ /#{hello.tosjis}/s   # => 12
utf8 =~ /#{hello.toutf8}/u   # => 18
