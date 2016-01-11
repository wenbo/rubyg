class Object
# isは自分自身を返すメソッド。
  def is() self end
# are、a、anも使えるようにする。
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
