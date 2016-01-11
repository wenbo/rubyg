# クラス・モジュールで使えるリフレクション
Array.to_s        # => "Array"
Array.name        # => "Array"
File::Stat.name   # => "File::Stat"
c = Class.new     # => #<Class:0x886ba20>
[c.name, c.to_s]  # => [nil, "#<Class:0x886ba20>"]
Name = c          # => Name
[c.name, c.to_s]  # => ["Name", "Name"]

Array.ancestors          # => [Array, Enumerable, Object, Kernel, BasicObject]
Fixnum.ancestors
# => [Fixnum, Integer, Precision, Numeric, Comparable, Object, Kernel, BasicObject]
Fixnum.included_modules  # => [Precision, Comparable, Kernel]
Integer.superclass       # => Numeric

Array < Enumerable         # => true
Array <= Object            # => true
Enumerable > Array         # => true
Array > Object             # => false
Array > Fixnum             # => nil
Enumerable < Fixnum        # => nil
Enumerable >= Fixnum       # => nil
Object > Enumerable        # => nil
module X; include Enumerable; end
X > Enumerable             # => false
Array.include? Enumerable  # => true

[0 <=> 1,  Array <=> Enumerable ]          # => [-1, -1]
[1 <=> 1,  Array <=> Array ]               # => [0, 0]
[1 <=> 0,  Enumerable <=> Array ]          # => [1, 1]
Enumerable <=> Fixnum                      # => nil
Object <=> Enumerable                      # => nil
[ Integer, Numeric, Fixnum, Object ].sort  # => [Fixnum, Integer, Numeric, Object]
[ Object, Enumerable ].sort rescue $!
# => #<ArgumentError: comparison of Class with Module failed>
