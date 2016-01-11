class AccessControlTest
  def initialize()      end     # initializeはprivate
  def public_method1()  end     # アクセス制御がされていないのでpublic
  private                       # 以後のメソッド定義はprivateになる
  def private_method1() end
  public                        # 以後のメソッド定義はpublicになる
  def public_method2()  end
  private                       # 以後のメソッド定義はprivateになる
  def public_method3()  end
  public :public_method3        # メソッドを指定してpublicにする
  def private_method2() end  
end
act = AccessControlTest.new
act.public_methods(false)  # => [:public_method1, :public_method2, :public_method3]
act.private_methods(false) # => [:initialize, :private_method1, :private_method2]
