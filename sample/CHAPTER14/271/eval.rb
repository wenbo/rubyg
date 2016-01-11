a = 1
# 現在の文脈で式を評価する。
eval "a"                      # => 1
eval "a+2"                    # => 3
eval "a", binding             # => 1
# bindの文脈でのaの値を得る。両者は等価。
def func1(bind)
  eval "a", bind              # => 1
  # Binding#evalはRuby 1.8.7以降
  bind.eval "a"               # => 1
end
# ブロック呼び出し元の文脈でのaの値を得る。
def func2(&block)
  eval "a", block.binding     # => 1
  block.binding.eval "a"      # => 1
end
# 「binding」関数で現在の文脈を渡すことができる。
func1 binding                 # => 1
# ブロックはBindingを保持しているので文脈をメソッドに伝えることができる。
func2 {}                      # => 1
# evalでローカル変数を定義しても有効にはならない。
eval "b=3"
# この式はRuby 1.8では「3」になるが、Ruby 1.9ではエラーになる
eval "b" rescue $!
# => #<NameError: undefined local variable or method `b' for main:Object>
b rescue $!
# => #<NameError: undefined local variable or method `b' for main:Object>
# 文字列 "str" の文脈でlengthメソッドを評価する。
"str".instance_eval "length"  # => 3
# Array#lengthの定義をArray#my_lengthにコピーする。
Array.module_eval "alias :my_length :length"
[1,2].my_length               # => 2
