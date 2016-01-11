a = "FROZEN".freeze
old_a = a
a += " object"  # => "FROZEN object"
a.frozen?       # => false
old_a           # => "FROZEN"
old_a.frozen?   # => true
