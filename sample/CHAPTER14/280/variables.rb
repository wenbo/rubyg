CONST0 = 0
gvars = global_variables                # => [:$;, ...(length=58)]
gvars.include? :$gvar              # => true
$outer_constants = Module.constants # => [:Object, ...(length=101)]
class Outer
  CONST1 = 1 
  constants                           # => [:CONST1]
  Module.constants - $outer_constants # => [:CONST1, :Outer]
  class Inner
    CONST2 = 2
    @@cvar1 = 1
    @@cvar2 = 2
    @ivar1 = 1
    $gvar = 7
    global_variables            # => [:$;, ...(length=58)]
    constants                   # => [:CONST2]
    Module.constants - $outer_constants # => [:CONST2, :CONST1, :Inner, :Outer]
    class_variables                     # => [:@@cvar1, :@@cvar2]
    instance_variables                  # => [:@ivar1]
    Module.nesting              # => [Outer::Inner, Outer]
  end
  constants                           # => [:CONST1, :Inner]
  Module.constants - $outer_constants # => [:CONST1, :Inner, :Outer]
  def initialize() @x = 8 end
end
global_variables                # => [:$;, ...(length=58)]
Outer::Inner.constants                 # => [:CONST2]
Outer.constants                        # => [:CONST1, :Inner]
Outer::Inner.instance_variables        # => [:@ivar1]
Outer::Inner.class_variables        # => [:@@cvar1, :@@cvar2]
Outer.new.instance_variables        # => [:@x]
lvars =  local_variables 
lvars.reject! {|x| x =~ /xmp/}  # nodisp
a = b = 2
lvars                           # => [:gvars, :lvars, :a, :b]
