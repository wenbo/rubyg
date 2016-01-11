# -*- coding: euc-jp -*-
require 'kconv'
euc = "Ruby 1.9�ʤ�д�ñ��"
sjis = euc.encode "Shift_JIS"
utf8 = euc.encode "UTF-8"
# ��¬����ȡ���̤�Encoding���֤äƤ��롣
Kconv.guess(euc)      # => #<Encoding:EUC-JP>
Kconv.guess(sjis)     # => #<Encoding:Shift_JIS>
Kconv.guess(utf8)     # => #<Encoding:UTF-8>
Kconv.guess("ascii")  # => #<Encoding:US-ASCII>
# NKF.guess��Ȥ��롣
NKF.guess(utf8)       # => #<Encoding:UTF-8>
# EUC-JP�ΥХ�������Ф������󥳡��ǥ��󥰤��٤���
lie = euc.dup.force_encoding "Shift_JIS"
# �����ޤǥХ�����ǿ�¬���롣
Kconv.guess(lie)      # => #<Encoding:EUC-JP>
# ��¬��������ʤΤ�ʸ����Υ��󥳡��ǥ��󥰤��Ѥ��ʤ���
lie.encoding          # => #<Encoding:Shift_JIS>
# ���󥳡��ǥ��󥰿�¬��̤�ʸ���󥨥󥳡��ǥ��󥰤����ꤹ�롣
lie.force_encoding Kconv.guess(lie)
lie.encoding          # => #<Encoding:EUC-JP>
