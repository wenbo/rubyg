def block_test
  if block_given?
    yield 1,2
  else
    :no_block
  end
end

block_test {|x,y| "x=#{x} / y=#{y}" }  # => "x=1 / y=2"
block_test                             # => :no_block
