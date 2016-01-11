# -*- coding: euc-jp -*-
require 'kconv'
s = "日本語です。"
s.encoding                # => #<Encoding:EUC-JP>
s.tosjis.encoding         # => #<Encoding:Shift_JIS>
NKF.nkf("-w",s).encoding  # => #<Encoding:UTF-8>
