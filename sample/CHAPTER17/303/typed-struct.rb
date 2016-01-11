class TypedStruct
  TYPE_TABLE = [ [:int, Integer], [:array, Array], [:string, String], ]  # *1
  class << self                                # *2
    attr_reader :order                         # *3
    TYPE_TABLE.each do |type, klass|           # *4
      define_method(type) do |field|           # *5
        (@order ||= []) << field               # *6
        attr_reader field                      # *7
        define_method("#{field}=") do |value|  # *8
          if value
            unless klass === value             # *9
              raise TypeError, "#{value.inspect}: expected #{klass}"
            end
            instance_variable_set "@#{field}", value
          end
        end
      end
    end
  end
end

# Personを定義する
class Person < TypedStruct
  string :name
  int    :age
  array  :skill
end

tom = Person.new
tom.name = "Tom"
tom.name                    # => "Tom"
(tom.age = "28") rescue $!  # => #<TypeError: "28": expected Integer>
tom.age = 28
tom.skill = ["Ruby", "Perl"]
tom  # => #<Person:0x972d98c @name="Tom", @age=28, @skill=["Ruby", "Perl"]>

# コンストラクタと「TypedStruct#each」の定義
class TypedStruct
  def initialize(*args)
    self.class.order.zip(args) {|field, arg| self.__send__("#{field}=", arg) }
  end
  def each()  self.class.order.each {|field| yield self.__send__(field) }  end
  include Enumerable
end

jake = Person.new "Jake", 33, ["Ruby", "JavaScript"]
jake  # => #<Person:0x972d1bc @name="Jake", @age=33, @skill=["Ruby", "JavaScript"]>
jake.to_a  # => ["Jake", 33, ["Ruby", "JavaScript"]]

# TypedStruct定義用の文法を作成する
def TypedStruct.define(&block)  Class.new(self,&block)  end

LatticePoint = TypedStruct.define do
  int :x
  int :y
end
LatticePoint.new 1,2                # => #<LatticePoint:0x972c8e8 @x=1, @y=2>
LatticePoint.new 1, 1.5 rescue  $!  # => #<TypeError: 1.5: expected Integer>
