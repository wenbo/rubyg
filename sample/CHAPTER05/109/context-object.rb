require 'erubis'
template = Erubis::Eruby.new File.read("eruby.rtxt")

class Context
  attr_accessor :name, :month, :day
  # ¾�Τ�����ʥ᥽�å����...
end
context = Context.new
context.name  = "��Ӥ���"
context.month = Time.now.month
context.day   = Time.now.day
puts template.evaluate context
# >> ��Ӥ�������
# >> ������7��22���Ǥ���
