# Ʊ�ͤ���Ʊ��ǤϤʤ���
# ʸ�����ɾ������뤿�Ӥ˥��֥������Ȥ�����롣
a = "str"
b = "str"
a.object_id  # => 68591790
b.object_id  # => 68591780
# a��b��Ʊ�ͤ���Ʊ��ǤϤʤ���
a == b       # => true
a.equal? b   # => false
# Ʊ�����
a = "str"
# Ʊ�����֥������Ȥ�2�Ĥ�̾����Ž���դ��������ʤΤ�a��b��Ʊ��
b = a
a.object_id  # => 68589770
b.object_id  # => 68589770
# Ʊ��ʤ��Ʊ�ͤǤ⤢�롣
a == b       # => true
a.equal? b   # => true
# Fixnum��Symbol���㳰Ū�˰��Ū��ID��������Ƥ���Τ�Ʊ��
a = 7
b = 7
a.object_id  # => 15
b.object_id  # => 15
a == b       # => true
a.equal? b   # => true
a = :symbol
b = :symbol
a.object_id  # => 119528
b.object_id  # => 119528
a == b       # => true
a.equal? b   # => true
