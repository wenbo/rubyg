def esc1(txt)            # 4回gsubを使っている
  txt.gsub(/&/, "&amp;").gsub(/\"/, "&quot;").gsub(/>/, "&gt;").gsub(/</, "&lt;")
end
ESCAPE_TABLE = { '&'=>'&amp;', '<'=>'&lt;', '>'=>'&gt;', '"'=>'&quot;' }
def esc2(txt)            # ハッシュテーブルを使って1回のgsubにまとめる
  txt.gsub(/[&<>"]/) { |s| ESCAPE_TABLE[s] }
end

require 'benchmark'
puts "Benchmark in Ruby #{RUBY_VERSION}"
Benchmark.bm(10) do |b|
  txt_60kb = File.read "noreplace.txt"
  txt_75kb = File.read "/usr/local/lib/ruby/1.9.0/cgi.rb"
  txt_2_8mb = File.read "/r/memo/diary.rd"
  b.report("esc1 60KB") { 10.times { esc1(txt_60kb) }}
  b.report("esc2 60KB") { 10.times { esc2(txt_60kb) }}
  b.report("esc1 75KB") { 10.times { esc1(txt_75kb) }}
  b.report("esc2 75KB") { 10.times { esc2(txt_75kb) }}
  b.report("esc1 2.8MB") { esc1(txt_2_8mb) }
  b.report("esc2 2.8MB") { esc2(txt_2_8mb) }
end
# >> Benchmark in Ruby 1.9.0
# >>                 user     system      total        real
# >> esc1 60KB   0.050000   0.000000   0.050000 (  0.044363)
# >> esc2 60KB   0.010000   0.000000   0.010000 (  0.011789)
# >> esc1 75KB   0.100000   0.000000   0.100000 (  0.103492)
# >> esc2 75KB   0.060000   0.000000   0.060000 (  0.060934)
# >> esc1 2.8MB  0.320000   0.020000   0.340000 (  0.341931)
# >> esc2 2.8MB  0.130000   0.000000   0.130000 (  0.126310)
