require 'benchmark'
# 最後の1はirbの表示抑制
randary = Array.new(100000){rand}; 1
# 通常のソート
Benchmark.realtime{ randary.sort }               # => 0.410367012023926
# Arrayの反転は一瞬でできる
Benchmark.realtime{ randary.reverse }            # => 0.00122284889221191
# だから降順ソートはsort.reverseが最速
Benchmark.realtime{ randary.sort.reverse }       # => 0.400442123413086
Benchmark.realtime{ randary.sort{|a,b| b<=>a} }  # => 2.38153600692749
Benchmark.realtime{ randary.sort_by{|a| -a} }    # => 0.59135890007019
