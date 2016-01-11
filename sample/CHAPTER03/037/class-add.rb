class X < Array
  self.superclass  # => Array
end
class X                         # 「< Array」は省略可能
  self.superclass  # => Array
end
