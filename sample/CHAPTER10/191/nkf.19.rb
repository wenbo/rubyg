# -*- coding: euc-jp -*-
require 'kconv'
s = "���ܸ�Ǥ���"
s.encoding                # => #<Encoding:EUC-JP>
s.tosjis.encoding         # => #<Encoding:Shift_JIS>
NKF.nkf("-w",s).encoding  # => #<Encoding:UTF-8>
