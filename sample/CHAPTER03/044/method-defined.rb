String.method_defined? :length         # => true
String.public_method_defined? :length  # => true
# �Ѿ������󥯥롼�ɤ������᥽�åɤǤ⿿�ˤʤ�
Array.method_defined? :map             # => true
Enumerable.method_defined? :map        # => true
# private�᥽�åɤˤ�private_method_defined?��Ȥ�ɬ�פ�����
Kernel.method_defined? :print          # => false
Kernel.private_method_defined? :print  # => true

