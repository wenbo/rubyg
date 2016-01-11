#  bigdecimalライブラリにBigDecimalが定義されているので読み込む。
require 'bigdecimal'
# 1.1-1.0は表示上0.1となるが、誤差により内部表現が異なるため「==」ではない。
1.1-1.0 == 0.1         # => false
1.1-1.0                # => 0.1
# そこでBigDecimalによる10進小数を作成する。「inspect」すると科学的記数法による10進小数文字列と有効桁数と最大桁数が出てくる。
a = BigDecimal("1.1")  # => #<BigDecimal:95ffb14,'0.11E1',8(8)>
b = BigDecimal("1.0")  # => #<BigDecimal:95ff934,'0.1E1',4(8)>
c = BigDecimal("0.1")  # => #<BigDecimal:95ff768,'0.1E0',4(8)>
# 10進小数なので誤差はなく「==」になる。
a-b == c     # => true
# 四則演算、剰余。
a + c        # => #<BigDecimal:95ff3e4,'0.12E1',8(20)>
a - c        # => #<BigDecimal:95ff22c,'0.1E1',4(20)>
a * c        # => #<BigDecimal:95ff074,'0.11E0',4(20)>
a / c        # => #<BigDecimal:95feebc,'0.11E2',4(24)>
a % c        # => #<BigDecimal:96ce0f4,'0.0',4(16)>
a.divmod c
# => [#<BigDecimal:937315c,'0.11E2',4(12)>, #<BigDecimal:9373184,'0.0',4(16)>]
# 累乗は整数のみしか受け付けない。
a ** 5       # => #<BigDecimal:9370e34,'0.161051E1',12(64)>
# 「to_s」で文字列化するとき、無引数の場合は科学的記数法に、"F"をつけると通常の記数法になる。
a.to_s       # => "0.11E1"
a.to_s("F")  # => "1.1"
