a = (1..6).to_a     # => [1, 2, 3, 4, 5, 6]
# シャッフルする旧来のイディオム。
a.sort_by { rand }  # => [1, 6, 3, 4, 2, 5]
a.sort_by { rand }  # => [2, 5, 6, 3, 1, 4]
a.sort_by { rand }  # => [2, 1, 5, 6, 4, 3]
# ランダム要素を取り出す旧来のイディオム。
[ a[rand(a.length)],  a[rand(a.length)],  a[rand(a.length)] ]  # => [6, 3, 6]
