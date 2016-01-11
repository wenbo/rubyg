$DEBUG = false
$stderr = $stdout
raise "rescued" rescue 0
Thread.start{ raise "error in thread" }
sleep 0.1
puts "ok"
# >> ok
