# 構造体Dogを定義する。メンバは:nameと:age。
Dog = Struct.new :name, :age   # => Dog
# momoはDogのインスタンス。
momo = Dog.new "Momo", 8       # => #<struct Dog name="Momo", age=8>
# アクセサ形式でもハッシュ形式でも配列形式でもメンバにアクセスできる。
[ momo.name, momo.age ]        # => ["Momo", 8]
[ momo[:name], momo[:age] ]    # => ["Momo", 8]
[ momo["name"], momo["age"] ]  # => ["Momo", 8]
[ momo[0], momo[1] ]           # => ["Momo", 8]
# メンバ名の配列が返る。Ruby 1.8では文字列、Ruby 1.9ではシンボルになる。
momo.members                   # => [:name, :age]
Dog.members                    # => [:name, :age]
# メンバの数。
momo.length                    # => 2
# メンバの更新はアクセサ形式でもハッシュ形式でも配列形式でも可能。
momo.age = 9
momo                           # => #<struct Dog name="Momo", age=9>
# メンバは動的に追加できない。その代わり打ち間違いは発見しやすい。
momo.height rescue $!
# => #<NoMethodError: undefined method `height' for #<struct Dog name="Momo", age=9>>
(momo.height = 0.5) rescue $!
# => #<NoMethodError: undefined method `height=' for #<struct Dog name="Momo", age=9>>
# Structのサブクラスになっている。クラスオブジェクトの比較は継承関係の比較。
Dog < Struct                   # => true
# 構造体もれっきとしたクラスなので新たにメソッドが定義できる。
class Dog
  def bark() "woof woof!"  end
end
momo.bark                      # => "woof woof!"
# ((:Array#each:))のようにメンバの値で繰り返す。
momo.each {|m| puts "each: #{m.inspect}" }
# ((:Hash#each_pair:))のように [メンバ名, メンバの値] のペアで繰り返す。
momo.each_pair {|m,v| puts "each_pair: #{m.inspect} = #{v.inspect}" }
# >> each: "Momo"
# >> each: 9
# >> each_pair: :name = "Momo"
# >> each_pair: :age = 9
