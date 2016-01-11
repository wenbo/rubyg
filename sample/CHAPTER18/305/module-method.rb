require 'test/unit'
module AModule                  # テスト対象モジュール
  def a_times(x) @a * x end
end

class TestAModule1 < Test::Unit::TestCase
  # モジュールをテストクラスにインクルードする方法
# テストクラスにAModuleをインクルードする。
  include AModule
  def test_a_times_1
# モジュールのインスタンス変数はテストクラスのインスタンス変数になる。
    @a = 5
    assert_equal 10, a_times(2)
  end

  # モジュールをインクルードしたクラスを作成する方法
# AModuleをインクルードしたクラスAClassを新しく作成する。インスタンス変数にアクセスできるようModule#attr_accessorを使用する。
  class AClass
    include AModule
    attr_accessor :a
  end
  def test_a_times_2
# AClassオブジェクトを作成し、アクセサ経由でインスタンス変数を設定する。
    obj = AClass.new
    obj.a = 5
    assert_equal 10, obj.a_times(2)
  end

  # 無名クラスによる方法
  def test_a_times_3
# テストメソッド内に無名クラスを作成する。テストメソッド内にクラス定義は書けないのでClass.newでクラスを作成する。
    klass = Class.new do
      include AModule
      attr_accessor :a
    end
# 無名クラスのオブジェクトである以外、test_a_times_2と同じ。
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
