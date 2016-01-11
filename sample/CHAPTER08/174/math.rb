# sin 0を求める。
Math.sin(0)     # => 0.0
# Mathモジュールをインクルードすることで数学関数が関数として使えるようになる。三角関数の角度の単位はラジアンである。
include Math
cos(PI)         # => -1.0

# 度←→ラジアン変換
# 「度→ラジアン」変換を行う「Numeric#deg」を定義する。
class Numeric
  def deg
    self * Math::PI / 180.0
  end
end
# 「ラジアン→度」変換を行う関数「Kernel#deg」を定義する。
def deg(rad)
  rad * 180.0 / Math::PI
end
# 60度をラジアンに変換する。
60.deg          # => 1.0471975511966
# 度指定で三角関数を使う。
cos(60.deg)     # => 0.5
sin(30.deg)     # => 0.5
cos(180.deg)    # => -1.0
# asin(0.5)を度で求める。
deg(asin(0.5))  # => 30.0
