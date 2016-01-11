th = Thread.start { sleep 0.5 }
th.join(0.2) or puts "遅い！"
# >> 遅い！
