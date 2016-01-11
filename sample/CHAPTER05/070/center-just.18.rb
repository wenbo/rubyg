#!/usr/local/bin/ruby -Ke
euc = "書店名"
#                         012345678901
# 幅12バイトの空白の中に中央寄せする。
euc.center(12)      # => "   書店名   "
# 幅12バイトの空白の中に左詰めする。
euc.ljust(12)       # => "書店名      "
# 幅12バイトの空白の中に右詰めする。
euc.rjust(12)       # => "      書店名"
# 左詰め、右詰めは((:String#%:))や「sprintf」関数でもできる。
"%-12s" % euc       # => "書店名      "
sprintf("%12s",euc) # => "      書店名"
# 余白を空白の代わりに「=」で埋める。
euc.center(12, '=') # => "===書店名==="
euc.ljust(12, '=')  # => "書店名======"
euc.rjust(12, '=')  # => "======書店名"
#                         012345678901
