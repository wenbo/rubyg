require 'rubygems'
require 'test/unit'
# mocha�饤�֥���Mocha���������Ƥ���Τ��ɤ߹���
require 'mocha'
require 'forwardable'

class A; end            # �᥽�åɤ�̤����
class Forwarder         # ���󥹥����ѿ��˥᥽�åɤ�ž�����륯�饹
  def initialize(a)  @a = a  end
  attr_reader :a
# a_meth��@a�˰Ѿ����롣�Ĥޤ�Forwarder#a_meth��A#a_meth��ƤӽФ���
  extend Forwardable
  def_delegator :@a, :a_meth
end

class TestForwarder <  Test::Unit::TestCase
  def test_1  # �ºߥ��֥������Ȥȥ�å��᥽�åɤˤ��ƥ���
# �ºݤ�A���֥������Ȥ�ž���襪�֥������Ȥˤ��뤬��A#a_meth��̤����ʤΤǥ�å��᥽�åɤˤ��롣A#a_meth�ϰ���1, 2��Ĥ���2��ƤӽФ���뤳�Ȥ���Ԥ��롣
    f = Forwarder.new A.new
    f.a.expects(:a_meth).with(1,2).times(2)
# ���Τ�2��ƤӽФ��ʤ��ȥ��顼�ˤʤ롣¿�����Ƥ⾯�ʤ����Ƥ���ᡣ
    f.a_meth(1,2)
    f.a_meth(1,2)
  end
  def test_2  # ��å����֥������Ȥȥ�å��᥽�åɤˤ��ƥ���
# ��å����֥������Ȥ�a_meth�᥽�åɤ�̵�����ǸƤ֤�4���֤����Ȥ���Ԥ��롣
    a = mock()
    a.expects(:a_meth).returns(4)
    f = Forwarder.new a
    assert_equal 4, f.a_meth
  end
  def test_3  # �����֥��֥������Ȥȥ����֥᥽�åɤϸ��ڤ��Ԥ��ʤ�
# ��å����֥������ȤǤϤʤ��ƥ����֥��֥������Ȥˤ���ȡ������֥��֥������Ȥ����Ѥ���ʤ��Ƥ⥨�顼�ˤϤʤ�ʤ���
    a = stub()
    a.stubs(:a_meth).returns(4)
    f = Forwarder.new a
  end
  def test_4  # �����֥��֥������Ȥȥ����֥᥽�åɤ��֤��ͤ򸡾�
# with��Ĥ��Ƥ��ʤ�����������ϰ���������å����ʤ��Τ�Ǥ�դΰ�����Ĥ��Ƥ�Ʊ���ͤ��֤롣
    a = stub()
    a.stubs(:a_meth).returns(4)
    f = Forwarder.new a
    assert_equal 4, f.a_meth(7,8.9)
  end
end
# >> Loaded suite -
# >> Started
# >> ....
# >> 
# >> Finished in 0.001648608 seconds.
# >> 
# >> 4 tests, 4 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
