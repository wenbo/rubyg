# -*- coding: euc-jp -*-
ai = "����"
ai.encoding                                 # => #<Encoding:EUC-JP>
ai.valid_encoding?                          # => true
# �Х��ʥ�Ȥ��ư���
ai.force_encoding "ASCII-8BIT"              # => "\xA4\xA2\xA4\xA4"
ai.encoding                                 # => #<Encoding:ASCII-8BIT>
ai.valid_encoding?                          # => true
# �����Υ��󥳡��ǥ��󥰤���ꤹ��ʴ���
ai.force_encoding "UTF-8"
ai.valid_encoding?                          # => false
# �Х��ʥ�ʸ���󤫤饨�󥳡��ǥ��󥰤����ꤹ��
"\xA4\xA2\xA4\xA4".force_encoding "EUC-JP"  # => "����"
