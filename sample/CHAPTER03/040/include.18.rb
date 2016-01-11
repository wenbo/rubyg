Array.ancestors       # => [Array, Enumerable, Object, Kernel]
[1,2].map {|x| x*2 }  # => [2, 4]

class Super;       def which() "Super#which"  end; end
module Mod;        def which() "Mod#which"    end; end
class Sub < Super; include Mod;                    end
Sub.ancestors         # => [Sub, Mod, Super, Object, Kernel]
Sub.new.which         # => "Mod#which"

class Sub < Super; def which() "Sub#which"    end; end
Sub.new.which         # => "Sub#which"
