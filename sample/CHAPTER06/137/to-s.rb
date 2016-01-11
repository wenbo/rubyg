ary = [1, "a", Array, ["inner", ["array"]]]
# 人間が読みやすい形式にする。
ary.inspect   # => "[1, \"a\", Array, [\"inner\", [\"array\"]]]"
# 文字列を挟み込む。省略時は要素を連結する。
ary.join      # => "1aArrayinnerarray"
ary.join ""   # => "1aArrayinnerarray"
ary.join " "  # => "1 a Array inner array"
# 「*」演算子メソッドに文字列を指定した場合は「Array#join」と同じになる。
ary * " "     # => "1 a Array inner array"
