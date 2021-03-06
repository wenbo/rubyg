# 整数文字列の変換例。
[ "10".to_i,   "10".to_f ]        # => [10, 10.0]
[ Integer("10"), Float("10") ]    # => [10, 10.0]
# 小数文字列の変換例。
[ "1.11".to_i, "1.11".to_f ]      # => [1, 1.11]
[ "-1.11".to_i, "-1.11".to_f ]    # => [-1, -1.11]
[ "+1.11".to_i, "+1.11".to_f ]    # => [1, 1.11]
# _を数字の区切りに使うことができる。
[ "+1_1_2".to_i, "+1_1_2".to_f ]  # => [112, 112.0]
# 先頭の0がついた例。前者は10進数、後者は8進数とみなす。
[ "0010".to_i, Integer("0010") ]  # => [10, 8]
# 科学的記数法の例。
[ "2.0e3".to_f, Float("2.0e3") ]  # => [2000.0, 2000.0]
# 基数プレフィクスの誤例。
[ "0b11".to_i, "0o11".to_i, "011".to_i, "0x32".to_i ]             # => [0, 0, 11, 0]
# 2進文字列の変換例。
[ "0b11".to_i(0), "0b11".to_i(2), "11".to_i(2), Integer("0b11") ] # => [3, 3, 3, 3]
# 8進文字列の変換例。
[ "0o11".to_i(0), "0o11".to_i(8), "11".to_i(8) ]                   # => [9, 9, 9]
[ "011".to_i(0), "011".to_i(8), Integer("0o11"), Integer("011") ]  # => [9, 9, 9, 9]
[ "011".oct, "11".oct, "0o11".oct ]                                # => [9, 9, 9]
# 16進文字列の変換例。
[ "0x32".to_i(0), "0x32".to_i(16), "32".to_i(16) ]   # => [50, 50, 50]
[ "0x32".hex, "32".hex, Integer("0x32") ]            # => [50, 50, 50]
# 36進文字列の変換例。基数は2〜36が指定できる。
"yzz".to_i(36)   # => 45359
# ゴミが含まれた例。
"32xxhe1".to_i   # => 32
Integer("32xxhe1") rescue $! # => #<ArgumentError: invalid value for Integer: "32xxhe1">
