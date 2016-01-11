class Module
  def def_each(*methods, &block) # 連続的にメソッドを定義するメソッド
# 引数に指定された各々のシンボルに対して、
    methods.each do |meth|
# メソッドを定義する。
      define_method(meth) do |*args|
# ブロックをメソッドの文脈で評価する。
        instance_exec(meth, *args, &block)
      end
    end
  end
end

class TrafficSignal              # 信号機クラス
# TrafficSignal#red、TrafficSignal#yellow、TrafficSignal#greenを定義する。
  def_each :red, :yellow, :green do |state|
    @state = state
  end
# TrafficSignal#red?、TrafficSignal#yellow?、TrafficSignal#green?を定義する。
  def_each :red?, :yellow?, :green? do |predicate|
    # predicateはシンボルなので文字列化して末尾の「?」を取り、シンボル化する。
    state == predicate.to_s.chop.to_sym
  end
  def initialize() green end
  attr_reader :state
end
s = TrafficSignal.new
s.state     # => :green
s.yellow    # => :yellow
s.yellow?   # => true
s.red?      # => false
