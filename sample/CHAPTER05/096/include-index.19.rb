# -*- coding: euc-jp -*-
#index ０１２３４５６
str = "☆☆テスト☆☆"
str =~ /テスト/        # => 2
str.index "テスト"     # => 2
str.index "☆"         # => 0
str.index "☆", 4      # => 5
# 左から4番目、すなわちインデックス3から右の☆を探す。
str.index "☆", -4     # => 5
str.rindex "☆"        # => 6
str.rindex "☆", 3     # => 1
# 左から2番目、すなわちインデックス5から左の☆を探す。探索開始位置がちょうど☆になっている。
str.rindex "☆", -2    # => 5
str.include? "テスト"  # => true
str =~ /test/          # => nil
str.index "test"       # => nil
str.include? "test"    # => false
