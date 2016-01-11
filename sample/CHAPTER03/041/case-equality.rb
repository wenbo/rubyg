# 同値性判定
0 === 1                  # => false
1 === 1 or 2 === 1       # => true
# クラス判定（直接のインスタンスである場合）
Fixnum === 1             # => true
# クラス判定（サブクラスの場合）
Numeric === 1            # => true
# モジュールのインクルード判定
Enumerable === [1]       # => true
# 範囲に入っているか判定
(1..10) === 5            # => true
# 正規表現マッチ判定
/cad/ === "abracadabra"  # => true
