class A
  def initialize(v) @v = v end
  attr_reader :v
end
x1 = A.new 1
x2 = A.new 1
# ���Τޤޤ���Ʊ��Ǥʤ��ȡ�==�פˤʤ�ʤ�
x1 == x1  # => true
x1 == x2  # => false
# ==����������
class A
  # ���饹�ȥ��󥹥����ѿ����������Τ�Ʊ�ͤξ��
  def ==(x) x.instance_of?(A) and @v == x.v end
end
x1 == x2  # => true
