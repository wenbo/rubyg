def array_each(ary, &block)
  ary.each(&block)
end
array_each([1,2]){|x| p x }
# >> 1
# >> 2
