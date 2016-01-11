# -*- coding: euc-jp -*-
euc = "Ｃコンパイラ"
# インデックス1の直前に「++」を挿入する。
euc1 = euc.dup; euc1.insert 1, "++" # => "Ｃ++コンパイラ"
euc1                                # => "Ｃ++コンパイラ"
# 別解。
euc2 = euc.dup; euc2[1,0] = "++"    # => "++"
euc2                                # => "Ｃ++コンパイラ"
# エンコーディングが異なるのでエラーになる。
euc3 = euc.dup
sjis = "言語".encode("Shift_JIS")
euc3.insert 1, sjis rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
