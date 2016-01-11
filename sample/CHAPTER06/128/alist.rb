alist = [["one",1,"extra element"], ["two",2], ["three",3]]
# キーに対応するペアを得る。
alist.assoc("one")     # => ["one", 1, "extra element"]
# キーに対応する値を得る。
alist.assoc("one")[1]  # => 1
# 値に対応するペアを得る。
alist.rassoc(2)        # => ["two", 2]
# 値に対応するキーを得る。
alist.rassoc(2)[0]     # => "two"
