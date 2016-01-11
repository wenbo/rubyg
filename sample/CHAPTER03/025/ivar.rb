self            # => main
@main = "main"  # トップレベルならどこでも読み書きできる。mainに属している。

class Hoge
  @class_ivar = "instance variable of Hoge" # クラスのインスタンス変数。
  def self.cmeth           # クラスメソッドなので@class_ivarは見える。
    @class_ivar # => "instance variable of Hoge"
  end
  # クラス定義の文脈なので@class_ivarは見える。
  @class_ivar   # => "instance variable of Hoge"
  def initialize
    @ivar = "ivar"         # オブジェクトのインスタンス変数。
  end
  def imeth
    # @ivarは見える
    @ivar       # => "ivar"
    # @class_ivarは見えない。未定義なのでnilとなる。
    @class_ivar # => nil # !> instance variable @class_ivar not initialized
  end
end
Hoge.cmeth
Hoge.new.imeth
