ary = [1]
hash = {ary => :ok}
hash[[1]]                   # => :ok
# キーはコピーされない。
hash.keys.first.equal? ary  # => true
# キーを書き換えるとハッシュ値が狂うので値を取り出せなくなる！
ary[0] = 2; ary             # => [2]
hash                        # => {[2]=>:ok}
hash[ary]                   # => nil
hash[[2]]                   # => nil
