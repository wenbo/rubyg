# -*- coding: euc-jp -*-
euc = "�狼�ᤴ�Ϥ�"
#������ǥå���0����3ʸ�������������������ʸ������֤���
euc2 = euc.dup; euc2.slice!(0,3)  # => "�狼��"
#������ǥå���0����3ʸ������������롣
euc2                              # => "���Ϥ�"
# ����ǥå���3��6���������
euc3 = euc.dup; euc3.slice!(3..6) # => "���Ϥ�"
euc3                              # => "�狼��"
# euc4��euc6��Ruby 1.8��Ʊ����
# Shift_JISʸ������롣
sjis = "�狼��".encode("Shift_JIS")
# ���󥳡��ǥ��󥰤��ۤʤ�Τǥ��顼�ˤʤ롣
euc.dup.tap {|euc7| euc7.slice(sjis)} rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
