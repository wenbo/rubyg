# �ѿ���Ĵ��
lvar   = 1
$gvar  = 1
@ivar  = 2
@@cvar = 3
defined? lvar    # => "local-variable"
defined? $gvar   # => "global-variable"
defined? @ivar   # => "instance-variable"
defined? @@cvar  # => "class variable"
defined? $gvar2  # => nil
Object.class_variable_defined? :@@cvar  # => true
instance_variable_defined? :@ivar       # => true

# �����Ĵ��
defined? Array                   # => "constant"
defined? ::Array                 # => "constant"
defined? File::Constants         # => "constant"
defined? File                    # => "constant"
defined? File::Stat              # => "constant"
defined? ::File                  # => "constant"
defined? Undefined               # => nil
Object.const_defined? :Array     # => true
Object.const_defined? :Undefined # => false

# ������
defined? c=3          # => "assignment"
defined? $gvar2=4     # => "assignment"
defined?((x,y=[1,2])) # => "assignment"
[c,x,y]               # => [nil, nil, nil]
defined? c            # => "local-variable"

# �᥽�åɸƤӽФ�
def b(*args) end
defined? b                 # => "method"
defined? [].length         # => "method"
defined? print(1)          # => "method"
defined? Math::sin         # => "method"
defined? Math.sin          # => "method"
defined? [1][0]            # => "method"
defined? b(1,2,3)          # => "method"
defined? 1 == 2            # => "method"
defined? [1].sort.uniq     # => "method"
defined? Object.no_method  # => nil
defined? no_method         # => nil

# Ruby 1.8���Ȥʤ���ɾ�������
defined? [1].map{|z| z*2 } # => "expression"
[].respond_to? :length     # => true

# °������������ǥå�������
s = Struct.new(:x,:y).new
defined? s.x=1           # => "method"
defined? [1,2][0]=1      # => "method"
# true��false�ʤ�
defined? false           # => "false"
defined? nil             # => "nil"
defined? self            # => "self"
defined? true            # => "true"

#������ɽ���ޥå��ط����ѿ�
"hoge" =~ /(o)/
defined? $1       # => "global-variable"
defined? $2       # => nil
defined? $&       # => "global-variable"

#��super��yield
class X
  def meth(*args)
    defined? super # => nil
  end
end
class Y < X
  def meth(*args)
    defined? super # => "super"
    super
    defined? yield # => "yield"
  end
end

defined? yield     # => nil
defined? super     # => nil
Y.new.meth {}

# ����¾�μ�
defined? 1        # => "expression"
defined? __FILE__ # => "expression"
defined? "b"      # => "expression"
defined?(/a/)     # => "expression"
