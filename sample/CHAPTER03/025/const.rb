CONST = "toplevel" # �ȥåץ�٥��Object���饹�ˤ��������ϺǸ�˻��Ȥ���롣
class SuperClass
  CONST = "superclass"          # �ȥåץ�٥륯�饹�Ǥ���������
end
class AClass
  # �ͥ��Ȥγ�¦���ʤ��Τǥ����ѡ����饹��Object�ˤ���������Ȥ���롣
  CONST                         # => "toplevel"
end
class SubClass < SuperClass
  # �ͥ��Ȥγ�¦���ʤ��Τǥ����ѡ����饹��SuperClass�ˤ���������Ȥ���롣
  CONST                         # => "superclass"
end
module Nest
  CONST = "nest"                # �ͥ��Ȥ���¦��������
  class SubSubClass < SubClass
    # �ޤ��ͥ��Ȥγ�¦��ͥ��Ū�˻��Ȥ����
    CONST                       # => "nest"
  end
  # �ͥ��Ȥγ�¦���ʤ��Τǥ����ѡ����饹����������Ȥ����
  SubSubClass::CONST            # => "superclass"
  # ::���������Ϥ��ȥȥåץ�٥����������Ȥ����
  ::CONST                       # => "toplevel"
end
# �����ѡ����饹����������Ȥ����
Nest::SubSubClass::CONST        # => "superclass"
SubClass::CONST                 # => "superclass"
