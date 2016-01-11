def fact(n, answer=1)           # ³¬¾è¤òµá¤á¤ë
  if n == 0
    answer
  else
    fact(n-1, answer*n)
  end
end
fact 3                          # => 6
fact 4                          # => 24
