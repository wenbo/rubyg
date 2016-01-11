# -*- coding: euc-jp -*-
euc = "るびぃすと"
# 同じバイト列かつ同じエンコーディングである場合に==になる。
euc == "るびぃすと"                             # => true
euc == euc.encode("Shift_JIS")                  # => false
# 同じバイト列もで異なるエンコーディングだと==にはならない。この場合はEUC-JP文字列をShift_JISとみなしている。
euc == euc.dup.force_encoding("Shift_JIS")      # => false
# 異なるエンコーディングの文字列比較は許されている。
euc <=> euc.dup.force_encoding("Shift_JIS")     # => -1
euc <=> euc.encode("Shift_JIS")                 # => 1
# ASCII文字だけからなる文字列はエンコーディングが異なっても==になる。
"a".encode("Shift_JIS") == "a".encode("UTF-8")  # => true
