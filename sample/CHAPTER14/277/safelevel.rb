# プログラム開始時のセーフレベルは0。
$SAFE   # => 0
# セーフレベルを1に設定する。
$SAFE = 1
Thread.start do
# スレッドは親スレッド（この場合はメインスレッド）の値を引き継ぐ。
  $SAFE # => 1
# スレッド内のみセーフレベルを2に設定する。
  $SAFE = 2
end.join
# $SAFEはこう見えてもグローバル変数ではない。
$SAFE   # => 1
# セーフレベルを下げようとするとSecurityErrorになる。
begin $SAFE = 0
rescue SecurityError
  $!    # => #<SecurityError: tried to downgrade safe level from 1 to 0>
end

