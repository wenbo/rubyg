#!/usr/local/bin/ruby -Ke
str = "1byte-char"
# �Х���ñ�̤�ȿž���롣
str.reverse                  # => "rahc-etyb1"
# �Х���ñ�̤��˲�Ū��ȿž���롣
str.reverse!                 # => "rahc-etyb1"
str                          # => "rahc-etyb1"
euc = "�ޥ���Х���"
# ���ܸ�ʸ�����Х���ñ�̤�ȿž����Ȥ���㤯����ʷ�̤ˤʤ롣
euc.reverse                 # ����㤯����ʷ�̤ˤʤ�
# 1ʸ�����Ȥ�ʸ����������������������ȿž���Ʒ�礹�롣
euc.split(//).reverse.join   # => "�ȥ��Х����"
euc.scan(/./).reverse.join   # => "�ȥ��Х����"
# Ruby 1.8.7�ʹߤǻȤ��밵��Ū�˹�®����ˡ��
euc.chars.to_a.reverse.join  # => "�ȥ��Х����"
