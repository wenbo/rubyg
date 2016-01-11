str = "Summary"
# 「Summary」を3回繰り返す。
str * 3             # => "SummarySummarySummary"
# 10個の「=」を作成する。
"=" * 10            # => "=========="
# 「Summary」の周りに3個の「=」を付ける。
"="*3 + str + "="*3 # => "===Summary==="
# 幅がわかっている場合はString#centerでpaddingを設定するとよい。
str.center(9, "=")  # => "=Summary="
