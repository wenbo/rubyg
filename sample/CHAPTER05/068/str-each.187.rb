#!/usr/local/bin/ruby -Ke
multstr = "From: root@example.com\nTo: rubikitch@ruby-lang.org\n"
# �Ԥ��Ȥ˷����֤�Enumerator����������롣
multstr.lines      # => #<Enumerator: "From: root@example.com\nTo: rubikitch@ruby-lang.org\n":lines>
# Enumerator�ϡ�each�ס���map�ס���to_a�פʤɤ�Enumerable�Υ᥽�åɤ��Ȥ��롣
multstr.lines.each {|line| puts "lines.each: #{line}" }
# �Х��Ȥ��Ȥ˷����֤�Enumerator��������������((:Enumerator#to_a:))�����󲽤��롣
"abc".bytes.to_a              # => [97, 98, 99]
# Ruby 1.8.7�ʹߤ�ʸ�����Ȥ�ʬ�䤹���ΨŪ�ʥ��ǥ����ࡣ
"���ץꥱ�������".chars.to_a # => ["��", "��", "��", "��", "��", "��", "��", "��"]
# >> lines.each: From: root@example.com
# >> lines.each: To: rubikitch@ruby-lang.org
