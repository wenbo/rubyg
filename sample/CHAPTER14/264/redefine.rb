def foo() :original end
m = method(:foo)
__send__ :foo  # => :original
undef :foo     # �ٹ�ä�
def foo() :redefined end
foo            # => :redefined
m[]            # => :original
__send__ :foo  # => :redefined
