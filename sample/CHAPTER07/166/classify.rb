require 'set'
Set.new(1..6).classify{|n| n%3 }  # => {1=>#<Set: {1, 4}>, 2=>#<Set: {2, 5}>, 0=>#<Set: {3, 6}>}
