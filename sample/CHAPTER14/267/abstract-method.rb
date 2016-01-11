class Module
  # �����ǻ��ꤵ�줿��ݥ᥽�åɤ��������᥽�åɡ�
# arg_desc�ϰ������֤��ͤˤĤ��Ƥξ��󤬽񤱤뤬���������å��ޤǤϤ��ʤ���
  def abstract_method(meth, arg_desc="")
# Module#define_method��self���Ѥ��Τ��ѿ�����¸���Ƥ���ɬ�פ����롣
    mod = self
# �᥽�å���ǥ᥽�åɤ�������롣�᥽�åɤΰ�����Ǥ�ոġ�
    define_method(meth) do |*|
# �㳰��ȯ�������롣�����Ǥ�self�ϥ��饹�Υ��󥹥��󥹤ʤΤ�self�ȤϽ񤱤ʤ���
      raise NotImplementedError, "#{mod}##{meth}#{arg_desc} must be redefined in subclass."
    end
  end
end

# ��ݥ��饹����
# �����ѡ����饹����ݥ᥽�å�hoge��������롣���󥹥��󥹤ϥ��֥��饹��������Ȥ����ջ�ɽ���ˤ�ʤ롣
class Base
  abstract_method :hoge, "(integer) -> integer"
end
# ���֥��饹��hoge�᥽�åɤ�������롣
class Concrete < Base
  def hoge(x) x*2 end
end
# ��ݥ᥽�åɤʤΤ�NotImplementedError�㳰��ȯ�����롣
begin Base.new.hoge(3)
rescue NotImplementedError
  $! # => #<NotImplementedError: Base#hoge(integer) -> integer must be redefined in subclass.>
end
# ���֥��饹����ϸƤӽФ���ǽ��
Concrete.new.hoge(3)            # => 6

# ���󥿡��ե���������
# �⥸�塼�����ݥ᥽�åɤ��������ȡ�Java��interface�ߤ����ʴ����ˤʤ롣
module Interface
  abstract_method :foo, "(string) -> integer"
  abstract_method :bar, "() -> symbol"
end
class Implementation
# foo��bar����ݥ᥽�åɤˤʤ롣
  include Interface
  def bar() :implemented  end
end

# ���Τ褦�ˤ��Ƽ�����­��ȯ���Ǥ��롣
begin Implementation.new.foo
rescue NotImplementedError
  $! # => #<NotImplementedError: Interface#foo(string) -> integer must be redefined in subclass.>
end
Implementation.new.bar          # => :implemented
