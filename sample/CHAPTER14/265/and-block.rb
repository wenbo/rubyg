# ��Enumerable#map�פ��Ѵ�������̤��Array#join�פǤĤʤ����Enumerable#mapconcat�פ����������
module Enumerable
# �֥�å���map�˴��ꤲ���롣
  def mapconcat(separator, &block)  map(&block).join separator  end
# mapconcat��������
  def mapconcat_yield(separator)  map{|x| yield x }.join separator  end
end
[1,2,3].mapconcat(",") {|x| x*x }        # => "1,4,9"
[1,2,3].mapconcat_yield(",") {|x| x*x }  # => "1,4,9"

# ���󥹥ȥ饯���˥֥�å���Ĥ�����
class X
# �ְ�ä��㡣yield���ƤӽФ�����ʸ̮��ɾ������뤿�ᡢ������ư��ʤ���
  def self.define_wrong()       obj = new; obj.instance_eval { yield }; obj end
# Object#instance_eval�˥֥�å�����ꤲ����Τ�����
  def self.define_right(&block) obj = new; obj.instance_eval(&block); obj   end
  attr_accessor :v
end
wrong = X.define_wrong {
# X�Υ��󥹥��󥹤�ʸ̮��ɾ��������Ĥ�꤬���ƤӽФ�¦��ʸ̮��ɾ������Ƥ��롣
  self                      # => main
  (self.v = :ok) rescue $!  # => #<NoMethodError: undefined method `v=' for main:Object>
}
wrong                       # => #<X:0x9bced9c>
right = X.define_right {
# X�Υ��󥹥��󥹤�ʸ̮��ɾ������Ƥ��롣
  self                      # => #<X:0x9bce6bc>
  self.v = :ok
}
right                       # => #<X:0x9bce6bc @v=:ok>
