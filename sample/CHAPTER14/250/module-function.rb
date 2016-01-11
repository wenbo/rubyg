module Foo
  def double(x)    x*2 end
# double�Τߤ�⥸�塼��ؿ��ˤ��롣
  module_function :double
# �⥸�塼��ؿ��Υ����ꥢ�����������ˤϡ�alias�θ��module_function��ɬ�ס�
  alias :twice :double
  module_function :twice
# Foo�⥸�塼��ΰʲ��Υ᥽�åɤ��٤Ƥ�⥸�塼��ؿ��ˤ��롣
  module_function
  def triple(x)    x*3 end
  def quadruple(x) x*4 end
end
class Bar
# �⥸�塼��ؿ��ϥ⥸�塼���include���ƴؿ�Ū�᥽�åɤȤ��ƻȤ��롣
  include Foo
  def eight_times(x) double(quadruple(x)) end
end
# �⥸�塼����ðۥ᥽�åɤȤ��Ƥ�Ȥ��롣
Foo.double(3)           # => 6
Bar.new.eight_times(8)  # => 64
