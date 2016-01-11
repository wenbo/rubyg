$gvar = 1  # どこでも見えるので危険！
class X
  $gvar    # => 1
  class Y
    $gvar  # => 1
  end
end
def foo
  $gvar    # => 1
end
foo
