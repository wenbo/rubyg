#!/usr/local/bin/ruby
# at_exitによる終了処理。
at_exit { puts "at_exit 1" }
at_exit { puts "at_exit 2" }
# EXIT疑似シグナルによる終了処理。
Signal.trap(:EXIT) { puts "trap :EXIT 1" }
Signal.trap(:EXIT) { puts "trap :EXIT 2" } # シグナルハンドラを上書き
# ENDブロックによる終了処理。
END { puts "END exit 1" }
END { puts "END exit 2" }
begin
  exit
# exitによって終了したときはSystemExitを発生させる。
rescue SystemExit
  puts "rescue SystemExit"
end
# >> rescue SystemExit
# >> trap :EXIT 2
# >> END exit 2
# >> END exit 1
# >> at_exit 2
# >> at_exit 1
