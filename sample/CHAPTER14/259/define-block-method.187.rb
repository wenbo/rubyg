class TrafficSignal
  [:red, :yellow, :green].each do |state|
# stateをメソッド名にしてインスタンスメソッドを定義する。Ruby 1.8.7以降ではブロックパラメータにブロックを渡せる。
    define_method(state) do |&block|
# ブロックがある場合はブロックを実行する。
      block[state] if block
      @state = state
    end
  end
  def initialize() green end
  attr_reader :state
end
s = TrafficSignal.new
s.yellow {|state| puts "Signal turned #{state}." } # => :yellow
s.red { puts "Halt!" }                             # => :red
# >> Signal turned yellow.
# >> Halt!
