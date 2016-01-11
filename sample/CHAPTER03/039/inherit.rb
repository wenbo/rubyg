def IO.cmeth() "Input and Output" end
def File.cmeth() "File #{super}"   end
File.cmeth             # => "File Input and Output"

Array.ancestors        # => [Array, Enumerable, Object, Kernel, BasicObject]
def Enumerable.cmeth() "Collection" end
def Array.cmeth() "!!#{super}!!"    end
Array.cmeth rescue $!
# => #<NoMethodError: super: no superclass method `cmeth' for Array:Class>

