require 'forwardable'
class Stack                     # �����å����饹
# �����å��ξ��֤�ɽ�����뤿�������������ǤΤ����Ѥ����ΤǸ�������Ƥ��ʤ���
  def initialize()  @ary = []  end
# �����å�������push�ס���pop�ס���empty?�ס���peek�פ�Ѿ����Ѥ���������롣
  extend Forwardable
  def_delegators(:@ary, :push, :pop, :empty?)
  def_delegator(:@ary, :last, :peek)
end
stack = Stack.new
stack.push 1
# ���󥹥����ѿ����������Ƥ���Ȥ���true���֤���
stack.instance_variable_defined? :@ary  # => true
# ���λ��Υ����å��ξ��֤򸫤롣
stack.instance_variable_get :@ary       # => [1]
stack.push 2
stack.instance_variable_get :@ary       # => [1, 2]
stack.pop                               # => 2
stack.pop                               # => 1
stack.instance_variable_get :@ary       # => []
# �����å��ξ��֤�̵�������ѹ����롣
stack.instance_variable_set :@ary, [1,2,3]
stack.pop                               # => 3
