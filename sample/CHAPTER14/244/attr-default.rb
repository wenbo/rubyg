class Module
  def attr_accessor_default(name, default=nil, &block)
# 書き込みアクセサはそのまま。
    attr_writer name
    iv = "@#{name}"
# 読み込みアクセサの定義。ivを参照するのでModule#define_methodを使う必要がある。
    define_method(name) do
      if instance_variable_defined?(iv) # インスタンス変数が定義されているときは
          instance_variable_get(iv)     # その値を返し、
      elsif block                       # ブロックが付いていれば
        instance_eval(&block)           # メソッドの文脈で評価し、
      else                              # ブロックが付いていなければ
        default                         # デフォルト値を返す。
      end
    end
  end
end

class X
  attr_accessor_default :foo, 9999           # デフォルト値9999
  attr_accessor_default(:bar) { foo }        # デフォルトはfoo呼び出し
  attr_accessor_default(:baz) { @baz = foo } # foo呼び出しをキャッシュする
end
x = X.new
# @fooは未定義なのでデフォルト値を返す。
x.foo                   # => 9999
# @fooに値を設定する。
x.foo = 7; x.foo        # => 7
# nilを設定しても大丈夫。
x.foo = nil; x.foo      # => nil
x.foo = 77
# @barが未定義ならばfooメソッド（つまり@fooの値）を呼び出す。
x.bar                   # => 77
# @barに値を設定する。
x.bar = "hoge"; x.bar   # => "hoge"
# @bazには、その時点のfooメソッドの結果を保持する。
x.baz                   # => 77
x.foo = 0
x.baz                   # => 77
