# -*- coding: euc-jp -*-
euc = "����������"
# <%=idx "0��3" %>������ԡפ˽񤭴����롣
euc2 = euc.dup; euc2[0,3] = "����"; euc2  # => "���������"
# <%=idx "3��6" %>��ֻ���ԡפ˽񤭴����롣((:Object#tap:))��Ȥ��ȴʷ�˽񤱤롣
euc.dup.tap {|euc3| euc3[3..6] = "�����"}  # => "����Ի����"
# euc4��euc6��Ruby 1.8��Ʊ�͡�

# Shift_JISʸ������롣
sjis = "�Ǥ��衣".encode("Shift_JIS")
# Shift_JISʸ������֤������褦�Ȥ���ȥ��󥳡��ǥ��󥰤��㤦�Τǥ��顼�ˤʤ롣
euc.dup.tap {|euc7| euc7[3..6] = sjis} rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
