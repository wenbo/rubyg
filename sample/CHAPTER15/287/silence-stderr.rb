require 'rubygems'
require 'active_support'
puts 1
# 2�Ͻ��Ϥ���ʤ���
silence_stream(STDOUT) { puts 2 }
puts 3
# >> 1
# >> 3
