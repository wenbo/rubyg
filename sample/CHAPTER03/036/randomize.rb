class Array
  def randomize() sort_by { rand } end
end
[1,2,3,4,5].randomize           # => [3, 1, 2, 5, 4]
