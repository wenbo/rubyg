require 'rubygems'
require 'active_support'
# 1KiB は1024バイト。
1.kilobyte                  # => 1024
# 2MiBと12KiBを足すと2109440バイト。
2.megabytes + 12.kilobytes  # => 2109440
# 1,000,000,000バイトは約0.93GiB。
10**9 / 1.0.gigabyte        # => 0.931322574615479
# 500,000,000,000バイトは465GiB強に過ぎない。
500*10**9 / 1.0.gigabyte    # => 465.661287307739
