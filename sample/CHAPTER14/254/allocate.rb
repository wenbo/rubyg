class Foo
  def initialize(var)  @var = var end
# ���󥹥����ѿ�@var�ϳ�������ϻ��Ȥ��������Ƥ��ʤ���
  attr_reader :var
end
# �̾�Υ��󥹥ȥ饯���ǥ��֥������Ȥ������
Foo.new(3)           # => #<Foo:0xb7b9c794 @var=3>
# ���֥������Ȥ��ΰ����ݤ���������
foo0 = Foo.allocate  # => #<Foo:0xb7b9c460>
# �ΰ����ݤ��������ǤϻȤ���Τˤʤ�ʤ��Τǳ������鶯���˥��󥹥����ѿ������ꤹ�롣
foo0.instance_variable_set(:@var, 7)
foo0                 # => #<Foo:0xb7b9c460 @var=7>
