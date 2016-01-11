#!/usr/local/bin/ruby
# benchmarkライブラリにBenchmarkが定義されているので読み込む
require 'benchmark'
# ベンチマーク比較用ブロックを作成する。
Benchmark.bmbm do |b|     # ランダムな100000要素の降順ソートの比較
  rand_ary = Array.new(100000) { rand }
# ブロックつきsortのベンチマーク測定。
  b.report("sort with block") { rand_ary.sort{|x,y| y<=>x } }
# sort.reverseのベンチマーク測定。（最速）
  b.report("sort.reverse")    { rand_ary.sort.reverse }
# sort_byのベンチマーク測定。
  b.report("sort_by")         { rand_ary.sort_by{|x| -x } }
end
# >> Rehearsal ---------------------------------------------------
# >> sort with block   0.760000   0.000000   0.760000 (  0.762515)
# >> sort.reverse      0.410000   0.000000   0.410000 (  0.410609)
# >> sort_by           0.480000   0.010000   0.490000 (  0.494006)
# >> ------------------------------------------ total: 1.660000sec
# >> 
# >>                       user     system      total        real
# >> sort with block   0.760000   0.000000   0.760000 (  0.761990)
# >> sort.reverse      0.400000   0.010000   0.410000 (  0.401244)
# >> sort_by           0.470000   0.000000   0.470000 (  0.467279)
