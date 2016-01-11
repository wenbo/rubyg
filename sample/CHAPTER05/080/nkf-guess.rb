#!/usr/local/bin/ruby -Ke
# kconv�饤�֥���Kconv���������Ƥ���Τ��ɤ߹��ࡣ
require 'kconv'
# Ruby 1.8��Kconv.guess���������֤��Τǥ���ܥ���֤��᥽�åɤ򼫺�롣
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
euc = "������⥷��ܥ���֤��Ƥۤ�����"
sjis = NKF.nkf("-Es", euc)
utf8 = NKF.nkf("-Ew", euc)
# ����ܥ���֤��褦�ˤʤä���
euc.guess_encoding      # => :EUC
sjis.guess_encoding     # => :SJIS
utf8.guess_encoding     # => :UTF8
"ascii".guess_encoding  # => :ASCII
