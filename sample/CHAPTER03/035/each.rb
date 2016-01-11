[1,2].each {|a| puts "a = #{a}" }         
[ [1,2], [3,4] ].each{|b| puts "b = #{b.inspect}" }
[ [1,2], [3,4] ].each{|x,y| puts "x = #{x}, y = #{y}" }
# >> a = 1
# >> a = 2
# >> b = [1, 2]
# >> b = [3, 4]
# >> x = 1, y = 2
# >> x = 3, y = 4
