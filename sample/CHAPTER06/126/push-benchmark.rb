require 'benchmark'
append = []
prepend = []
Benchmark.realtime{ 50000.times{|i| append << i} }       # => 0.0131382942199707
Benchmark.realtime{ 50000.times{|i| prepend.unshift i} } # => 1.43498873710632
