a = [3, 1, 2, 1, 4, 1]
# ���ǿ�������롣
a.count                        # => 6
# 3�ʾ�����ǿ�������롣ξ�Ԥ�������
a.count {|x| x >= 3 }          # => 2
a.select {|x| x >= 3 }.length  # => 2
a.count {|x| x > 9 }           # => 0
# ��������ǿ�������롣
a.count(&:odd?)                # => 4
# 1�����Ĥ��뤫�����롣ξ�Ԥ�������
a.count(1)                     # => 3
a.grep(1).length               # => 3
a.count(9)                     # => 0