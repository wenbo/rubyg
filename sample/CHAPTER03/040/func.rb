class Super;  def func1() "Super#func1" end;  end
class Sub < Super
  def func2() "Sub#func2" end
  def run
    self     # => #<Sub:0x82d479c>
    func1    # => "Super#func1"
    func2    # => "Sub#func2"
    "Sub#run"
  end
end
Sub.new.run  # => "Sub#run"
