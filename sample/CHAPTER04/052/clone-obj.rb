a = ["a"]
def a.hoge() "singleton method!" end   # a���ðۥ᥽�å�hoge��������Ƥߤ롣
# ������������
b = a.clone             # => ["a"]
# �������Ʊ�ͤǤϤ��뤬Ʊ��ǤϤʤ���
a == b                  # => true
a.equal? b              # => false
# ��������ðۥ᥽�åɤ⥳�ԡ�����롣dup�ϥ��ԡ�����ʤ���
b.hoge                  # => "singleton method!"
a.dup.hoge rescue $!
# => #<NoMethodError: undefined method `hoge' for ["a"]:Array>
# a�����Ǥ�b�����Ǥ�Ʊ��"a"��ؤ��Ƥ�����������ԡ��ˡ�
a[0].equal? b[0]        # => true
# ���Ǥ��˲�Ū�᥽�åɤ�Ŭ�Ѥ����ξ���Ȥ���Ѥ�äƤ��ޤ��Τ���ա�
a[0].upcase!
[ a[0], b[0] ]          # => ["A", "A"]

# �������ԡ�����������᥽�åɤ�������롣
class Object
  def deep_clone() Marshal.load(Marshal.dump(self))  end
end
a = ["a"]
# �������ԡ������Ǥ⥳�ԡ�����롣
c = a.deep_clone        # => ["a"]
a[0].equal? c[0]        # => false
# �˲�Ū�᥽�åɤ�Ŭ�Ѥ��Ƥ⿼�����ԡ��ϱƶ�����ʤ���
a[0].upcase!
[ a[0], c[0] ]          # => ["A", "a"]

# ����Τ�俼�����ԡ���map��Ȥ��Ȥ�������¿������������ǤޤǤϥ��ԡ�����ʤ���
class Array
  def map_clone() map{|x| x.clone }  end
end
# Marshal�Ǥϥ��ԡ��Ǥ��ʤ��ä���Τ�map���ȤǤ��롣
a = ["a", ["b"], Proc.new{}, $stdout]
# => ["a", ["b"], #<Proc:0x895fd14@-:32>, #<IO:<STDOUT>>]
def a.hoge() "singleton method!" end
c = a.map_clone
# => ["a", ["b"], #<Proc:0x895e798@-:32>, #<IO:<STDOUT>>]
# ��������Ǥϥ��ԡ�����Ƥ��롣
a[0].equal? c[0]        # => false
# "b"��Ʊ����Τ�ؤ��Ƥ���Τ��˲�Ū�᥽�åɤ�Ŭ�Ѥ�����ξ���ѹ�����롣
a[1][0].equal? c[1][0]  # => true
