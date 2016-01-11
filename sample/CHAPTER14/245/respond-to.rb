# stringioライブラリにStringIOが定義されているので読み込む
require 'stringio'
# StringIOはIOのように扱える文字列。
strio = StringIO.new "strio"  # => #<StringIO:0xb7dacc00>
str = "str"
# StringIO#readは存在する。
strio.respond_to? :read       # => true
# String#readは存在しない。
str.respond_to? :read         # => false
# スーパークラスのメソッド（Object#object_id）が存在する。
str.respond_to? :object_id    # => true

# オブジェクトの「内容」を返す関数を定義する。readメソッドを持つオブジェクト（IO等）はreadしたものを、持たないものはそのままを返す。
def content(x)  x.respond_to?(:read) ? x.read : x  end
# StringもStringIO（IO）もStringで標準化できる。
content(strio)                # => "strio"
content(str)                  # => "str"
