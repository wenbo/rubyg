def add(output)   output << "1" << "2"   end
add $stdout
add ""  # => "12"
add []  # => ["1", "2"]
# >> 12
