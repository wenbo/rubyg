#!/usr/local/bin/ruby -Ke
# <%= require_description 'NKF.nkf��Kconv', "kconv" %>
require 'kconv'
euc = "���꤬�Ȥ���NKF��"
# ����ʸ�������ɤ��դ���UTF-8���Ѵ����롣
utf8 = NKF.nkf("-Ew", euc)
# ����ʸ�������ɤ��¬����Shift_JIS���Ѵ����롣
sjis = NKF.nkf("-s", euc)
# String#kconv������ʸ�������ɤ��դ���JIS���Ѵ����롣
jis = euc.kconv(Kconv::JIS, Kconv::EUC)
# String#toXXX������ʸ�������ɤ��¬�����Ѵ����뤪��ڥ᥽�åɡ�
euc.tojis == jis    # => true
jis.toutf8 == utf8  # => true
# String#isXXX��ʸ�������ɤ��������򸡾ڤ��롣
euc.iseuc           # => true
sjis.isutf8         # => false
