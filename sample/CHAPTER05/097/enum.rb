LEFT    = 0
RIGHT   = 1
UP      = 2
DOWN    = 3
INVALID = 4

op = LEFT
case op
when LEFT  then puts "OK"
when RIGHT then puts "NG"
end
op < INVALID  # => true
# >> OK
