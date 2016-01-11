# -*- coding: euc-jp -*-
RUBY_VERSION                     # => "1.9.1"
euc = "わかめごはん"
euc2 = euc.dup; euc2[0,3] = ""   # => ""
euc2                             # => "ごはん"
euc3 = euc.dup; euc3[3..6] = ""  # => ""
euc3                             # => "わかめ"
