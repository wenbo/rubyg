class Module
  def def_each(*methods, &block) # Ϣ³Ū�˥᥽�åɤ��������᥽�å�
# �����˻��ꤵ�줿�ơ��Υ���ܥ���Ф��ơ�
    methods.each do |meth|
# �᥽�åɤ�������롣
      define_method(meth) do |*args|
# �֥�å���᥽�åɤ�ʸ̮��ɾ�����롣
        instance_exec(meth, *args, &block)
      end
    end
  end
end

class TrafficSignal              # ���浡���饹
# TrafficSignal#red��TrafficSignal#yellow��TrafficSignal#green��������롣
  def_each :red, :yellow, :green do |state|
    @state = state
  end
# TrafficSignal#red?��TrafficSignal#yellow?��TrafficSignal#green?��������롣
  def_each :red?, :yellow?, :green? do |predicate|
    # predicate�ϥ���ܥ�ʤΤ�ʸ���󲽤��������Ρ�?�פ��ꡢ����ܥ벽���롣
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
