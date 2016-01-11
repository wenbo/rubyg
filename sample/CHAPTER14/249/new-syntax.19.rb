{a:1, b:2}              # => {:a=>1, :b=>2}
{a: 1, b: 2, c: :sym}   # => {:a=>1, :b=>2, :c=>:sym}
{a:1, b:2, :c => 3}     # => {:a=>1, :b=>2, :c=>3}

def test(normal, kw)  kw  end
test(9, {a: 1, b: "test", c: :fun})   # => {:a=>1, :b=>"test", :c=>:fun}
test(9, a: 1, b: "test", c: :fun)     # => {:a=>1, :b=>"test", :c=>:fun}
test 9, a: 1, b: "test", c: :fun      # => {:a=>1, :b=>"test", :c=>:fun}
test 9, a:1, b:"test", c: :fun        # => {:a=>1, :b=>"test", :c=>:fun}

