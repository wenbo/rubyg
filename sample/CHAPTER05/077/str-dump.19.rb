# -*- coding: euc-jp -*-
# dump���Ƥ⥨�󥳡��ǥ��󥰤���¸����롣
"����ˤ���".dump            # => "\"\\xA4\\xB3\\xA4\\xF3\\xA4\\xCB\\xA4\\xC1\\xA4\\xCF\""
"����ˤ���".dump.encoding   # => #<Encoding:EUC-JP>
# ��eval(string.dump) == string�פ���Ω���롣
eval("code\n".dump) == "code\n"           # => true
eval("����ˤ���".dump) == "����ˤ���"   # => true
# ASCII�ߴ��ǤϤʤ����󥳡��ǥ��󥰤ξ��Ǥ�Ruby�μ��Ȥ���Ÿ������롣
"ab".encode("UTF-16LE").dump   # => "\"a\\x00b\\x00\".force_encoding(\"UTF-16LE\")"
# String#inspect�����ܸ�ʸ�����Хå�����å��嵭ˡ���֤������ʤ���
puts "'����'".inspect
# >> "'����'"
