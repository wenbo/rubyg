ary = []
# 「push」と「pop」が対応している。配列の末尾に作用する。
ary.push(1,2,3)                      # => [1, 2, 3]
ary.pop                              # => 3
ary                                  # => [1, 2]
ary.pop 2                            # => [1, 2]
ary                                  # => []
# 取り除く要素がなくなった場合はnilを返す。
ary.pop                              # => nil

ary = []
# 「unshift」と「shift」が対応している。配列の先頭に作用する。
ary.unshift(1).unshift(2).unshift(3) # => [3, 2, 1]
ary.shift                            # => 3
ary                                  # => [2, 1]
ary.shift 2                          # => [2, 1]
ary                                  # => []
# 取り除く要素がなくなった場合はnilを返す。
ary.shift                            # => nil
