#!/usr/local/bin/ruby -Ke
# 2�Ԥˤ錄��ʸ����
multstr = "From: root@example.com\nTo: rubikitch@ruby-lang.org\n"
# �Ԥ��Ȥ˷����֤���
multstr.each_line {|line| puts "each_line: #{line}" }
# ��split(//)�ס���scan(/./)�פ�ʸ�����Ȥ�ʬ�䤹�����Υ��ǥ����ࡣ
"���ץꥱ�������".split(//)  # => ["��", "��", "��", "��", "��", "��", "��", "��"]
"���ץꥱ�������".scan(/./)  # => ["��", "��", "��", "��", "��", "��", "��", "��"]
# >> each_line: From: root@example.com
# >> each_line: To: rubikitch@ruby-lang.org
