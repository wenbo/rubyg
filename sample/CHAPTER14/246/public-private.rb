class AccessControlTest
  def initialize()      end     # initialize��private
  def public_method1()  end     # �����������椬����Ƥ��ʤ��Τ�public
  private                       # �ʸ�Υ᥽�å������private�ˤʤ�
  def private_method1() end
  public                        # �ʸ�Υ᥽�å������public�ˤʤ�
  def public_method2()  end
  private                       # �ʸ�Υ᥽�å������private�ˤʤ�
  def public_method3()  end
  public :public_method3        # �᥽�åɤ���ꤷ��public�ˤ���
  def private_method2() end  
end
act = AccessControlTest.new
act.public_methods(false)  # => [:public_method1, :public_method2, :public_method3]
act.private_methods(false) # => [:initialize, :private_method1, :private_method2]
