require 'vars2'
lvar                            # => 1
defined? lvar                   # => "method"
lvar = 2
lvar                            # => 2
defined? lvar                   # => "local-variable"

module Foo
  lvar                          # => 1
  defined? lvar                 # => "method"
end

def lvar() 3 end # !> method redefined; discarding old lvar
lvar                            # => 2
module Foo
  lvar                          # => 3
end

lvar()                          # => 3
