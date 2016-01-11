ary = [1, 2, 3, 4]
# ����ǥå�����2�����Ǥ�ľ����"inserted"��"contents"���������롣
ary.insert(2, "inserted", "contents")  # => [1, 2, "inserted", "contents", 3, 4]
# �˲�Ū���ѹ�����롣
ary                                    # => [1, 2, "inserted", "contents", 3, 4]
# ��ʬ����ؤ������Ǥ��˲�Ū�������Ǥ��뤬insert�Ȥ��֤��ͤ��ۤʤ롣
ary[5,0] = ["XXX"]  # => ["XXX"]
ary                 # => [1, 2, "inserted", "contents", 3, "XXX", 4]
# �������������롣
ary << 5
ary.insert(ary.length, 6)  # => [1, 2, "inserted", "contents", 3, "XXX", 4, 5, 6]
# ��Ƭ���������롣
ary.unshift 0              # => [0, 1, 2, "inserted", "contents", 3, "XXX", 4, 5, 6]
ary.insert(0,-1)           # => [-1, 0, 1, 2, "inserted", "contents", 3, "XXX", 4, 5, 6]
