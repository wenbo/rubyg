require 'pp'
class Module
  def enable_short_inspect(&block) # û��̾��ͭ���ˤ���
# ����inspect��pretty_print�᥽�åɤ򥤥󥹥����ѿ������򤹤롣���Ǥ����򤵤�Ƥ���в��⤷�ʤ���
    @__inspect__ ||= instance_method(:inspect)
    @__pp__ ||= instance_method(:pretty_print)
    if block
# �֥�å��դ��ʤ�Ф������Ƥ�inspect�᥽�åɤ�������롣
      define_method(:inspect, &block)
    else
# �ǥե���Ȥ�û�̷���������롣
      define_method(:inspect) { "#<#{self.class}>" }
    end
# pretty_print�������Object#pretty_print�ˤ��롣
    define_method(:pretty_print, Object.instance_method(:pretty_print))
  end

  def disable_short_inspect        # û��̾��̵���ˤ���
# inspect�򸵡�__inspect__�ˤ��᤹��
    define_method(:inspect, @__inspect__)
    define_method(:pretty_print, @__pp__)
  end
end

class X; end
x = X.new        # => #<X:0x8b24168>
# inspect��û��̾�ˤ��롣
X.enable_short_inspect
x                # => #<X>
# inspect�򸵤��᤹��
X.disable_short_inspect
x                # => #<X:0x8b24168>

# �ե�����ɤ�¿����¤�Τ���
Person = Struct.new :name, :age, :job, :location, :tel
tom = Person.new "Tom", 18, "programmer", "London", "123-254-4758"
# => #<struct Person name="Tom", age=18, job="programmer", location="London", tel="123-254-4758">
# ̾������ɽ�����롣
Person.enable_short_inspect { "P:#{name}" }
tom              # => P:Tom
X.enable_short_inspect
[:id, [tom, x]]  # => [:id, [P:Tom, #<X>]]
# pp�ˤ��б����Ƥ��롣
pp [:id, [tom, x]]
# >> [:id, [P:Tom, #<X>]]
