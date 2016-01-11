# 全てが2以上であるかどうか。
[1,2,3].all?{|x| x >= 2}    # => false
[2,3,4].all?{|x| x >= 2}    # => true
# どれかが4以上であるかどうか。
[1,2,3].any?{|x| x >= 4}    # => false
[2,3,4].any?{|x| x >= 4}    # => true
# ブロックなし「Enumerable#all?」は&の一般化。
[true, true, true].all?     # => true
[true, false, true].all?    # => false
# ブロックなし「Enumerable#any?」は|の一般化。
[false, true, true].any?    # => true
[false, false, false].any?  # => false
# ブロック評価回数を数えると、結果が確定した時点で結果を返していることがわかる。
eval_count = 0              # ブロック評価回数
[10,1,2].any?{|x| eval_count +=1; x >= 4}  # => true
eval_count                                 # => 1
