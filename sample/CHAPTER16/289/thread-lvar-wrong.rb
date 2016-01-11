for i in 1..3
  Thread.start{ sleep 0.1; p "<#{i}>"}
end
i  # => 3
sleep 0.2
# >> "<3>"
# >> "<3>"
# >> "<3>"
