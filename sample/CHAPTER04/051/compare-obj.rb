1 <=> 2                      # => -1
1 <=> 1                      # => 0
2 <=> 1                      # => 1
3.between?(1,3)              # => true
# 数値として比較
2 < 10                       # => true
# 文字列として比較
"2" < "10"                   # => false
"abc" < "def"                # => true
"def".between?("abc","ghi")  # => true
# クラス・モジュールは特化した方が「小さい」
Array <=> Object             # => -1
Array < Object               # => true
Object < Array               # => false
Array < Enumerable           # => true
# 直接関係のないクラス・モジュールを比較したらnilになる
Hash <=> Array               # => nil
Hash < Array                 # => nil
