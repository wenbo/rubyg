# Greetingの定義を読み込む。
require 'greeting'
def once(tag)          # tagで指定されたブロックを一度のみ実行する関数
# @__once_executed__にtagが含まれていないときは、（@__once_executed__が未定義のときは空配列を代入する）
  unless (@__once_executed__||=[]).include? tag
# ブロックを実行して、tagを@__once_executed__に登録する。
    yield
    @__once_executed__ << tag
  end
end
# aliasで再定義する方法
class Greeting
# 再ロード時に備えて一度しか実行しないようにする。
  once(:redefine_hello) do
# 元のhelloメソッドをhello_oldに保存する。
    alias hello_old hello
    def hello() "#{hello_old} (redefined by alias)" end
  end
end
g = Greeting.new
g.hello  # => "Hello! (redefined by alias)"
# UnboundMethodで再定義する方法
class Greeting
  once(:redefine_hi) do
# 元のhiメソッドをUnboundMethodで得る。
    old = instance_method(:hi)  # => #<UnboundMethod: Greeting#hi>
    undef :hi           # 警告消し
# ローカル変数oldにアクセスするので、((:Module#define_method:))を使う必要がある。
    define_method(:hi) do
# UnboundMethodを呼ぶイディオム。「old.bind(self)」でMethodオブジェクトに変換し、「call(引数)」で呼ぶ。
      old_hi = old.bind(self).call
      "#{old_hi} (redefined by UnboundMethod)"
    end
  end
end
g.hi     # => "Hi! (redefined by UnboundMethod)"
# Object#extendで再定義する方法
module HelloRedefined
  def hello() "#{super} <redefined by extend>" end
end
# helloメソッドをHelloRedefinedのものに再定義する。
g.extend(HelloRedefined)
g.hello  # => "Hello! (redefined by alias) <redefined by extend>"
