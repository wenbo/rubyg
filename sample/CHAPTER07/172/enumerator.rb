# Ruby 1.8.6以前はrequireする必要がある。
require 'enumerator'
ary = %w[cat echo grep ls]
# Object#enum_forを使う必要がある。
ary.enum_for(:each_with_index)      # => #<Enumerator:0xb7d9bd88>
ary.enum_for(:each_with_index).to_a # => [["cat", 0], ["echo", 1], ["grep", 2], ["ls", 3]]
ary.enum_for(:each_with_index).select{|x, i| i >= 2 and x.length >= 3 } # => [["grep", 2]]
ary.enum_for(:each_slice,2).map{|a,b| [a,b.upcase] } # => [["cat", "ECHO"], ["grep", "LS"]]
"cat".enum_for(:each_byte).to_a     # => [99, 97, 116]
