def block_arg_test(&block)
  block.call 1   # block[1] �Ǥ�褤
  yield 2        # ����yield��Ȥ���
end
block_arg_test {|x| p x }
# >> 1
# >> 2
