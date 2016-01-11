#!/usr/local/bin/ruby -Ke
# ��scan(/./)�ס���split(//)�ס���chars.to_a�ס�Ruby 1.8.7�ʹߡˤ�1ʸ�����Ĥ�ʬ�䤹�륤�ǥ����ࡣ
"<����ˤ���>".scan(/./)   # => ["<", "��", "��", "��", "��", "��", ">"]
"<����ˤ���>".split(//)   # => ["<", "��", "��", "��", "��", "��", ">"]
"<����ˤ���>".chars.to_a  # => ["<", "��", "��", "��", "��", "��", ">"]

header = <<EOH
From: rubikitch@ruby-lang.org
To: ruby-list@ruby-lang.org
Reply-To: ruby-list@ruby-lang.org
Subject: I love Ruby!
EOH
# �ޥå����ʤ�����ɽ���ξ��϶������֤롣
header.scan(/no match/)         # => []
# ����ɽ���˥ޥå�������ʬ����������롣
header.scan(/^.+ruby-list.+$/)
# => ["To: ruby-list@ruby-lang.org", "Reply-To: ruby-list@ruby-lang.org"]
# ()�դ�����ɽ���ξ��ϥ���ץ��������������֤롣
header.scan(/^(\S+): (.+)$/)
# => [["From", "rubikitch@ruby-lang.org"],
#     ["To", "ruby-list@ruby-lang.org"],
#     ["Reply-To", "ruby-list@ruby-lang.org"],
#     ["Subject", "I love Ruby!"]]
# ����ץ�������Ǥʤ�������ɽ���˥ޥå�������ʬ���ߤ�����С�����ɽ�����Τ�()�ǰϤࡣ
header.scan(/(^(\S+): (.+)$)/)
# => [["From: rubikitch@ruby-lang.org", "From", "rubikitch@ruby-lang.org"],
#     ["To: ruby-list@ruby-lang.org", "To", "ruby-list@ruby-lang.org"],
#     ["Reply-To: ruby-list@ruby-lang.org", "Reply-To", "ruby-list@ruby-lang.org"],
#     ["Subject: I love Ruby!", "Subject", "I love Ruby!"]]
# ()���ҤȤĤΤߤξ�硢���ʤ�����٤�((:Array#flatten:))��ʻ�Ѥ���롣
header.scan(/^(.+):/)          # => [["From"], ["To"], ["Reply-To"], ["Subject"]]
header.scan(/^(.+):/).flatten  # => ["From", "To", "Reply-To", "Subject"]
# �֥�å���Ĥ���Хޥå����Ȥ˥֥�å���ɾ�����롣
header.scan(/^(\S+): (.+)$/) do |name, value|
  puts "�������ɥ쥹��#{value}�Ǥ���" if name == "From"
end
# >> �������ɥ쥹��rubikitch@ruby-lang.org�Ǥ���
