require 'rubygems'
require 'active_support'
RUBY_VERSION                    # => "1.8.7"
h = {:a => 1, "b" => 2}
h[:b]                           # => nil
h["b"]                          # => 2
h[:a]                           # => 1
h["a"]                          # => nil
h.symbolize_keys!               # => {:a=>1, :b=>2}
