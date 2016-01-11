RUBY_VERSION  # => "1.9.1"
require 'benchmark'
Benchmark.bm(10) do |b|
  str = "��" * 10000
  b.report("split")    { str.split(//).length } # ���ʤ��٤�
  b.report("scan")     { str.scan(/./).length } # ���ʤ��٤�
  b.report("count")    { str.chars.count }      # �٤�
  b.report("length")   { str.length }           # ®��
end
# >>                 user     system      total        real
# >> split       0.330000   0.000000   0.330000 (  0.340748)
# >> scan        0.180000   0.000000   0.180000 (  0.177934)
# >> count       0.000000   0.000000   0.000000 (  0.004868)
# >> length      0.000000   0.000000   0.000000 (  0.000236)
