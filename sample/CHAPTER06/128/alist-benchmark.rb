require 'benchmark'
hash = {"one"=>1, "two"=>2, "three"=>3}
alist = [["one",1], ["two",2], ["three",3]]
Benchmark.realtime { 300000.times { hash["three"] }} # => 0.228954792022705
Benchmark.realtime { 300000.times { alist.assoc("one")[1] }} # => 0.300943851470947
Benchmark.realtime { 300000.times { alist.assoc("two")[1] }} # => 0.354169845581055
Benchmark.realtime { 300000.times { alist.assoc("three")[1] }} # => 0.378952026367188
