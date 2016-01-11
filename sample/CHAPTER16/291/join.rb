$start_time = Time.now
# プログラム実行開始からの経過時間とstringを表示する関数を定義。
def log(string)  printf("%.2fs: %s\n", Time.now - $start_time, string)  end
log "Start."
# 0〜1秒後に文字列を表示する2つのスレッドを作成する。
th1 = Thread.start { sleep rand; log "Thread 1" } # => #<Thread:0x9a25040 run>
th2 = Thread.start { sleep rand; log "Thread 2" } # => #<Thread:0x9a24e24 run>
# 2つのスレッドの待ち合わせをする。
[th1, th2].each {|th| th.join }
log "joined"
Thread.start { sleep rand; log "Thread 3" }
Thread.start { sleep rand; log "Thread 4" }
# 実行中のすべてのスレッドの待ち合わせをするイディオム。スレッドオブジェクトを格納する変数を使わないのが特徴。「Thread.list」で生きている全てのスレッドを得ることができ、「Thread.main」でメインスレッドを得ることができる。そのため以下のようなコードになる。
Thread.list.each {|th| th.join unless th == Thread.main }
log "End."
# >> 0.00s: Start.
# >> 0.49s: Thread 2
# >> 0.58s: Thread 1
# >> 0.58s: joined
# >> 1.14s: Thread 4
# >> 1.36s: Thread 3
# >> 1.36s: End.
