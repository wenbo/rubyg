#!/usr/local/bin/ruby
re = Regexp.new(ARGV.shift)
puts ARGF.grep(re)
