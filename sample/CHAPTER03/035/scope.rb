if true
  a = 1
end
# a�ϸ�����
a  # => 1
[2].each do |x|
  b = x
end
# b�ϸ����ʤ�
b rescue $!
# => #<NameError: undefined local variable or method `b' for main:Object>
