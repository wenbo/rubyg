# test/unitライブラリにTest::Unitが定義されているので読み込む
require 'test/unit'
class TestString < Test::Unit::TestCase
# 共通のオブジェクトをsetupに書く。
  def setup()        @s = "Object"                    end
# "Object"の長さが6であることを検証する。
  def test_length()  assert_equal 6, @s.length        end
# "Object"を大文字にしたら"OBJECT"になることを検証する。
  def test_upase()   assert_equal "OBJECT", @s.upcase end
# "Object"は文字列であることを検証する。
  def test_class()   assert_kind_of String, @s        end
end
