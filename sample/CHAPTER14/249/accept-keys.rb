class Object
  private                       # 関数的メソッド呼び出しが目的
  def accept_keywords(hash, *keywords)
    unacceptables = hash.keys - keywords
    if unacceptables.empty?
      hash.each_pair {|k,v| instance_variable_set("@#{k}", v) }
    else
      raise ArgumentError, "Unacceptable keys: #{unacceptables.join ', '}"
    end
  end
end
# 使い方
class Person
  def initialize(args) accept_keywords args, :name, :age, :job end
end
Person.new :name => "Dave", :age => 33
# => #<Person:0x81a0470 @age=33, @name="Dave">
Person.new :name => "Ted", :invalid => "OUCH!" rescue $!
# => #<ArgumentError: Unacceptable keys: invalid>
