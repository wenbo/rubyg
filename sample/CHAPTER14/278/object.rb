# ���٤ƤΥ��֥������ȤǻȤ����ե쥯�����
s = "a_string"  # => "a_string"
s.__id__        # => 76248810
s.object_id     # => 76248810

class A;      end
class B < A;  end
b = B.new
b.class           # => B
b.instance_of? B  # => true
b.instance_of? A  # => false
b.is_a? B         # => true
b.is_a? A         # => true
b.kind_of? A      # => true
# �⥸�塼��򥤥󥯥롼�ɤ��Ƥ���Ȥ��ˤ⿿�ˤʤ롣
"a_string".kind_of? Comparable  # => true
# ((:Module#===:))��Ȥä��̷���
A === b                         # => true

b.tainted?           # => false
b.taint; b.tainted?  # => true
b.frozen?            # => false
b.freeze; b.frozen?  # => true
