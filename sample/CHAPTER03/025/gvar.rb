$gvar = 1  # �ɤ��Ǥ⸫����ΤǴ���
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
