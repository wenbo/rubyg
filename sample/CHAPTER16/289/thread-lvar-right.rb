for i in 1..3
  Thread.start(i) {|x| sleep 0.1; p "[#{x}]"}
end
i  # => 3
sleep 0.2
# >> "[2]"
# >> "[1]"
# >> "[3]"
