class TrafficSignal
  [:red, :yellow, :green].each do |state|
# state��᥽�å�̾�ˤ��ƥ��󥹥��󥹥᥽�åɤ�������롣Ruby 1.8.7�ʹߤǤϥ֥�å��ѥ�᡼���˥֥�å����Ϥ��롣
    define_method(state) do |&block|
# �֥�å���������ϥ֥�å���¹Ԥ��롣
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
