# �����Ǥ��뤫��Ƚ�ꤹ��Integer#even?��Ȥ���
(1..10).find(&:even?)                           # => 2
a = %w[fire thunder Ice Water]
# ���Ǥȥ���ǥå�����Ʊ���˵���ˤϡ�.each_with_index�פ�Ϥ��������
a.each_with_index.detect{|s,i| s =~ /^[A-Z]/ }  # => ["Ice", 2]
# ��ʸ������Ϥޤ�ǽ�����ǤΥ���ǥå�������롣
a.index{|s| s =~ /^[A-Z]/ }                     # => 2
# ��ʸ������Ϥޤ�Ǹ�����ǤΥ���ǥå�������롣
a.rindex{|s| s =~ /^[A-Z]/ }                    # => 3
