#!/usr/local/bin/ruby -Ke
require 'thread'
$protect_from_signals_mutex = Mutex.new
def protect_from_signals
  $protect_from_signals_mutex.synchronize do
    interrupted = false
    # Signal.trapの返り値は直前のシグナルハンドラ
    previous_handler = Signal.trap(:INT) { interrupted = true }
    yield           # ブロック評価中にシグナルが送られたらフラグが立つ
    Signal.trap(:INT, previous_handler)
    raise Interrupt, "interrupted" if interrupted # フラグが立っていれば例外を発生させ
                                   # る
  end
end

def current_time() Time.now.strftime '%H:%M:%S' end
begin
  protect_from_signals do
    puts "#{current_time} シグナルに邪魔されない!"
    Process.kill :INT, Process.pid # 自分自身にシグナルを送る
    sleep 2             # この間にシグナルが送られてきてもブロックは評価される
  end
rescue Interrupt
  puts "#{current_time} ここが事実上のシグナルハンドラ"
end
# >> 01:39:56 シグナルに邪魔されない!
# >> 01:39:58 ここが事実上のシグナルハンドラ
