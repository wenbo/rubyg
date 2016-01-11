require 'benchmark'
hash = (1..1000).inject({}){|h,i| h[rand]=i; h}
inv = hash.invert
Benchmark.realtime{ 10000.times{ hash.invert }}     # => 4.85482215881348
Benchmark.realtime{ 10000.times{ hash.index 777 }}  # => 0.830416917800903
Benchmark.realtime{ 10000.times{ inv[777] }}        # => 0.00696682929992676
