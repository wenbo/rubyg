# -*- coding: euc-jp -*-
euc  = "��"
sjis = "��".encode "Shift_JIS"
euc + sjis rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
# ���󥳡��ǥ��󥰤�·����
euc + sjis.encode("EUC-JP")      # => "����"
euc + sjis.encode(euc.encoding)  # => "����"
euc + sjis.encode(__ENCODING__)  # => "����"
