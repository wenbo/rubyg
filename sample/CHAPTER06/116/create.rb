# ����
[3, 7]                            # => [3, 7]
["foo", "bar"]                    # => ["foo", "bar"]
[1, 1.1, "string", Object, [], ]  # => [1, 1.1, "string", Object, []]

%w[one two three\ four]         # => ["one", "two", "three four"]
%W[#{'hello'.upcase} world\n]   # => ["HELLO", "world\n"]

# Array.new(size)
Array.new(3)                    # => [nil, nil, nil]

Array.new(3) { "foo" }          # => ["foo", "foo", "foo"]

Array.new(11){|i| i}            # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Array.new(11){|i| i*i }         # => [0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

# Array.new(size, value)
Array.new(3, "bar".freeze)      # => ["bar", "bar", "bar"]
Array.new(3, 0)                 # => [0, 0, 0]

# Array(arg)
Array([1,2])                    # => [1, 2]
Array([[1],2])                  # => [[1], 2]
Array(0..3)                     # => [0, 1, 2, 3]
Array(3)                        # => [3]

# ��to_a�ץ᥽�å�
RUBY_VERSION      # => "1.9.1"
1.to_a rescue $!  # => #<NoMethodError: undefined method `to_a' for 1:Fixnum>

# nil����϶����󤬺��������
nil.to_a                        # => []
# ����ɽ���ޥå��ξ�����Ǽ����MatchData����
md = "abcd".match(/(.)b(.+)$/)  # => #<MatchData "abcd" 1:"a" 2:"cd">
md.to_a                         # => ["abcd", "a", "cd"]
# ���߻������
time = Time.now                 # => 2009-05-01 02:15:51 +0900
time.to_a                       # => [51, 15, 2, 1, 5, 2009, 5, 121, false, "JST"]

# �ϥå����������Ѵ�����
{1=>2, 3=>4}.to_a               # => [[1, 2], [3, 4]]
# ��¤�Τ�������Ѵ�����
Person = Struct.new :name, :age
person = Person.new "Tom", 19   # => #<struct Person name="Tom", age=19>
person.to_a                     # => ["Tom", 19]


# �ϥå����ƥ��
{"one" =>1, "two" =>2, "three" =>3}   # => {"one"=>1, "two"=>2, "three"=>3}
{:host => "127.0.0.1", :port => 9999} # => {:host=>"127.0.0.1", :port=>9999}
# Ruby 1.9���Ѱդ��줿����ƥ��
{host: "127.0.0.1", port: 9999}       # => {:host=>"127.0.0.1", :port=>9999}

# ���󤫤�ϥå�����������
pairs = ["one",1, "two",2, "three",3]
Hash[*pairs]                    # => {"one"=>1, "two"=>2, "three"=>3}

pairs = [["one",1], ["two",2], ["three",3]]
Hash[*pairs.flatten]     # => {"one"=>1, "two"=>2, "three"=>3}
pairs = [[:simple, 1], [:nested, [2,3]]]
Hash[*pairs.flatten(1)]  # => {:simple=>1, :nested=>[2, 3]}

english = %w[one two three]
numbers = [1,2,3]
english.zip(numbers)                 # => [["one", 1], ["two", 2], ["three", 3]]
Hash[*english.zip(numbers).flatten]  # => {"one"=>1, "two"=>2, "three"=>3}
