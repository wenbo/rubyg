require 'rubygems'
require 'active_support'
# ���֤�ɽ����inspect�η�̤�ñ������ʣ�������θ�����Ѹ�ɽ���ˤʤ롣
1.second                     # => 1 second
2.hours                      # => 7200 seconds
1.year + 3.months + 20.days  # => 1 year, 3 months, and 20 days
tm = Time.now                # => Sat Nov 22 11:28:18 +0900 2008
# ���ߤ���2�����λ�������롣
tm + 2.months                # => Thu Jan 22 11:28:18 +0900 2009
2.months.from_now            # => Thu Jan 22 11:28:18 +0900 2009
tm.advance(:months => 2)     # => Thu Jan 22 11:28:18 +0900 2009
# ���ߤ���2�������λ�������롣
tm - 2.months                # => Mon Sep 22 11:28:18 +0900 2008
2.months.ago                 # => Mon Sep 22 11:28:18 +0900 2008
tm.advance(:months => -2)    # => Mon Sep 22 11:28:18 +0900 2008
