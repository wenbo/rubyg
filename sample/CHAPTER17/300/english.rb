class Object
# is�ϼ�ʬ���Ȥ��֤��᥽�åɡ�
  def is() self end
# are��a��an��Ȥ���褦�ˤ��롣
  alias are is
  alias a   is
  alias an  is
end

str = "hoge"
str.kind_of? String                  # => true
str.is.a.kind_of? String             # => true
str.is.an.instance_of? String        # => true
[1,2,3].all?{|x| Numeric === x}      # => true
[1,2,3].are.all?{|x| Numeric === x}  # => true
