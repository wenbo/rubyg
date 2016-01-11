#!/usr/local/bin/ruby -Ke
#index 01234567890123
str = "☆☆テスト☆☆"
# マッチするので、マッチ開始位置のインデックスを返す。
str =~ /テスト/        # => 4
str.index "テスト"     # => 4
# 一番左の☆を探す。
str.index "☆"         # => 0
# インデックス6から右の☆を探す。
str.index "☆", 6      # => 10
# 左から4番目、すなわちインデックス10から右の☆を探す。
str.index "☆", -4     # => 10
# 一番右の☆を探す。
str.rindex "☆"        # => 12
# インデックス6から左の☆を探す。
str.rindex "☆", 6     # => 2
# 左から2番目、すなわちインデックス12から左の☆を探す。探索開始位置がちょうど☆になっている。
str.rindex "☆", -2    # => 12
# 文字列が含まれているかどうか。
str.include? "テスト"  # => true
# 含まれていない場合は偽を返す。
str =~ /test/          # => nil
str.index "test"       # => nil
str.include? "test"    # => false
