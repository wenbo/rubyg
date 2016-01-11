# 「Hash.new」の引数でデフォルト値を設定する。
h1 = Hash.new(0)
# デフォルト値は値が設定されていない場合に使われる。
h1[:not_exist]  # => 0
# ((:Hash#default:))、((:Hash#default=:))でデフォルト値を参照・更新できる。
h1.default      # => 0
h1.default = 1  # => 1
h1[:not_exist]  # => 1

# デフォルト値をfreezeすることで破壊的メソッドから守る。Ruby 1.8ではTypeErrorが、Ruby 1.9ではRuntimeErrorが発生する。
h2 = Hash.new("default".freeze)
h2[:not_exist]  # => "default"
h2[:not_exist].upcase! rescue $!  # => #<RuntimeError: can't modify frozen string>

# デフォルト値をブロックで指定することができる。
h3 = Hash.new {|h,k| h[k] = "default" }
# 値が設定されていないのでブロックが評価される。
h3[:not_exist]  # => "default"
h3  # => {:not_exist=>"default"}
# ブロックを使えば破壊的メソッドにも対応できる。
h3[:not_exist2].upcase!
h3  # => {:not_exist=>"default", :not_exist2=>"DEFAULT"}
h3[:not_exist3]  # => "default"
h3  # => {:not_exist=>"default", :not_exist2=>"DEFAULT", :not_exist3=>"default"}
