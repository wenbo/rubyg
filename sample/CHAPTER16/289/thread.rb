$start_time = Time.now
# プログラム実行開始からの経過時間とstringを表示する関数を定義。
def log(string)  printf("%.0fs: %s\n", Time.now - $start_time, string)  end
def loop_thread(sec, str)       # スレッドを生成して並列実行する
# 「Thread.start」に渡す引数はブロックにそのまま渡される。ブロックパラメータはスレッドローカルであることが保証される。
  Thread.start(sec, str) do |wait_time, string|
# スレッドの内容は、wait_time秒ごとにstringを表示し続けること。
    loop do
      sleep wait_time
      log string
    end
  end
end
log "Start."
# 2秒ごとに「a」を表示するスレッドと、3秒ごとに「b」を表示するスレッドを作成する。ここから並行処理が始まる。
loop_thread 2, "a"              # => #<Thread:0x9d347f4 run>
loop_thread 3, "b"              # => #<Thread:0x9d34600 run>
# 7秒後に「End.」と表示する。メインスレッドが終了した時点で他のスレッドの実行が打ち切られ、プログラムの実行が終了する。
sleep 7
log "End."
# >> 0s: Start.
# >> 2s: a
# >> 3s: b
# >> 4s: a
# >> 6s: a
# >> 6s: b
# >> 7s: End.
