class TrafficSignal             # 信号機クラス
# 信号を赤にするTrafficSignal#redを定義する。同様にyellowは黄色、greenは青にする。
  [:red, :yellow, :green].each do |state|
# stateをメソッド名にしてインスタンスメソッドを定義する。
    define_method(state) do
# ローカル変数stateは見える。define_methodのブロックでのselfはTrafficSignalのインスタンスにすり変わるので、@stateはクラスのインスタンス変数ではない。
      @state = state
    end
  end
  def initialize() green end
  attr_reader :state
end
s = TrafficSignal.new
# 最初は青。
s.state                         # => :green
# 黄色に変える。
s.yellow                        # => :yellow
s.state                         # => :yellow
# 赤に変える。
s.red                           # => :red
s.state                         # => :red
