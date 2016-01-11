# 「ruby -v」コマンドを実行する。シェルは経由しない。
system "ruby -v"  # => true
# 「$?」は最後に終了した子プロセスの終了ステータスを表す((:Process::Status::))オブジェクト。
$?                # => #<Process::Status: pid 11818 exit 0>
# プロセスID。
$?.pid            # => 11818
# 終了ステータスの整数。正常終了したため0になる。
$?.exitstatus     # => 0
# >> ruby 1.8.7 (2008-11-12 revision 20228) [i686-linux]
