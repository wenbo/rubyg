#!/usr/local/bin/ruby -Ke
# 英語、数学、国語のテストの点数を出席番号順に採点している
# この部分はデータなので本来は別ファイルにするのが望ましい
NAMES = %w[Dave Andy Jay Jack]
ENGLISH  = [77,88,65,39]
MATH     = [79,75,76,99]
JAPANESE = [76,45,34,65]
# ここが本題で「zip」のレシーバはEnumerableになっている
# ブロックにそれぞれ「出席番号」、「名前」、「英語の点数」、「数学の点数」、「国語の点数」が渡される
(1..(NAMES.length)).zip(NAMES, ENGLISH, MATH, JAPANESE) do |n,name,e,m,j|
  printf "出席番号:%d 名前:%4s 英語:%d 数学:%d 国語:%d 合計:%d\n", n, name, e, m, j, e+m+j
end
# >> 出席番号:1 名前:Dave 英語:77 数学:79 国語:76 合計:232
# >> 出席番号:2 名前:Andy 英語:88 数学:75 国語:45 合計:208
# >> 出席番号:3 名前: Jay 英語:65 数学:76 国語:34 合計:175
# >> 出席番号:4 名前:Jack 英語:39 数学:99 国語:65 合計:203
