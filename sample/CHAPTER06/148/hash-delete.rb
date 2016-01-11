hash = { 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five" }
# 5=>"five"を取り除く。取り除いた値が返る。
hash.delete(5)  # => "five"
hash            # => {1=>"one", 2=>"two", 3=>"three", 4=>"four"}
# 取り除くキーが存在しない場合はnilが返る。
hash.delete(5)  # => nil
# 取り除くキーが存在しない場合はブロックの評価結果が返る。
hash.delete(5) {|key| "key(#{key}) is not found" } # => "key(5) is not found"
# ブロックがついていても、取り除くキーが存在すればその値が返る。
hash.delete(4) {|key| "key(#{key}) is not found" } # => "four"
hash  # => {1=>"one", 2=>"two", 3=>"three"}
# ブロックで指定した条件を満たす要素が取り除かれ、常にselfが返る。
hash.delete_if {|key,value| key == 3 and value == "three" } # => {1=>"one", 2=>"two"}
hash  # => {1=>"one", 2=>"two"}
# 「Hash#reject!」は「Hash#delete_if」と同じく条件を満たす要素が取り除かれるが、取り除く要素が存在しない場合はnilが返る。そうでなければselfが返る。
hash.reject! {|key,value| key == 3 and value == "three" } # => nil
hash                                                      # => {1=>"one", 2=>"two"}
# 「Hash#reject」は非破壊的メソッド。
hash.reject {|key,value| key == 2 }  # => {1=>"one"}
hash                                 # => {1=>"one", 2=>"two"}
