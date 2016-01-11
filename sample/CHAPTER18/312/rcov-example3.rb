def f(x)
  if x % 2 == 0
    if x < 10
      x**3
    else
      x**2
    end
  else
    x * 2
  end
end

require 'test/unit'
class TestF < Test::Unit::TestCase
  def test_f
    assert_equal 14, f(7)
    assert_equal 64, f(4)
    # (*)
  end
end
