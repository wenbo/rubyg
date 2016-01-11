class A
  def initialize(x)  @x = x end
  private
  def private_meth() @x * 2 end
end
class B
  def initialize(a)  @a, @v = a, 3  end
  def test          # ʸ̮���Ѥ���¸�
    self            # => #<B:0xb7d5dce0 @v=3, @a=#<A:0xb7d5df9c @x=5>>
    a = @a          # => #<A:0xb7d5df9c @x=5>
# instance_eval��˺���self�ξ�����������ˤ�ͽ��������ѿ����������롣
    v = @v
# �������� a ��ʸ̮�ˤʤ롣
    a.instance_eval do
      # self��a�ˤ����Ѥ�ä������λ����ǳ�¦��self�ϸ����ʤ���
      self          # => #<A:0xb7d5df9c @x=5>
      # a�Υ��󥹥����ѿ�@x�˥����������롣
      @x            # => 5
      # instance_eval��Ǥϥץ饤�١��ȥ᥽�åɤ�Ƥ٤롣
      private_meth  # => 10
      # ��¦��self�Υ��󥹥����ѿ�������������
      v             # => 3
      # instance_eval��ǤΥ᥽�å�������ðۥ᥽�åɤȤʤ롣
      def smeth() :singleton_method end
    end
    self            # => #<B:0xb7d5dce0 @v=3, @a=#<A:0xb7d5df9c @x=5>>
# smeth��a���ðۥ᥽�åɤˤʤäƤ��롣
    a.smeth         # => :singleton_method
    a2 = A.new 8    # => #<A:0xb7d5c304 @x=8>
    a2.smeth rescue $!
    # => #<NoMethodError: undefined method `smeth' for #<A:0xb7d5c304 @x=8>>
# instance_eval�ϥ֥�å��������ʸ��������Ǥ��롣
    a.instance_eval "private_meth" # => 10
# �����������饹A��ʸ̮�ˤʤ롣
    A.module_eval do
      self                # => A
      # module_eval��ǤΥ᥽�å�����ϥ��󥹥��󥹥᥽�åɤȤʤ롣
      def imeth() :instance_method end
    end
# ���󥹥��󥹥᥽�åɤʤΤ�A���֥������Ȥʤ�иƤ٤롣
    a.imeth               # => :instance_method
    a2.imeth              # => :instance_method

# �����������饹���֥�������A��ʸ̮�ˤʤ롣
    A.instance_eval do
      # self�ϥ��饹���֥�������A�ˤʤ롣
      self                # => A
      
      def cmeth() :class_method end   # ���饹�᥽�å����
    end
    A.respond_to? :cmeth  # => true
    A.cmeth               # => :class_method
  end
end
a = A.new 5  # => #<A:0xb7d5df9c @x=5>
b = B.new a  # => #<B:0xb7d5dce0 @v=3, @a=#<A:0xb7d5df9c @x=5>>
b.test
