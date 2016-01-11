def print_evens(nested_array)
  nested_array.each do |inner|
    inner.each do |x|
      return unless x % 2 == 0
      p x
    end
  end
end
print_evens [[4,6],[2,1],[6,3]]
# >> 4
# >> 6
# >> 2
