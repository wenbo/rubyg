# 条件式の結果がvarに代入され、条件分岐される。andとorは優先順位が最低。
var = 1 < 10 and "ok"           # => "ok"
var                             # => true
var = 20 < 10 and "ok"          # => false
var                             # => false
var = 1 < 10 or "NG"            # => true
var                             # => true
var = 20 < 10 or "NG"           # => "NG"
var                             # => false
# 条件式全体の結果がvarに代入される。<の方が優先順位が高い。
var = 1 < 10 && "ok"            # => "ok"
var                             # => "ok"
var = 20 < 10 && "ok"           # => false
var                             # => false
var = 1 < 10 || "NG"            # => true
var                             # => true
var = 20 < 10 || "NG"           # => "NG"
var                             # => "NG"
