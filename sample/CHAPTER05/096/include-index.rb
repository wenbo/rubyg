s = "���ƥ��ȡ�"
s =~ /�ƥ���/     # => 1
s.index "�ƥ���"  # => 1
s.index "��"      # => 0
s.index "��", 1   # => 4
s.index "��", -2  # => 4
s.rindex "��"     # => 4
s.rindex "��",2   # => 0
s.rindex "��",-2  # => 0
