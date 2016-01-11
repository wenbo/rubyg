th1 = Thread.start do
  raise "Error in th1"
  p "OK"                   # th1の実行が打ち切られるため表示されない。
end
th2 = Thread.start do
  # th2の例外をrescueで捕捉。
  raise "Error in th2" rescue $!  # => #<RuntimeError: Error in th2>
end
sleep 0.1
puts "End of program."
# >> End of program.
