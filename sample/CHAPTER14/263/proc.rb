# ��¦�Υ������ѿ����Ф����ư
outer = :outer
# �᥽�åɤϳ�¦�Υ������ѿ��������ʤ���
def meth()  outer rescue $!  end
meth  # => #<NameError: undefined local variable or method `outer' for main:Object>
[1].each do |x|
  outer  # => :outer
end
# �֥�å��դ��᥽�åɤΤ褦�˳����Υ������ѿ��������롣
f = lambda do
  outer  # => :outer
end
f.call   # => :outer
# Ʊ��������ʣ���ξ��˽񤯾��
def cat(x)
# Ʊ��������ʣ���ξ��˽񤯾��ϡ�Proc��������Ƥ����Ƥ֤�DRY��§����롣
  action = lambda { puts "<#{x}> Meow" }
  action.call if x == 1
  action.call if x < 3
end
cat 0
cat 1
# >> <0> Meow
# >> <1> Meow
# >> <1> Meow
