# -*- coding: euc-jp -*-
euc = "�å���ѥ���"
# ����ǥå���1��ľ���ˡ�++�פ��������롣
euc1 = euc.dup; euc1.insert 1, "++" # => "��++����ѥ���"
euc1                                # => "��++����ѥ���"
# �̲�
euc2 = euc.dup; euc2[1,0] = "++"    # => "++"
euc2                                # => "��++����ѥ���"
# ���󥳡��ǥ��󥰤��ۤʤ�Τǥ��顼�ˤʤ롣
euc3 = euc.dup
sjis = "����".encode("Shift_JIS")
euc3.insert 1, sjis rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
