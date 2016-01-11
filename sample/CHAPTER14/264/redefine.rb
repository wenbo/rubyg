def foo() :original end
m = method(:foo)
__send__ :foo  # => :original
undef :foo     # ·Ù¹ğ¾Ã¤·
def foo() :redefined end
foo            # => :redefined
m[]            # => :original
__send__ :foo  # => :redefined
