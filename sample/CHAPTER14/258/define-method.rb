class TrafficSignal             # ���浡���饹
# ������֤ˤ���TrafficSignal#red��������롣Ʊ�ͤ�yellow�ϲ�����green���Ĥˤ��롣
  [:red, :yellow, :green].each do |state|
# state��᥽�å�̾�ˤ��ƥ��󥹥��󥹥᥽�åɤ�������롣
    define_method(state) do
# �������ѿ�state�ϸ����롣define_method�Υ֥�å��Ǥ�self��TrafficSignal�Υ��󥹥��󥹤ˤ����Ѥ��Τǡ�@state�ϥ��饹�Υ��󥹥����ѿ��ǤϤʤ���
      @state = state
    end
  end
  def initialize() green end
  attr_reader :state
end
s = TrafficSignal.new
# �ǽ���ġ�
s.state                         # => :green
# �������Ѥ��롣
s.yellow                        # => :yellow
s.state                         # => :yellow
# �֤��Ѥ��롣
s.red                           # => :red
s.state                         # => :red
