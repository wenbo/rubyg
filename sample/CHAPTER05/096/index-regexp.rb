#index 01234567890123
str = "Love Live Lave"
str =~ /L.ve/          # => 0
str.index(/L.ve/, 2)   # => 5
str.rindex(/L.ve/)     # => 10
str.rindex(/L.ve/, 8)  # => 5
