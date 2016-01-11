require 'forwardable'
class Stack                     # スタッククラス
# スタックの状態を表現するための配列は内部でのみ利用されるので公開されていない。
  def initialize()  @ary = []  end
# スタックの操作「push」、「pop」、「empty?」、「peek」を委譲を用いて定義する。
  extend Forwardable
  def_delegators(:@ary, :push, :pop, :empty?)
  def_delegator(:@ary, :last, :peek)
end
stack = Stack.new
stack.push 1
# インスタンス変数が定義されているときにtrueを返す。
stack.instance_variable_defined? :@ary  # => true
# その時のスタックの状態を見る。
stack.instance_variable_get :@ary       # => [1]
stack.push 2
stack.instance_variable_get :@ary       # => [1, 2]
stack.pop                               # => 2
stack.pop                               # => 1
stack.instance_variable_get :@ary       # => []
# スタックの状態を無理矢理変更する。
stack.instance_variable_set :@ary, [1,2,3]
stack.pop                               # => 3
