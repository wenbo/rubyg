ary = [1, 2, 3, 4]
# インデックスが2の要素の直前に"inserted"と"contents"を挿入する。
ary.insert(2, "inserted", "contents")  # => [1, 2, "inserted", "contents", 3, 4]
# 破壊的に変更される。
ary                                    # => [1, 2, "inserted", "contents", 3, 4]
# 部分配列への代入でも破壊的に挿入できるがinsertとは返り値が異なる。
ary[5,0] = ["XXX"]  # => ["XXX"]
ary                 # => [1, 2, "inserted", "contents", 3, "XXX", 4]
# 末尾に挿入する。
ary << 5
ary.insert(ary.length, 6)  # => [1, 2, "inserted", "contents", 3, "XXX", 4, 5, 6]
# 先頭に挿入する。
ary.unshift 0              # => [0, 1, 2, "inserted", "contents", 3, "XXX", 4, 5, 6]
ary.insert(0,-1)           # => [-1, 0, 1, 2, "inserted", "contents", 3, "XXX", 4, 5, 6]
