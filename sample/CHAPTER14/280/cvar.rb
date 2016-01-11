class B
  class_variables  # => []
  @@cvar = 0
  class_variables  # => [:@@cvar]
end
B.class_variables  # => [:@@cvar]
