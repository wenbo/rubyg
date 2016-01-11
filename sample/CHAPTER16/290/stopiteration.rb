RUBY_VERSION                    # => "1.8.7"
loop do
  raise StopIteration
  puts "not reached 1"
end
puts "exit"

while true
  raise StopIteration
end
puts "not reached 2"
# ~> -:9: StopIteration (StopIteration)
# >> exit
