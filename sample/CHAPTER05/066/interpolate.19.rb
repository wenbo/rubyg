# -*- coding: euc-jp -*-
# Shift_JISʸ�����������롣
sjis = "���󥳡��ǥ���".encode "Shift_JIS"
# ���󥳡��ǥ��󥰤��ۤʤ�Τǥ��顼�ˤʤ롣
"#{sjis}���顼" rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: Shift_JIS and EUC-JP>
