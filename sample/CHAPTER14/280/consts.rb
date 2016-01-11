# 初期段階でアクセスできる定数は差し引くことにする
$init_constants = Module.constants      # => [:Object, ...(length=102)]
CONST0 = 0
class Outer
  CONST1 = 1 
  constants    # => [:CONST1]
  Module.constants - $init_constants
  # => [:CONST1, :CONST0, :Outer]
  module Mixin
    CONST2 = 2
    constants  # => [:CONST2]
    Module.constants - $init_constants
    # => [:CONST2, :CONST1, :Mixin, :CONST0, :Outer]
  end
  
  class Inner1
    include Mixin
    CONST3 = 3
    constants  # => [:CONST3, :CONST2]
    Module.constants - $init_constants
    # => [:CONST3, :CONST1, :Mixin, :Inner1, :CONST0, :Outer, :CONST2]
  end
  
  class Inner2 < Inner1
    CONST4 = 2
    constants  # => [:CONST4, :CONST3, :CONST2]
    Module.constants - $init_constants
    # => [:CONST4, :CONST1, :Mixin, :Inner1, :Inner2, :CONST0, :Outer, :CONST3, :CONST2]
  end
  constants    # => [:CONST1, :Mixin, :Inner1, :Inner2]
  Module.constants - $init_constants
  # => [:CONST1, :Mixin, :Inner1, :Inner2, :CONST0, :Outer]
  def initialize() @x = 8 end
end
Outer::Inner2.constants             # => [:CONST4, :CONST3, :CONST2]
Outer.constants                     # => [:CONST1, :Mixin, :Inner1, :Inner2]
Module.constants - $init_constants  # => [:CONST0, :Outer]
