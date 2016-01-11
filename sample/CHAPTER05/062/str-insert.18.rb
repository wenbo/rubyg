#!/usr/local/bin/ruby -Ke
euc = "Ｃコンパイラ"
# インデックス2の直前に「++」を挿入する。
euc1 = euc.dup; euc1.insert 2, "++" # => "Ｃ++コンパイラ"
euc1                                # => "Ｃ++コンパイラ"
# 別解。
euc2 = euc.dup; euc2[2,0] = "++"    # => "++"
euc2                                # => "Ｃ++コンパイラ"
