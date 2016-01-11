class TrafficSignal
  [:red, :yellow, :green].each do |state|
# state��᥽�å�̾�ˤ��ƥ��󥹥��󥹥᥽�åɤ�������롣Ruby 1.8.6��������ʸ������޲𤷤�Module#module_eval����Ѥ���ɬ�פ����롣�ʤ��������Ǥ�Kernel#eval�Ǥ⹽��ʤ���
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
# �������Ѥ��롣���ΤȤ���å�������Ĥ��롣
s.yellow {|state| puts "Signal turned #{state}." } # => :yellow
# �֤��Ѥ��롣
s.red { puts "Halt!" }                             # => :red
# >> Signal turned yellow.
# >> Halt!
