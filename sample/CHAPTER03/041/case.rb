# 以下の例ではすべて"OK"と表示します。
# 同値性判定
case 1
when 0
  p "NG"
when 1, 2
  p "OK"
else
  p "NG"
end
# クラス判定（直接のインスタンスである場合）
case 1
when Fixnum
  p "OK"
end
# クラス判定（サブクラスの場合）。最初にマッチしたwhen節を評価するのでwhen Fixnumeの部分は評価されない。
case 1
when Numeric
  p "OK"
when Fixnum
  p "NG"
end
# モジュールのインクルード判定
case [1]
when Enumerable
  p "OK"
end
# 範囲に入っているか判定
case 5
when 1..10
  p "OK"
end
# 正規表現マッチ判定
case "abracadabra"
when /cad/
  p "OK"
end
# *aryは1,2,3に展開される（配列展開）
ary = [1,2,3]
case 1
when *ary
  p "OK"
end
