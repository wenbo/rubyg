#!/usr/local/bin/ruby -Ke
# <%= require_description 'String#toutf8', "kconv" %>
require 'kconv'
# ���ܸ��ޤޤʤ�ʸ����ϥХ��ȿ���ʸ�����Ǥ��롣
"abcdef".length     # => 6
# EUC-JP�Ǥϴ�����2�Х��ȤʤΤ�6�Х��Ȥˤʤ롣
ja = "���ܸ�"
ja.length           # => 6
ja.size             # => 6
# UTF-8�Ǥϴ�����3�Х��ȤʤΤ�9�Х��Ȥˤʤ롣
ja.toutf8.length    # => 9
# ʸ����������ˤϡ�split(//).length�ס���scan(/./).length�פΥ��ǥ������Ȥ���
ja.split(//).length # => 3
ja.scan(/./).length # => 3
# Ruby 1.8.7�ʹߤǻȤ����ΨŪ�ʥ��ǥ����ࡣ
ja.chars.count      # => 3
