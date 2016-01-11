require 'benchmark'
n = 100000
pop = Array.new n, 1.0
shift = Array.new n, 1.0
Benchmark.realtime{ n.times{pop.pop}} # => 0.0318443775177002
Benchmark.realtime{ n.times{shift.shift}} # => 0.0318043231964111

