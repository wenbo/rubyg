# ���󥹥����ѿ���ޤ�⥸�塼���������롣
module M
  def mult(x) @v * x end
end
# ̵̾���饹��������롣
klass = Class.new do
# M�򥤥󥯥롼�ɤ��롣
  include M
# ���󥹥����ѿ�@v�˥���������ǽ�ˤ��롣
  attr_accessor :v
end
obj = klass.new  # => #<#<Class:0x97abeb8>:0x97abdc8>
obj.v = 7
obj.mult(10)     # => 70
