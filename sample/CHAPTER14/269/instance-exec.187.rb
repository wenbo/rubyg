# Enumerable#each_with_index��ɤ������
class Array
  def my_each_with_index(&block)            # each_with_index��Ʊ����
    length.times {|i| yield self[i], i }
  end
  def instance_eval_each_with_index(&block) # self���Ѥ���each_with_index
    length.times {|i| instance_exec(self[i], i, &block) }
  end
end
a = [:foo, :bar]
# self�Ϥ��꤫���ʤ���
a.my_each_with_index do |x,i|
  self    # => main, main
  [x, i]  # => [:foo, 0], [:bar, 1]
end
# self��a�ˤ��꤫��롣
a.instance_eval_each_with_index do |x,i|
  self    # => [:foo, :bar], [:foo, :bar]
  length  # => 2, 2
  [x, i]  # => [:foo, 0], [:bar, 1]
end

# �᥽�å��������
Object.instance_exec(1) do |x|
  x       # => 1
# Object���ðۥ᥽�åɡʥ��饹�᥽�åɡˤ�������롣
  def cmeth() :class_method end
  self    # => Object
end
Object.module_exec(1) do |x|
  x       # => 1
# Object�Υ��󥹥��󥹥᥽�åɤ�������롣
  def imeth() :instance_method end
  self    # => Object
end
Object.cmeth       # => :class_method
Object.new.imeth   # => :instance_method
