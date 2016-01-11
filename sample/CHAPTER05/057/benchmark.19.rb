RUBY_VERSION  # => "1.9.1"
require 'benchmark'
Benchmark.bm(10) do |b|
  str = "あ" * 10000
  b.report("split")    { str.split(//).length } # かなり遅い
  b.report("scan")     { str.scan(/./).length } # かなり遅い
  b.report("count")    { str.chars.count }      # 遅い
  b.report("length")   { str.length }           # 速い
end
# >>                 user     system      total        real
# >> split       0.330000   0.000000   0.330000 (  0.340748)
# >> scan        0.180000   0.000000   0.180000 (  0.177934)
# >> count       0.000000   0.000000   0.000000 (  0.004868)
# >> length      0.000000   0.000000   0.000000 (  0.000236)
