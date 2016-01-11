require 'bigdecimal'
sf = (1..1000).inject(0){|s,| s + 0.1 }  # => 99.9999999999986
sf == 100                                # => false
a = BigDecimal("0.1")
sd = (1..1000).inject(0){|s,| s + a }    # => #<BigDecimal:b7de09d8,'0.1E3',4(20)>
sd == 100                                # => true
