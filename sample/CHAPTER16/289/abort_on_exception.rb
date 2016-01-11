Thread.abort_on_exception = true
th3 = Thread.start { raise "Error in th3" }
sleep 0.1
puts "End of program."  # プログラムの実行が打ち切られるため表示されない。
# ~> -:2:in `block in <main>': Error in th3 (RuntimeError)
