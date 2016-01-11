#!/usr/local/bin/ruby -Ke
def current_time() Time.now.strftime '%H:%M:%S' end
$interrupted = false
# SIGINTのシグナルハンドラを定義する。
Signal.trap(:INT) do
  puts "シグナルハンドラへ入りました。"
# 初めてシグナルハンドラに入ったとき。
  unless $interrupted
    puts "#{current_time} 本当に終了しますか？2秒以内にCtrl + Cを押してください。"
# フラグを立て、再度Ctrl + Cが押されるのを待つ。
    $interrupted = true
    sleep 2
# 時間内にCtrl + Cが押されなかったのでフラグを降ろし、復帰する。
    $interrupted = false
    puts "シグナルハンドラから本処理へ復帰します。"
# フラグが立っているとき。
  else
    puts "シグナルハンドラ実行中にシグナルハンドラが呼ばれました。"
    puts "#{current_time} 終了します。"
    exit
  end
end
# 0〜9999の間1秒間ごとにカウントアップしていく。
10000.times {|i|  puts "#{current_time} #{i}"; sleep 1 }
