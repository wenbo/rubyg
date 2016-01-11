require 'erb'
require 'erubis'
class ErubyMethodTest
  template = 'Hello <%=name %>!'
  ERB_OBJ = ERB.new template
  ERUBIS_OBJ = Erubis::Eruby.new template

# ERB�ǥ���ѥ��뤵�줿eRuby������ץȤ�ErubyMethodTest#erb_method��������롣
  ERB_OBJ.def_method self, 'erb_method(name)'
# Erubis�ǥ���ѥ��뤵�줿eRuby������ץȤ�ErubyMethodTest#erubis_method��������롣
  ERUBIS_OBJ.def_method self, 'erubis_method(name)'

# �ðۥ��饹�򳫤��С����饹�᥽�åɤ�����Ǥ��롣
  class << self
    ERB_OBJ.def_method self, 'erb_class_method(name)'
    ERUBIS_OBJ.def_method self, 'erubis_class_method(name)'
  end
end

obj = ErubyMethodTest.new
# �̾�Υ��󥹥��󥹥᥽�åɤȤ��ƸƤӽФ����Ȥ��Ǥ��롣
obj.erb_method "rubikitch"  # => "Hello rubikitch!"
obj.erubis_method "all"     # => "Hello all!"
# �̾�Υ��饹�᥽�åɤȤ��ƸƤӽФ����Ȥ��Ǥ��롣
ErubyMethodTest.erb_class_method "eigenclass"    # => "Hello eigenclass!"
ErubyMethodTest.erubis_class_method "metaclass"  # => "Hello metaclass!"
