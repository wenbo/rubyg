# -*- coding: euc-jp -*-
# ���ܸ��ޤޤʤ�ʸ�����ʸ������Х��ȿ��Ǥ��롣
"abcdef".length              # => 6
# ���ܸ�ʸ����Ǥ⤭�����ʸ�������֤��Ƥ���롣
ja = "���ܸ�"
ja.encoding                  # => #<Encoding:EUC-JP>
ja.length                    # => 3
ja.size                      # => 3
# ����Υ��ǥ��������ѤǤ��뤬����Ū���٤��ʤ롣
ja.split(//).length          # => 3
ja.scan(/./).length          # => 3
ja.chars.count               # => 3
# �Х��ȿ����ߤ�������String#bytesize��Ȥ���
ja.bytesize                  # => 6
# UTF-8���Ѵ������Ȥ��ΥХ��ȿ������롣
ja.encode("UTF-8").bytesize  # => 9
