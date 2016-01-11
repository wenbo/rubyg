s = "¡ù¥Æ¥¹¥È¡ù"
s =~ /¥Æ¥¹¥È/     # => 1
s.index "¥Æ¥¹¥È"  # => 1
s.index "¡ù"      # => 0
s.index "¡ù", 1   # => 4
s.index "¡ù", -2  # => 4
s.rindex "¡ù"     # => 4
s.rindex "¡ù",2   # => 0
s.rindex "¡ù",-2  # => 0
