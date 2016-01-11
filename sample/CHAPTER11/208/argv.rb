#!/usr/local/bin/ruby
# ARGVの内容を表示する。
p ARGV
# ARGVのインデックスと内容を表示する。
ARGV.each_with_index do |x, i|
  puts "ARGV[#{i}] = #{x.inspect}"
end
