RUBY_VERSION     # => "1.9.1"
a = 1, 2; a      # => [1, 2]
def btest1() yield 1, 2 end
# ���ξ��2�ϼΤƤ���
btest1 {|x| x }  # => 1
def btest2() yield [1, 2] end
btest2 {|x| x }  # => [1, 2]
