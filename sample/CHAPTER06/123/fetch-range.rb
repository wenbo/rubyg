#index:0 1 2 3 4
ary = [1,2,3,4,5]  # => [1, 2, 3, 4, 5]
# 最初以外すべての要素を得る。
ary[1..-1]         # => [2, 3, 4, 5]
# <%=idx "2〜3" %>の要素（4は含まない）を得る。
ary[2...4]         # => [3, 4]
# <%=idx "2〜4" %>の要素を得る。
ary[2..4]          # => [3, 4, 5]
# インデックス2から連続した3つの要素を得る。
ary[2,3]           # => [3, 4, 5]
# インデックス2から連続した3つの要素を破壊的に[6]に置き換える。
ary[2,3]=[6]; ary  # => [1, 2, 6]
