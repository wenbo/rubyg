# -*- coding: euc-jp -*-
require 'kconv'
euc = "���꤬�Ȥ���NKF��"
# String#encode��JIS���Ѵ����롣�����������󥳡��ǥ���̾��iso-2022-jp����ʸ���Ǥ�ġˤȤ���ɬ�פ����롣
jis = euc.encode "iso-2022-jp"
jis.encoding   # => #<Encoding:ISO-2022-JP (dummy)>
# ��ʬ���ȤΥ��󥳡��ǥ��󥰤��Ѥ���ˤ�String#encode!��Ȥ���
sjis = euc.dup.encode! "Shift_JIS"
sjis.encoding  # => #<Encoding:Shift_JIS>
# NKF��Kconv���Ѵ��������ϥ��󥳡��ǥ��󥰤��ѹ����Ƥ���롣
utf8 = NKF.nkf("-Ew", euc)
utf8.encoding  # => #<Encoding:UTF-8>
