module Nest
  @@cv = "nest"       # Nest�Υ��饹�ѿ��ϥͥ��Ȥ���¦�Ǥ⸫���ʤ�
  class SuperClass
    @@cv = "super"    # SuperClass�Υ��饹�ѿ���SubClass�Ȥⶦͭ�����
  end
  class SubClass < SuperClass
    @@cv              # => "super"
    @@cv = "sub"      # ���֥��饹�ǽ񤭴���
  end
  class SuperClass
    # ��ͭ����Ƥ���Τǥ����ѡ����饹�˱ƶ����ڤ�
    @@cv              # => "sub"
  end
end
