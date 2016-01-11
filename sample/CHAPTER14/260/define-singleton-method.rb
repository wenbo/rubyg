class Module
# �ðۥ��饹������᥽�åɤ�������롣
  def eigenclass()  class << self; self; end  end
# ���饹�Υ��ץ������������᥽�åɡ�self�ϥ��饹���֥������ȡ�
  def define_option_switch(option, flag)
# ���饹�Υ��󥹥����ѿ����ٱ�������̤����ʤ�ж��ϥå����������롣���ץ����̾�ȥե饰���б��Ť��롣
    (@__option_switch__ ||= {})[option] = flag
# �ðۥ��饹��ʸ̮��ɾ�����롣
    eigenclass.module_eval do
# �ðۥ��饹��ʤΤǡ����饹�Υ��󥹥����ѿ��ؤΥ��������ˤʤ롣
      attr_reader :__option_switch__ # !> method redefined; discarding old __option_switch__
# ���饹�᥽�åɡ�option=�ס���option?�פ�������롣�������ѿ�option��������Τ����ס�
      define_method("#{option}=") {|bool| __option_switch__[option] = bool }
      define_method("#{option}?") { __option_switch__[option] }
    end
# ���󥹥��󥹥᥽�åɡ�option?�פ�������롣��ǥ��饹�᥽�åɤ�Ƥ�Ǥ��롣
    define_method("#{option}?") { self.class.__option_switch__[option] }
  end
end

class FooService
# ��FooService.verbose_mode=�ס���FooService.verbose_mode?�ס���FooService#verbose_mode?�פ��������롣
  define_option_switch :verbose_mode, false
  define_option_switch :compatibility_mode, true
end
foo = FooService.new
# ���饹�᥽�åɡ����󥹥��󥹥᥽�åɤ�ξ���ǸƤ٤롣
FooService.verbose_mode?   # => false
foo.verbose_mode?          # => false
foo.compatibility_mode?    # => true
FooService.__option_switch__
# => {:verbose_mode=>false, :compatibility_mode=>true}
FooService.verbose_mode = true
foo.verbose_mode?          # => true
FooService.compatibility_mode = false
foo.compatibility_mode?    # => false
FooService.__option_switch__
# => {:verbose_mode=>true, :compatibility_mode=>false}
