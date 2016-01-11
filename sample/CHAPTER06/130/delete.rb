ary = [1,2,3,4,5,6,7,8,8]             # => [1, 2, 3, 4, 5, 6, 7, 8, 8]
# �����ȡ�==�פ����Ǥ򤹤٤ƺ����������������Ǥ��֤���
ary.delete(8)                         # => 8
ary                                   # => [1, 2, 3, 4, 5, 6, 7]
# ����������Ǥ��ʤ�����nil���֤롣
ary.delete(9)                         # => nil
# ����������Ǥ��ʤ����ϥ֥��å���ɾ�����롣
ary.delete(9){|n| "#{n} not found" }  # => "9 not found"
# ����ǥå�����0�����Ǥ������롣
ary.delete_at(0)                      # => 1
ary                                   # => [2, 3, 4, 5, 6, 7]
# �����ʡ�n % 2 == 0�פ�������n�ˤ�������self���֤���
ary.delete_if{|n| n % 2 == 0}         # => [3, 5, 7]
ary                                   # => [3, 5, 7]