# -*- coding: euc-jp -*-
euc = "��Ӥ�����"
# Ʊ���Х����󤫤�Ʊ�����󥳡��ǥ��󥰤Ǥ������==�ˤʤ롣
euc == "��Ӥ�����"                             # => true
euc == euc.encode("Shift_JIS")                  # => false
# Ʊ���Х������ǰۤʤ륨�󥳡��ǥ��󥰤���==�ˤϤʤ�ʤ������ξ���EUC-JPʸ�����Shift_JIS�Ȥߤʤ��Ƥ��롣
euc == euc.dup.force_encoding("Shift_JIS")      # => false
# �ۤʤ륨�󥳡��ǥ��󥰤�ʸ������Ӥϵ�����Ƥ��롣
euc <=> euc.dup.force_encoding("Shift_JIS")     # => -1
euc <=> euc.encode("Shift_JIS")                 # => 1
# ASCIIʸ����������ʤ�ʸ����ϥ��󥳡��ǥ��󥰤��ۤʤäƤ�==�ˤʤ롣
"a".encode("Shift_JIS") == "a".encode("UTF-8")  # => true
