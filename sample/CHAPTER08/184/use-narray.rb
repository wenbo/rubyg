require 'rubygems'
# narrayライブラリにNarrayが定義されているので読み込む
require 'narray'
# NArrayの要素は複素数も持つことができるのでcomplexライブラリを読み込む。
require 'complex'
require 'narray-oneline-inspect' # nodisp
# Rubyの配列式のような形式でNArrayを作成する。要素次第で型が決まる。
na1 = NArray[[1.1, 2, 3], [3, 4.4, 6+3.im]]
# => NArray.complex(3,2): [[1.1+0.0i, 2.0+0.0i, 3.0+0.0i], [3.0+0.0i, 4.4+0.0i, 6.0+3.0i]]
# 次元、全要素数、次元ごとのサイズ
[ na1.dim, na1.total ]               # => [2, 6]
na1.shape                            # => [3, 2]
# インデックス参照（ネスト配列とは逆）
[ na1[2, 0], na1[1, 0], na1[0, 1] ]  # => [(3.0+0.0i), (2.0+0.0i), (3.0+0.0i)]
# 行を取り出す
na1[true, 0]     # => NArray.complex(3): [1.1+0.0i, 2.0+0.0i, 3.0+0.0i]
# 列を取り出す
na1[0, true]     # => NArray.complex(2): [1.1+0.0i, 3.0+0.0i]
# 部分配列を取り出す
na1[0..1, 0]     # => NArray.complex(2): [1.1+0.0i, 2.0+0.0i]
na1[2, 0..1]     # => NArray.complex(2): [3.0+0.0i, 6.0+3.0i]
na1[0..1, 0..1]  # => NArray.complex(2,2): [[1.1+0.0i, 2.0+0.0i], [3.0+0.0i, 4.4+0.0i]]
# 3x2の二次元配列を作成し、全要素を5で埋める。
na2  = NArray.int(3,2).fill!(5)    # => NArray.int(3,2): [[5, 5, 5], [5, 5, 5]]
na2f = NArray.float(3,2).fill!(5)  # => NArray.float(3,2): [[5.0, 5.0, 5.0], [5.0, 5.0, 5.0]]
# Rubyの配列をNArrayに変換する。
na3 = NArray.to_na [[1,1,1],[2,2,2]]  # => NArray.int(3,2): [[1, 1, 1], [2, 2, 2]]
# NArrayどうしの演算は要素ごとに行われる。
na1 + na2 + na3
# => NArray.complex(3,2): [[7.1+0.0i, 8.0+0.0i, 9.0+0.0i], [10.0+0.0i, 11.4+0.0i, 13.0+3.0i]]
# NArrayと数値の演算は、それぞれの要素と数値の演算結果のNArrayになる。
na2 * 3             # => NArray.int(3,2): [[15, 15, 15], [15, 15, 15]]
