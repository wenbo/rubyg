# -*- coding: euc-jp -*-
# i��m��o���ץ����϶���
# ������ʥ��󥳡��ǥ��󥰤�����ɽ���˥ޥå���������
euc  = "����ˤ��ϡ�����������ˤ��ϡ�Ruby��"
sjis = euc.encode "Shift_JIS"
utf8 = euc.encode "UTF-8"
hello = "����������ˤ���"
# EUC��ǥե���Ȥ�ʸ�������ɤȤ��롣
euc =~ /#{hello}/      # => 6
# ����ɽ��ʸ����Υ��󥳡��ǥ��󥰤�����ɽ���Υ��󥳡��ǥ��󥰤ˤʤ�Τǥޥå����롣
/#{hello.encode("Shift_JIS")}/.encoding  # => #<Encoding:Shift_JIS>
sjis =~ /#{hello.encode("Shift_JIS")}/   # => 6
utf8 =~ /#{hello.encode("UTF-8")}/       # => 6
