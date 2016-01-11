RUBY_VERSION  # => "1.8.7"
hash = { "one"=>1, "two"=>2 }
hash.each do |key_value|
  key_value   # => ["two", 2], ["one", 1]
end
hash.each_pair do |key_value| # !> multiple values for a block parameter (2 for 1)
  key_value   # => ["two", 2], ["one", 1]
end 
