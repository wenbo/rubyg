require 'rubygems'
require 'test/unit'
# mochaライブラリにMochaが定義されているので読み込む
require 'mocha'
require 'forwardable'

class A; end            # メソッドは未実装
class Forwarder         # インスタンス変数にメソッドを転送するクラス
  def initialize(a)  @a = a  end
  attr_reader :a
# a_methは@aに委譲する。つまりForwarder#a_methはA#a_methを呼び出す。
  extend Forwardable
  def_delegator :@a, :a_meth
end

class TestForwarder <  Test::Unit::TestCase
  def test_1  # 実在オブジェクトとモックメソッドによるテスト
# 実際のAオブジェクトを転送先オブジェクトにするが、A#a_methは未定義なのでモックメソッドにする。A#a_methは引数1, 2をつけて2回呼び出されることを期待する。
    f = Forwarder.new A.new
    f.a.expects(:a_meth).with(1,2).times(2)
# 正確に2回呼び出さないとエラーになる。多すぎても少なすぎてもだめ。
    f.a_meth(1,2)
    f.a_meth(1,2)
  end
  def test_2  # モックオブジェクトとモックメソッドによるテスト
# モックオブジェクトはa_methメソッドを無引数で呼ぶと4を返すことを期待する。
    a = mock()
    a.expects(:a_meth).returns(4)
    f = Forwarder.new a
    assert_equal 4, f.a_meth
  end
  def test_3  # スタブオブジェクトとスタブメソッドは検証が行われない
# モックオブジェクトではなくてスタブオブジェクトにすると、スタブオブジェクトが使用されなくてもエラーにはならない。
    a = stub()
    a.stubs(:a_meth).returns(4)
    f = Forwarder.new a
  end
  def test_4  # スタブオブジェクトとスタブメソッドで返り値を検証
# withをつけていないスタブ定義は引数をチェックしないので任意の引数をつけても同じ値が返る。
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
