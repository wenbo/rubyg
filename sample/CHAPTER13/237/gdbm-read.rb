require 'gdbm'
begin
# データベースを読み出す。
  GDBM.open("test.gdbm") do |dbm|
    dbm["foo"]  # => "bar"
  end
# 他のプロセスがデータベースを開いているときにはErrno::EAGAIN例外が発生するので待ってから再試行する。
rescue Errno::EAGAIN
  sleep 0.1
  retry
end
