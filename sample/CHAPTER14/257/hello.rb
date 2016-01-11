obj = Object.new
def obj.hello() "Hello" end
module Japanese;  def hello() "#{super} = こんにちは" end;  end
obj.extend(Japanese).hello      # => "Hello"

module English;  def hello() "Hello" end;  end
obj = Object.new
obj.extend(English).hello       # => "Hello"
obj.extend(Japanese).hello      # => "Hello = こんにちは"
