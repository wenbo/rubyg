#!/usr/local/bin/ruby
# ARGV�����Ƥ�ɽ�����롣
p ARGV
# ARGV�Υ���ǥå��������Ƥ�ɽ�����롣
ARGV.each_with_index do |x, i|
  puts "ARGV[#{i}] = #{x.inspect}"
end
