require 'mini/test'
class TestString < Mini::Test::TestCase
# ���̤Υ��֥������Ȥ�setup�˽񤯡�
  def setup()        @s = "Object"                    end
# "Object"��Ĺ����6�Ǥ��뤳�Ȥ򸡾ڤ��롣
  def test_length()  assert_equal 6, @s.length        end
# "Object"����ʸ���ˤ�����"OBJECT"�ˤʤ뤳�Ȥ򸡾ڤ��롣
  def test_upase()   assert_equal "OBJECT", @s.upcase end
# "Object"��ʸ����Ǥ��뤳�Ȥ򸡾ڤ��롣
  def test_class()   assert_kind_of String, @s        end
end
Mini::Test::autorun
# >> Loaded suite -
# >> Started
# >> ...
# >> Finished in 0.000479 seconds.
# >> 
# >> 3 tests, 3 assertions, 0 failures, 0 errors
