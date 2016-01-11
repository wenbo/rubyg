unless defined? BasicObject     # for Ruby 1.8
  class BasicObject       # ����Ū�ʥ᥽�åɤ����������Ƥ��ʤ����饹
# �����Υ᥽�åɤΤߤ��������ʤ���
    METHODS = ["==", "__send__", "equal?", "__id__", "instance_eval"]
# Object���饹�����äƤ���ơ��Υ��󥹥��󥹥᥽�åɤˤ����ơ�METHODS�˴ޤޤ�Ƥ����ΰʳ��Υ᥽�å������ʤ��ä���Τˤ��롣
    (instance_methods - METHODS).each {|meth| undef_method meth }
  end
end
class Recorder < BasicObject    # �ƤФ줿�᥽�åɤ�Ͽ���Ƥ������饹
  def initialize(str)  @buf = [str]  end
  def method_missing(name, *args)
# �᥽�å�̾�Ȱ������˲�Ū�˵�Ͽ���롣
    @buf.push(name).concat(args)
# �᥽�åɥ�������Ǥ���褦��self���֤���
    self
  end
# ��Ͽ������Τ�������롣@buf�򥹥ڡ����ǤĤʤ��롣
  def __play__()  @buf.join(' ')  end
end

# ���ʸ�����Ϳ����Recorder��������롣
i = Recorder.new("I")
# ��ʸ�Υ��ڡ������.�פ��֤�������ȡ����Τޤ�Ruby������ץȤˤʤ롣
i.am.a.boy.and.I.play.baseball
# �������롣
i.__play__   # => "I am a boy and I play baseball"
my = Recorder.new("My")
# object_id��Object�Υ��󥹥��󥹥᥽�åɤ�����undef����Ƥ���Τ�method_missing���̤�褦�ˤʤ롣�����ϥ᥽�åɤˤʤ�ʤ��Τǰ����Ǥ��ޤ�����
my.object_id.is(123456)
my.__play__  # => "My object_id is 123456"
