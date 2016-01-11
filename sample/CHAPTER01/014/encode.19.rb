# -*- coding: euc-jp -*-
s = "����ǽ"
s.encoding               # => #<Encoding:EUC-JP>
s.encode "Shift_JIS"     # Shift_JIS���Ѵ�
s.encode "Windows-31J"   # Windows-31J���Ѵ�
s.encode "UTF-8"         # UTF-8���Ѵ�
s.encode "iso-2022-jp"   # ISO-2022-JP���Ѵ�
# EUC-JP��ASCIIʸ���ΤߤǤ�ɽ���Ǥ��ʤ��Τǥ��顼
s.encode "US-ASCII" rescue $!
# => #<Encoding::UndefinedConversionError: "\xE6\x96\xB0" from UTF-8 to US-ASCII>
s.encode! "ISO-2022-JP"  # �˲�Ū���Ѵ�
s.encoding               # => #<Encoding:ISO-2022-JP (dummy)>
