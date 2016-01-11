# timeoutライブラリに「Timeout.timeout」が定義されているので読み込む
require 'timeout'
# タイムリミットは0.3秒。
Timeout.timeout(0.3) {|lim|  "Time limit = #{lim}" } # => "Time limit = 0.3"
# モジュール関数なのでインクルードしても使用可。
include Timeout
# タイムアウトした場合はTimeout::Error例外が発生する。
begin
  timeout(0.2) do
    # ここに制限時間つきの処理を書く。
    sleep 0.3
  end
rescue Timeout::Error
  # ここにタイムアウト時の処理を書く。
  puts "Too late."
  $!  # => #<Timeout::Error: execution expired>
end
# >> Too late.
