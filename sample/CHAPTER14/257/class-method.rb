class A
  def self.hello
    "Hello"
  end
end
class B < A
  def self.hello
    "#{super} = ����ˤ���"
  end
end
A.hello  # => "Hello"
B.hello  # => "Hello = ����ˤ���"
