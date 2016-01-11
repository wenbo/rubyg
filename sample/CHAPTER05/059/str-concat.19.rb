# -*- coding: euc-jp -*-
euc1 = "��Ӥ�"
euc2 = "�Ϥä���"
# ���󥳡��ǥ��󥰤�Ʊ������̵���˷��Ǥ��롣
euc1 + euc2     # => "��Ӥ��Ϥä���"
# euc2��Shift_JIS���Ѵ����롣
sjis = euc2.encode("Shift_JIS")
# ���󥳡��ǥ��󥰤��ۤʤ���Ϸ��Ǥ��ʤ���
(euc1 + sjis) rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
# ASCIIʸ������ʤ�ʸ����ϥ��󥳡��ǥ��󥰤��ۤʤäƤ��Ƥ���Ǥ��롣
ascii = "!!".force_encoding("UTF-8")
ascii.encoding  # => #<Encoding:UTF-8>
euc1 + ascii    # => "��Ӥ�!!"
