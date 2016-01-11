# threadライブラリにQueueが定義されているので読み込む
require 'thread'
$start_time = Time.now
# プログラム実行開始からの経過時間とstringを表示する関数を定義。
def log(string)  printf("%.2fs: %s\n", Time.now - $start_time, string)  end
# スレッドと通信するキューを作成する。
q = Queue.new
# スレッドupcaserはキューに投入された文字列を大文字にして表示する。サーバと考えることができる。
upcaser = Thread.start do
# キューにnilが投入された時点でスレッドの実行を終了する。
  while str = q.pop
    log str.upcase
  end
end

log "Start."
# 0〜1秒ごとにキューに文字列を投入する。クライアントと考えることができる。
q.push "foo"; sleep rand
q.push "bar"; sleep rand
q.push "baz"
q.push "abc"
# 終了マークnilを投入してスレッドの実行終了を宣言する。
q.push nil
# スレッドupcaserの実行終了まで待つ。
upcaser.join
log "End."
# >> 0.00s: Start.
# >> 0.01s: FOO
# >> 0.60s: BAR
# >> 1.56s: BAZ
# >> 1.56s: ABC
# >> 1.56s: End.
