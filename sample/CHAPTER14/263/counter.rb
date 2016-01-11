def counter() i=0;  lambda { i+=1 } end
c1 = counter          # => #<Proc:0x9ffcdc4@-:1 (lambda)>
c1.call               # => 1
c2 = counter          # => #<Proc:0x9ffca54@-:1 (lambda)>
c1.call               # => 2
c2.call               # => 1
c1.call               # => 3
# Proc#bindingでProcが保持している文脈を得る。
eval "i", c1.binding  # => 3
eval "i=9999", c1.binding
c1.call               # => 10000
