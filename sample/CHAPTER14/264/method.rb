animals = %w[dog cat rabbit]
# animals.fetchをオブジェクトとして取り出す。
fetch = animals.method(:fetch)  # => #<Method: Array#fetch>
# Methodオブジェクトを呼ぶ。
fetch.call(0)                   # => "dog"
fetch[2]                        # => "rabbit"
# Ruby 1.8.7以降でレシーバ、メソッド名、クラス名を得る。メソッド名はRuby 1.8では文字列、Ruby 1.9ではシンボルになる。
fetch.receiver                  # => ["dog", "cat", "rabbit"]
fetch.name                      # => :fetch
fetch.owner                     # => Array
# ブロック付きメソッドを呼ぶときはcallを使う必要がある。「map[] {〜}」はSyntaxErrorになる。
map = animals.method(:map)      # => #<Method: Array#map>
map.call {|x| x.upcase}         # => ["DOG", "CAT", "RABBIT"]
# Ruby 1.9では[]にブロック引数が渡せる。
map[&:upcase]                   # => ["DOG", "CAT", "RABBIT"]
# 特異メソッド（クラスメソッド）の場合、Method#ownerは特異クラスを返す。
IO.method(:read).owner          # => #<Class:IO>
class << IO; self; end          # => #<Class:IO>

# 分岐の例
def write_to_stdout() :stdout end
def send_to_printer() :printer end
def doit(command)  # commandメソッドを呼ぶ関数を定義する。（Method版）
  m = method(command)           # => #<Method: Object#write_to_stdout>
  m.call
end
# write_to_stdout関数が呼ばれる。
doit(:write_to_stdout)          # => :stdout
def doit2(command) # commandメソッドを呼ぶ関数を定義する。（__send__版）
  __send__ command
end
# send_to_printer関数が呼ばれる。
doit2(:send_to_printer)         # => :printer
