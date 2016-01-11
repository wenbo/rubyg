#!/usr/local/bin/ruby -Ke
# kconvライブラリにKconvが定義されているので読み込む。
require 'kconv'
# Ruby 1.8のKconv.guessは整数で返すのでシンボルを返すメソッドを自作する。
class String
  def guess_encoding
    case Kconv.guess(self)
    when Kconv::ASCII   then :ASCII
    when Kconv::BINARY  then :BINARY
    when Kconv::EUC     then :EUC
    when Kconv::JIS     then :JIS
    when Kconv::SJIS    then :SJIS
    when Kconv::UTF16   then :UTF16
    when Kconv::UTF32   then :UTF32
    when Kconv::UTF8    then :UTF8
    when Kconv::UNKNOWN then :UNKNOWN
    else raise "unexpected input"
    end
  end
end
euc = "定数よりもシンボルを返してほしい。"
sjis = NKF.nkf("-Es", euc)
utf8 = NKF.nkf("-Ew", euc)
# シンボルを返すようになった。
euc.guess_encoding      # => :EUC
sjis.guess_encoding     # => :SJIS
utf8.guess_encoding     # => :UTF8
"ascii".guess_encoding  # => :ASCII
