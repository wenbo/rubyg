$a = 1
alias $b $a
[$a, $b]  # => [1, 1]
$a = 6
[$a, $b]  # => [6, 6]
$b = 7
[$a, $b]  # => [7, 7]