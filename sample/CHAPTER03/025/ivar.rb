self            # => main
@main = "main"  # �ȥåץ�٥�ʤ�ɤ��Ǥ��ɤ߽񤭤Ǥ��롣main��°���Ƥ��롣

class Hoge
  @class_ivar = "instance variable of Hoge" # ���饹�Υ��󥹥����ѿ���
  def self.cmeth           # ���饹�᥽�åɤʤΤ�@class_ivar�ϸ����롣
    @class_ivar # => "instance variable of Hoge"
  end
  # ���饹�����ʸ̮�ʤΤ�@class_ivar�ϸ����롣
  @class_ivar   # => "instance variable of Hoge"
  def initialize
    @ivar = "ivar"         # ���֥������ȤΥ��󥹥����ѿ���
  end
  def imeth
    # @ivar�ϸ�����
    @ivar       # => "ivar"
    # @class_ivar�ϸ����ʤ���̤����ʤΤ�nil�Ȥʤ롣
    @class_ivar # => nil # !> instance variable @class_ivar not initialized
  end
end
Hoge.cmeth
Hoge.new.imeth
