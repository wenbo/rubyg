str = "singleton"
str.upcase             # => "SINGLETON"
class << str
  # �ðۥ᥽�åɤ򿷤����������
  def smeth()  "Other strings don't have this method." end
  # �ðۥ᥽�åɤǥ��ꥸ�ʥ�Υ᥽�åɤ���������
  def upcase() super + "!!"                            end
end
# �ðۥ᥽�åɤΥꥹ�Ȥ�����
str.singleton_methods  # => [:smeth, :upcase]
# str�����Υ᥽�å�
str.smeth              # => "Other strings don't have this method."
# ��ư���Ѥ�ä���
str.upcase             # => "SINGLETON!!"
# ���Ȥ�Ʊ�����Ƥ�ʸ����Ǥ⡢�̤Υ��֥������ȤʤΤ��ðۥ᥽�åɤϻȤ��ʤ�
str2 = "singleton"
str2.equal? str        # => false
str2.upcase            # => "SINGLETON"
str2.smeth rescue $!
# => #<NoMethodError: undefined method `smeth' for "singleton":String>
# �˲�Ū�᥽�åɤ����Ƥ�񤭴����Ƥ��ðۥ᥽�åɤ�ͭ��
str.replace "altered"
str.upcase             # => "ALTERED!!"
