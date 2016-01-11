# 同値だが同一ではない例
# 文字列は評価されるたびにオブジェクトが作られる。
a = "str"
b = "str"
a.object_id  # => 68591790
b.object_id  # => 68591780
# aとbは同値だが同一ではない。
a == b       # => true
a.equal? b   # => false
# 同一の例
a = "str"
# 同じオブジェクトに2つの名札を貼り付けただけなのでaとbは同一
b = a
a.object_id  # => 68589770
b.object_id  # => 68589770
# 同一ならば同値でもある。
a == b       # => true
a.equal? b   # => true
# FixnumとSymbolは例外的に一意的なIDが割り当てられるので同一
a = 7
b = 7
a.object_id  # => 15
b.object_id  # => 15
a == b       # => true
a.equal? b   # => true
a = :symbol
b = :symbol
a.object_id  # => 119528
b.object_id  # => 119528
a == b       # => true
a.equal? b   # => true
