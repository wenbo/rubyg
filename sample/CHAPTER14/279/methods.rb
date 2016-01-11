# Objectクラスの場合
objmeth = Object.instance_methods            # => [:nil?, ...(length=52)]
obj_pub = Object.public_instance_methods     # => [:nil?, ...(length=52)]
obj_pri = Object.private_instance_methods    # => [:require_relative, ...(length=74)]
obj_pro = Object.protected_instance_methods  # => []
# 注：要素数が多いのでArray#inspectを再定義し、最初の要素と個数を注釈しています。
Object.new.methods == objmeth                # => true
Object.new.public_methods == obj_pub         # => true
Object.new.private_methods == obj_pri        # => true
Object.new.protected_methods == obj_pro      # => true

# ユーザ定義クラスの場合
class A
  def initialize() @a = 1; @b = 2 end
  public;    def a_public() end;    def overridden() end
  private;   def a_private() end
  protected; def a_protected() end
end
A.public_instance_methods - obj_pub   # => [:a_public, :overridden]
A.private_instance_methods - obj_pri  # => [:a_private]
A.protected_instance_methods          # => [:a_protected]
A.public_instance_methods false       # => [:a_public, :overridden]
A.private_instance_methods false      # => [:initialize, :a_private]
A.protected_instance_methods false    # => [:a_protected]
# 特異メソッドを含むオブジェクトの場合
class B < A
  def overridden() end
  private;   def b_private() end
end
b = B.new
def b.a_singleton() end
b.singleton_methods     # => [:a_singleton]
b.methods false         # => [:a_singleton]
## Objectのメソッドは特異メソッドを反映したメソッドのリストを返します。
B.instance_methods false          # => [:overridden]
b.public_methods false            # => [:a_singleton, :overridden]
B.public_instance_methods false   # => [:overridden]
b.private_methods false           # => [:b_private]
B.private_instance_methods false  # => [:b_private]

# クラスメソッドの場合
def A.a_cmeth() end
def B.b_cmeth() end
B.singleton_methods        # => [:b_cmeth, :a_cmeth]
B.singleton_methods false  # => [:b_cmeth]
A.methods false            # => [:a_cmeth]
B.methods false            # => [:b_cmeth]
