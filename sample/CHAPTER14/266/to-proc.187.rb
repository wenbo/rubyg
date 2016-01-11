s = "ball"
# Kernel#p�򥪥֥������ȤȤ��Ƽ��Ф���
p = method(:p)                          # => #<Method: Object(Kernel)#p>
# p(s)��Ʊ�ͤθ��̤ʤΤǡ�ball�פ�ɽ������롣
p[s]
# proc {|*x| p(*x)} ��Ʊ�͡�
p.to_proc                               # => #<Proc:0xb7d9da0c@-:7>
# ξ�Ԥ������ʤΤǡ���ball�פ�ɽ������롣
s.tap {|x| p(x) }                       # => "ball"
s.tap(&p)                               # => "ball"
# 1��6�Τ��������Τߤ���Ф���ξ�Ԥ�������to_proc�Τ������Ǵʷ�˵��ҤǤ��롣
(1..6).select {|x| x.even? }            # => [2, 4, 6]
(1..6).select(&:even?)                  # => [2, 4, 6]
# ʸ������������Ǥ���ʸ���ˤ��롣ξ�Ԥ�������
%w[cat tiger lion].map {|x| x.upcase }  # => ["CAT", "TIGER", "LION"]
%w[cat tiger lion].map(&:upcase)        # => ["CAT", "TIGER", "LION"]
# ʸ������������Ǥ���������ˤ��롣
%w[1 10 100 1000].map(&:to_i)           # => [1, 10, 100, 1000]
# ʸ�������ʸ��������ˤ��롣Ruby 1.9�Ǥϡ�?a�פ�"a"������String#chr���������Ƥ��뤿�ᡢ����ʤ�ư����
[?a, ?b].map(&:chr)                     # => ["a", "b"]
"cat\ntiger\nlion\n".lines.to_a         # => ["cat\n", "tiger\n", "lion\n"]
# ���Ԥ�������ơ��ƹԤ����롣
"cat\ntiger\nlion\n".lines.map(&:chomp) # => ["cat", "tiger", "lion"]
# >> "ball"
# >> "ball"
# >> "ball"
