require 'test/unit'
module AModule                  # �ƥ����оݥ⥸�塼��
  def a_times(x) @a * x end
end

class TestAModule1 < Test::Unit::TestCase
  # �⥸�塼���ƥ��ȥ��饹�˥��󥯥롼�ɤ�����ˡ
# �ƥ��ȥ��饹��AModule�򥤥󥯥롼�ɤ��롣
  include AModule
  def test_a_times_1
# �⥸�塼��Υ��󥹥����ѿ��ϥƥ��ȥ��饹�Υ��󥹥����ѿ��ˤʤ롣
    @a = 5
    assert_equal 10, a_times(2)
  end

  # �⥸�塼��򥤥󥯥롼�ɤ������饹�����������ˡ
# AModule�򥤥󥯥롼�ɤ������饹AClass�򿷤����������롣���󥹥����ѿ��˥��������Ǥ���褦Module#attr_accessor����Ѥ��롣
  class AClass
    include AModule
    attr_accessor :a
  end
  def test_a_times_2
# AClass���֥������Ȥ������������������ͳ�ǥ��󥹥����ѿ������ꤹ�롣
    obj = AClass.new
    obj.a = 5
    assert_equal 10, obj.a_times(2)
  end

  # ̵̾���饹�ˤ����ˡ
  def test_a_times_3
# �ƥ��ȥ᥽�å����̵̾���饹��������롣�ƥ��ȥ᥽�å���˥��饹����Ͻ񤱤ʤ��Τ�Class.new�ǥ��饹��������롣
    klass = Class.new do
      include AModule
      attr_accessor :a
    end
# ̵̾���饹�Υ��֥������ȤǤ���ʳ���test_a_times_2��Ʊ����
    obj = klass.new
    obj.a = 5
    assert_equal 10, obj.a_times(2)
  end
end
# >> Loaded suite -
# >> Started
# >> ...
# >> 
# >> Finished in 0.002129703 seconds.
# >> 
# >> 3 tests, 3 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
