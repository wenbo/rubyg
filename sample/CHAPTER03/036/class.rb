class Foo       # ����϶�
end
# Foo���饹�����Foo����������Ƥ���
Foo             # => Foo
defined? Foo    # => "constant"
# Foo�ϥ��饹���֥�������
Foo.class       # => Class
# �����ѡ����饹��Object
Foo.superclass  # => Object

class Bar < Foo # Foo��Ѿ�����
end
Bar.superclass  # => Foo
