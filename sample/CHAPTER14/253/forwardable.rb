# forwardableライブラリにForwardableが定義されているので読み込む
require 'forwardable'
class Stack
  def initialize()  @ary = []   end
# クラスメソッドを追加するためextendする。
  extend Forwardable
# 「push」、「pop」、「empty?」メソッドを@aryへの委譲を使って定義する。
  def_delegators(:@ary, :push, :pop, :empty?)
# 「peek」メソッドを@aryへの委譲を使って定義する。「@ary.last」を実行させる。
  def_delegator(:@ary, :last, :peek)
end

stack = Stack.new
# 厳密なスタックとして働く。
stack.push 1
stack.push 2
stack.empty?  # => false
stack.peek    # => 2
stack.pop     # => 2
stack.pop     # => 1
stack.empty?  # => true
stack.length rescue $!
# => #<NoMethodError: undefined method `length' for #<Stack:0x8f19174 @ary=[]>>
# lastではなくてpeekで定義されている。
stack.last rescue $!
# => #<NoMethodError: undefined method `last' for #<Stack:0x8f19174 @ary=[]>>
