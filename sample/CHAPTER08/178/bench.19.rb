("air".."fairy").count    # => 2765082
require 'benchmark'
Benchmark.bm(20) do |b|
  b.report("between?") { 100.times{ "elf".between?("air","fairy") }}
  b.report("include?") { 100.times{ ("air".."fairy").include? "elf" }}
  b.report("case")     { 100.times{ case "elf" when "air".."fairy" then 1 end }}
  b.report("cover?")   { 100.times { ("air".."fairy").cover? "elf"}}
end
# >>                           user     system      total        real
# >> between?              0.000000   0.000000   0.000000 (  0.000123)
# >> include?              0.320000   0.000000   0.320000 (  0.317882)
# >> case                  0.320000   0.000000   0.320000 (  0.320717)
# >> cover?                0.000000   0.000000   0.000000 (  0.000192)
