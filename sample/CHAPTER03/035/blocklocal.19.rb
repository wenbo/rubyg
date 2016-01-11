# 外側のaが変更される
a = 1
[9].each {|x| a = 2}
a  # => 2
# aはブロックローカル
a = 1
[9].each {|x;a| a = 2} # !> shadowing outer local variable - a
a  # => 1
