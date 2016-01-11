a = 7          # => 7
class << self
  self         # => #<Class:#<Object:0x81b15a4>>
  a rescue $!  # => #<NameError: undefined local variable or method `a' for #<Class:#<Object:0x81b15a4>>>
end
(class << self; self; end).module_eval do
  self         # => #<Class:#<Object:0x81b15a4>>
  a            # => 7
end
