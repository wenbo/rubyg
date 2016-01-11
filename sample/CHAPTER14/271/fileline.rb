meth = "foo"    # 1
eval <<"EOF", binding, __FILE__, __LINE__+1  # 2
def #{meth}     # 3           
  x             # 4
end             # 5
EOF
foo             # 7
# ~> -:4:in `foo': undefined local variable or method `x' for main:Object (NameError)
# ~> 	from -:7
