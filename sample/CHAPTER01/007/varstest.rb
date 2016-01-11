require 'vars'
$gvar       # => 1
@ivar       # => 1
class X
  @@cvar    # => 1
end
CONST       # => 1 # !> already initialized constant CONST
lvar rescue $!  # => #<NameError: undefined local variable or method `lvar' for #<Object:0xb7d699a0 @ivar=1>>

lvar2 = 0
eval File.read("vars.rb")
lvar rescue $!  # => #<NameError: undefined local variable or method `lvar' for #<Object:0xb7d699a0 @ivar=1>>
lvar2                                    # => 1
