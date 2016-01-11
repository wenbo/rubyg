# 終了ステータス2を発生させる。シェルは経由しない。
system "ruby", "-e", "exit 2"  # => false
$?                             # => #<Process::Status: pid 5600 exit 2>
$?.exitstatus                  # => 2
# 存在しないコマンドを実行しようとする。シェルは経由しない。Ruby 1.8ではfalseが、Ruby 1.9ではnilが返ります。
system "command-not-found"     # => nil
$?                             # => #<Process::Status: pid 5602 exit 127>
$?.exitstatus                  # => 127
# 終了ステータスが0でない場合、system関数が偽を返すのでこういう分岐ができる。シェルを経由する。
unless system "ruby -e 'exit 23'"
  puts "Child process exited abnormally with code #{$?.exitstatus}"
end
# >> Child process exited abnormally with code 23
