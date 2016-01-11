# Greeting��������ɤ߹��ࡣ
require 'greeting'
def once(tag)          # tag�ǻ��ꤵ�줿�֥�å�����٤Τ߼¹Ԥ���ؿ�
# @__once_executed__��tag���ޤޤ�Ƥ��ʤ��Ȥ��ϡ���@__once_executed__��̤����ΤȤ��϶���������������
  unless (@__once_executed__||=[]).include? tag
# �֥�å���¹Ԥ��ơ�tag��@__once_executed__����Ͽ���롣
    yield
    @__once_executed__ << tag
  end
end
# alias�Ǻ����������ˡ
class Greeting
# �ƥ��ɻ��������ư��٤����¹Ԥ��ʤ��褦�ˤ��롣
  once(:redefine_hello) do
# ����hello�᥽�åɤ�hello_old����¸���롣
    alias hello_old hello
    def hello() "#{hello_old} (redefined by alias)" end
  end
end
g = Greeting.new
g.hello  # => "Hello! (redefined by alias)"
# UnboundMethod�Ǻ����������ˡ
class Greeting
  once(:redefine_hi) do
# ����hi�᥽�åɤ�UnboundMethod�����롣
    old = instance_method(:hi)  # => #<UnboundMethod: Greeting#hi>
    undef :hi           # �ٹ�ä�
# �������ѿ�old�˥�����������Τǡ�((:Module#define_method:))��Ȥ�ɬ�פ����롣
    define_method(:hi) do
# UnboundMethod��Ƥ֥��ǥ����ࡣ��old.bind(self)�פ�Method���֥������Ȥ��Ѵ�������call(����)�פǸƤ֡�
      old_hi = old.bind(self).call
      "#{old_hi} (redefined by UnboundMethod)"
    end
  end
end
g.hi     # => "Hi! (redefined by UnboundMethod)"
# Object#extend�Ǻ����������ˡ
module HelloRedefined
  def hello() "#{super} <redefined by extend>" end
end
# hello�᥽�åɤ�HelloRedefined�Τ�Τ˺�������롣
g.extend(HelloRedefined)
g.hello  # => "Hello! (redefined by alias) <redefined by extend>"
