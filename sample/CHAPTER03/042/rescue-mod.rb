ary2 = [[1,2], [3,4]]
ary2[0]                         # => [1, 2]
ary2[0][0]                      # => 1
ary2[0][9]                      # => nil
ary2[9]                         # => nil
# nil[0]で例外が起きるため、捕捉してnilを返す。
ary2[9][0] rescue nil           # => nil
