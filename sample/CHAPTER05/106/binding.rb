def get_a(bind)  eval "a", bind  end
a = 8
get_a binding  # => 8
