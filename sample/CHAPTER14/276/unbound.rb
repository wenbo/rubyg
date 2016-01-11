class Object
  print = instance_method(:print) # => #<UnboundMethod: Object(Kernel)#print>
  define_method(:print2, print)   # Object#print2 の定義は Kernel#print
end
print2 "This is Kernel#print\n"
# >> This is Kernel#print
