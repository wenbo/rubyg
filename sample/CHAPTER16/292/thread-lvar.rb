# メインスレッドのスレッドローカル変数aを初期化する。
Thread.current[:a] = "main thread"
# グローバル変数を初期化する。
$gvar = "global"
th = Thread.start do
  $gvar = "changed!"
# スレッドthのスレッドローカル変数は未初期化なのでnilである。
  Thread.current[:a]    # => nil
  Thread.current[:a] = "new thread"
  Thread.current[:a]    # => "new thread"
end
# thの実行終了まで待つ。
th.join
# メインスレッドのスレッドローカル変数は変更されていない。
Thread.current[:a]      # => "main thread"
# キーに文字列を指定しても構わない。
Thread.current["a"]     # => "main thread"
# スレッドthのスレッドローカル変数にアクセスする。
th[:a]                  # => "new thread"
# グローバル変数がスレッドth内で変更されてしまった。
$gvar                   # => "changed!"
Thread.current.keys     # => [:__recursive_key__, :a]
# メインスレッドのスレッドローカル変数を削除する。
Thread.current[:a] = nil
Thread.current.key? :a  # => false
