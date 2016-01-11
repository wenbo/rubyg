class Foo
  def initialize(a, b)
    @a, @b  = a, b
    @v = a + b                  # �����鸫���ʤ����󥹥����ѿ�
  end
# @a��@b��@c���Ф��륢��������������롣
  attr_reader   :a              # �ɤ߹�������
  attr_writer   :b              # �񤭹�������
  attr_accessor :c              # �ɤ߽񤭲�ǽ
# ��attr_accessor :d�פ�������
  def d()    @d      end        # ��attr_reader :d�פ�����
  def d=(d)  @d = d  end        # ��attr_writer :d�פ�����
end

foo = Foo.new(1,2)  # => #<Foo:0xb7b30fbc @b=2, @a=1, @v=3>
# @a���ɤ߹��ߤϲ�ǽ�������񤭹��ߤ��Ǥ��ʤ���
foo.a               # => 1
(foo.a = 9) rescue $!
# => #<NoMethodError: undefined method `a=' for #<Foo:0xb7b30fbc @b=2, @a=1, @v=3>>
# @b�ν񤭹��ߤϲ�ǽ�������ɤ߹��ߤϤǤ��ʤ���
foo.b rescue $!
# => #<NoMethodError: undefined method `b' for #<Foo:0xb7b30fbc @b=2, @a=1, @v=3>>
foo.b = 6
foo                 # => #<Foo:0xb7b30fbc @b=6, @a=1, @v=3>
# @c���ɤ߽񤭲�ǽ��
foo.c = 5
foo.c               # => 5
# ���̾������ʤΤǼ����������Ǥ��롣
foo.c += 1
foo.c               # => 6
# ���̾������ʤΤ�¿��������Ǥ��롣
foo.c, v = 7, 8
v                   # => 8
foo                 # => #<Foo:0xb7b30fbc @b=6, @a=1, @v=3, @c=7>
