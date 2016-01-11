# 「ruby -v」コマンドの出力結果を得る。改行付き。
`ruby -v`        # => "ruby 1.8.7 (2008-11-12 revision 20228) [i686-linux]\n"
# ％記法「%x」も使える。
%x!ruby -v!      # => "ruby 1.8.7 (2008-11-12 revision 20228) [i686-linux]\n"
# 「ruby -v」コマンドの出力結果を得る。改行無し。
`ruby -v`.chomp  # => "ruby 1.8.7 (2008-11-12 revision 20228) [i686-linux]"
# 標準出力と標準エラー出力に出力される場合は、標準出力のみ取り出される。
`ruby -e 'puts "STDOUT"; $stderr.puts "STDERR"'`       # => "STDOUT\n"
# sh系のシェルで標準出力と標準エラー出力を混在した出力を得る。
`ruby -e 'puts "STDOUT"; $stderr.puts "STDERR"' 2>&1`  # => "STDERR\nSTDOUT\n"
# sh系のシェルで標準エラー出力のみを得る。
`ruby -e 'puts "STDOUT"; $stderr.puts "STDERR"' 2>&1 1> /dev/null` # => "STDERR\n"
# 直前の子プロセスの終了ステータスを得る。
$?.exitstatus  # => 0
