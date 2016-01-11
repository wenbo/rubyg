$DEBUG = true
$stderr = $stdout
raise "rescued" rescue 0
Thread.start{ raise "error in thread" }
sleep 0.1
puts "ok"
# >> Exception `RuntimeError' at -:3 - rescued
# >> Exception `RuntimeError' at -:4 - error in thread
# >> Exception `RuntimeError' at -:5 - error in thread
# >> -:4:in `block in <main>': error in thread (RuntimeError)
