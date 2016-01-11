ary1 = [1,2,3]
ary2 = [4,5,6]
ary3 = [7,8,9]
all = []                        # ½é´ü²½
[ary1, ary2, ary3].each {|a| all.concat a }
all  # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
