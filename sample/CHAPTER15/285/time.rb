require 'rubygems'
require 'active_support'
# 時間の表現。inspectの結果は単数形・複数形を考慮した英語表記になる。
1.second                     # => 1 second
2.hours                      # => 7200 seconds
1.year + 3.months + 20.days  # => 1 year, 3 months, and 20 days
tm = Time.now                # => Sat Nov 22 11:28:18 +0900 2008
# 現在から2ヶ月後の時刻を得る。
tm + 2.months                # => Thu Jan 22 11:28:18 +0900 2009
2.months.from_now            # => Thu Jan 22 11:28:18 +0900 2009
tm.advance(:months => 2)     # => Thu Jan 22 11:28:18 +0900 2009
# 現在から2ヶ月前の時刻を得る。
tm - 2.months                # => Mon Sep 22 11:28:18 +0900 2008
2.months.ago                 # => Mon Sep 22 11:28:18 +0900 2008
tm.advance(:months => -2)    # => Mon Sep 22 11:28:18 +0900 2008
