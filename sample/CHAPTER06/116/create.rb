# 配列式
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

# 「to_a」メソッド
RUBY_VERSION      # => "1.9.1"
1.to_a rescue $!  # => #<NoMethodError: undefined method `to_a' for 1:Fixnum>

# nilからは空配列が作成される
nil.to_a                        # => []
# 正規表現マッチの情報を格納したMatchDataの例
md = "abcd".match(/(.)b(.+)$/)  # => #<MatchData "abcd" 1:"a" 2:"cd">
md.to_a                         # => ["abcd", "a", "cd"]
# 現在時刻の例
time = Time.now                 # => 2009-05-01 02:15:51 +0900
time.to_a                       # => [51, 15, 2, 1, 5, 2009, 5, 121, false, "JST"]

# ハッシュを配列に変換する
{1=>2, 3=>4}.to_a               # => [[1, 2], [3, 4]]
# 構造体を配列に変換する
Person = Struct.new :name, :age
person = Person.new "Tom", 19   # => #<struct Person name="Tom", age=19>
person.to_a                     # => ["Tom", 19]


# ハッシュリテラル
{"one" =>1, "two" =>2, "three" =>3}   # => {"one"=>1, "two"=>2, "three"=>3}
{:host => "127.0.0.1", :port => 9999} # => {:host=>"127.0.0.1", :port=>9999}
# Ruby 1.9で用意された新リテラル
{host: "127.0.0.1", port: 9999}       # => {:host=>"127.0.0.1", :port=>9999}

# 配列からハッシュを作成する
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
