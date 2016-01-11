class TrafficSignal
  [:red, :yellow, :green].each do |state|
# stateをメソッド名にしてインスタンスメソッドを定義する。Ruby 1.8.6以前だと文字列を媒介してModule#module_evalを使用する必要がある。なお、ここではKernel#evalでも構わない。
    module_eval %{
      def #{state}(&block)
        block[#{state}] if block
        @state = :#{state}
      end
    }
  end
  def initialize() green end
  attr_reader :state
end
s = TrafficSignal.new
# 黄色に変える。そのときメッセージをつける。
s.yellow {|state| puts "Signal turned #{state}." } # => :yellow
# 赤に変える。
s.red { puts "Halt!" }                             # => :red
# >> Signal turned yellow.
# >> Halt!
