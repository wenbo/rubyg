require 'pp'
class Module
  def enable_short_inspect(&block) # 短縮名を有効にする
# 元のinspect、pretty_printメソッドをインスタンス変数に退避する。すでに退避されていれば何もしない。
    @__inspect__ ||= instance_method(:inspect)
    @__pp__ ||= instance_method(:pretty_print)
    if block
# ブロック付きならばその内容のinspectメソッドを定義する。
      define_method(:inspect, &block)
    else
# デフォルトの短縮形を定義する。
      define_method(:inspect) { "#<#{self.class}>" }
    end
# pretty_printの定義はObject#pretty_printにする。
    define_method(:pretty_print, Object.instance_method(:pretty_print))
  end

  def disable_short_inspect        # 短縮名を無効にする
# inspectを元（__inspect__）に戻す。
    define_method(:inspect, @__inspect__)
    define_method(:pretty_print, @__pp__)
  end
end

class X; end
x = X.new        # => #<X:0x8b24168>
# inspectを短縮名にする。
X.enable_short_inspect
x                # => #<X>
# inspectを元に戻す。
X.disable_short_inspect
x                # => #<X:0x8b24168>

# フィールドの多い構造体の例
Person = Struct.new :name, :age, :job, :location, :tel
tom = Person.new "Tom", 18, "programmer", "London", "123-254-4758"
# => #<struct Person name="Tom", age=18, job="programmer", location="London", tel="123-254-4758">
# 名前だけ表示する。
Person.enable_short_inspect { "P:#{name}" }
tom              # => P:Tom
X.enable_short_inspect
[:id, [tom, x]]  # => [:id, [P:Tom, #<X>]]
# ppにも対応している。
pp [:id, [tom, x]]
# >> [:id, [P:Tom, #<X>]]
