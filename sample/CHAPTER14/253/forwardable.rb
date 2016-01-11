# forwardable�饤�֥���Forwardable���������Ƥ���Τ��ɤ߹���
require 'forwardable'
class Stack
  def initialize()  @ary = []   end
# ���饹�᥽�åɤ��ɲä��뤿��extend���롣
  extend Forwardable
# ��push�ס���pop�ס���empty?�ץ᥽�åɤ�@ary�ؤΰѾ���Ȥä�������롣
  def_delegators(:@ary, :push, :pop, :empty?)
# ��peek�ץ᥽�åɤ�@ary�ؤΰѾ���Ȥä�������롣��@ary.last�פ�¹Ԥ����롣
  def_delegator(:@ary, :last, :peek)
end

stack = Stack.new
# ��̩�ʥ����å��Ȥ���Ư����
stack.push 1
stack.push 2
stack.empty?  # => false
stack.peek    # => 2
stack.pop     # => 2
stack.pop     # => 1
stack.empty?  # => true
stack.length rescue $!
# => #<NoMethodError: undefined method `length' for #<Stack:0x8f19174 @ary=[]>>
# last�ǤϤʤ���peek���������Ƥ��롣
stack.last rescue $!
# => #<NoMethodError: undefined method `last' for #<Stack:0x8f19174 @ary=[]>>
