require 'rubygems'
require 'active_support'

class Super
  @@a = 1
  @@b = 2
  cattr_reader :a    # @@a�ؤ��ɤ߹��ߥ�������
  cattr_writer :a    # @@a�ؤν񤭹��ߥ�������
  cattr_accessor :b  # @@b�ؤ��ɤ߽񤭥�������
end
class Sub < Super; end

# ���饹�᥽�åɤ��������롣
Sub.a                # => 1
Sub.a = 10; Sub.a    # => 10
# ���֥��饹�ǽ񤭴�����ȥ����ѡ����饹�˱ƶ����Ф롣
Sub.b                # => 2
Sub.b = 20; Super.b  # => 20
sup = Super.new
sub = Sub.new
# ���󥹥��󥹥᥽�åɤ��������롣
sub.a                # => 10
sub.a = 100; sub.a   # => 100
# ���֥��饹�ǽ񤭴�����ȥ����ѡ����饹�˱ƶ����Ф롣��Ʊ���դ������ǡ�
sub.b                # => 20
sub.b = 200; sup.b   # => 200
