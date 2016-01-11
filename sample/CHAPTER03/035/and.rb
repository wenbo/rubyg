def block_arg_test(&block)
  block.call 1   # block[1] でもよい
  yield 2        # 当然yieldも使える
end
block_arg_test {|x| p x }
# >> 1
# >> 2
