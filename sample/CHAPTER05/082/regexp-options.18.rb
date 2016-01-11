#!/usr/local/bin/ruby -Ke
# ��ʸ����ʸ����̵�뤹�롣
"Alice" =~ /^alice/             # => nil
"Alice" =~ /^alicE/i            # => 0
# ʣ����ʸ����ˤ�m��˺��ʤ��褦�ˡ�
"abc\ndef\nghi\n" =~ /a.c.def/   # => nil
"abc\ndef\nghi\n" =~ /a.c.def/m  # => 0

# o���ץ����Υ٥���ޡ���
require 'benchmark'
a="a"
# ��Ÿ���Ĥ�����ɽ����100000��ɾ������Τˤ����ä��ÿ����¬���롣���Τ褦�˼��η�̤�����ΤȤ��Ϲ�®�����ޤ�롣
Benchmark.measure{ 100000.times{ /#{a}/ }}.total   # => 0.59
Benchmark.measure{ 100000.times{ /#{a}/o }}.total  # => 0.0299999999999999
# o���ץ����θ�����
["foo","bar"].map{|s| /#{s}/ }            # => [/foo/, /bar/]
["foo","bar"].map{|s| /#{s}/o }           # => [/foo/, /foo/]
["foo","bar"].map{|s| "foo" =~ /#{s}/o }  # => [0, 0]

# �������ʸ�������ɤ�����ɽ���˥ޥå���������
require 'kconv'
euc  = "����ˤ��ϡ�����������ˤ��ϡ�Ruby��".toeuc
sjis = euc.tosjis
utf8 = euc.toutf8
hello = "����������ˤ���"
euc =~ /#{hello.toeuc}/      # => 12
# ���ιԤ�¹Ԥ���ȡ�-:26: premature end of regular expression: ... (RegexpError)�פȤ������顼���ФƤ��ޤ���
# sjis =~ /#{hello.tosjis}/
# ʸ�������ɤ������㤦������ʤ�Хޥå�����Ϥ�������ɽ�����ޥå����ʤ��ʤ뤳�Ȥ⡣
utf8 =~ /#{hello.toutf8}/s   # => nil
# ʸ�������ɻ��ꥪ�ץ�����Ĥ��롣
sjis =~ /#{hello.tosjis}/s   # => 12
utf8 =~ /#{hello.toutf8}/u   # => 18
