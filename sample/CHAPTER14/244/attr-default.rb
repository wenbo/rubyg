class Module
  def attr_accessor_default(name, default=nil, &block)
# �񤭹��ߥ��������Ϥ��Τޤޡ�
    attr_writer name
    iv = "@#{name}"
# �ɤ߹��ߥ��������������iv�򻲾Ȥ���Τ�Module#define_method��Ȥ�ɬ�פ����롣
    define_method(name) do
      if instance_variable_defined?(iv) # ���󥹥����ѿ����������Ƥ���Ȥ���
          instance_variable_get(iv)     # �����ͤ��֤���
      elsif block                       # �֥�å����դ��Ƥ����
        instance_eval(&block)           # �᥽�åɤ�ʸ̮��ɾ������
      else                              # �֥�å����դ��Ƥ��ʤ����
        default                         # �ǥե�����ͤ��֤���
      end
    end
  end
end

class X
  attr_accessor_default :foo, 9999           # �ǥե������9999
  attr_accessor_default(:bar) { foo }        # �ǥե���Ȥ�foo�ƤӽФ�
  attr_accessor_default(:baz) { @baz = foo } # foo�ƤӽФ��򥭥�å��夹��
end
x = X.new
# @foo��̤����ʤΤǥǥե�����ͤ��֤���
x.foo                   # => 9999
# @foo���ͤ����ꤹ�롣
x.foo = 7; x.foo        # => 7
# nil�����ꤷ�Ƥ�����ס�
x.foo = nil; x.foo      # => nil
x.foo = 77
# @bar��̤����ʤ��foo�᥽�åɡʤĤޤ�@foo���͡ˤ�ƤӽФ���
x.bar                   # => 77
# @bar���ͤ����ꤹ�롣
x.bar = "hoge"; x.bar   # => "hoge"
# @baz�ˤϡ����λ�����foo�᥽�åɤη�̤��ݻ����롣
x.baz                   # => 77
x.foo = 0
x.baz                   # => 77
