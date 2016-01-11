catch(:exit) do 
  for inner in [[1,2],[3,4]]
    for n in inner
      throw :exit if n == 3
      p n
    end
  end
end
# >> 1
# >> 2
