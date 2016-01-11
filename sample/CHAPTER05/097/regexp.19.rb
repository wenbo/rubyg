methods = 1.methods
methods.select {|sym| sym =~ /\Ato_/ }
# => [:to_s, :to_f, :to_i, :to_int, :to_r, :to_c, :to_enum]
