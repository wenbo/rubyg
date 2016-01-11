# lambdaは厳密な引数チェック
f = lambda {|x,y| y}
f[1] rescue $!  # => #<ArgumentError: wrong number of arguments (1 for 2)>
# Proc.newは引数をチェックしない
f = Proc.new {|x,y| y}
f[1] rescue $!  # => nil
