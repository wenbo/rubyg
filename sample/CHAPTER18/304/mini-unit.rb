require 'mini/test'
class TestString < Mini::Test::TestCase
# 共通のオブジェクトをsetupに書く。
  def setup()        @s = "Object"                    end
# "Object"の長さが6であることを検証する。
  def test_length()  assert_equal 6, @s.length        end
# "Object"を大文字にしたら"OBJECT"になることを検証する。
  def test_upase()   assert_equal "OBJECT", @s.upcase end
# "Object"は文字列であることを検証する。
  def test_class()   assert_kind_of String, @s        end
end
Mini::Test::autorun
# >> Loaded suite -
# >> Started
# >> ...
# >> Finished in 0.000479 seconds.
# >> 
# >> 3 tests, 3 assertions, 0 failures, 0 errors
