#!/usr/local/bin/ruby -Ke
$clients_in_checkout_stand = [] # レジの待ち行列を表現する配列
def current_queue_str           # 並んでいる人の状態を表す関数
# キューが空であるかを調べる
  if $clients_in_checkout_stand.empty?
    "並んでいる人はいません。"
  else
    "並んでいる人は#{$clients_in_checkout_stand.join 'と'}です。"
  end
end
def new_client(client)          # 待ち行列に人が来たことを宣言する関数
# キューに加えるには「Array#push」を使用する。
  $clients_in_checkout_stand.push client
  puts "#{client}が並びました。#{current_queue_str}"
end
def pay                         # 支払いを終えたことを宣言する関数
# キューから出るには「Array#shift」を使用する。
  client = $clients_in_checkout_stand.shift
  puts "#{client}が支払いを終えました。#{current_queue_str}"
end
# レジの状況をシミュレーションする。
new_client :A
new_client :B
pay
new_client :C
pay
pay
# >> Aが並びました。並んでいる人はAです。
# >> Bが並びました。並んでいる人はAとBです。
# >> Aが支払いを終えました。並んでいる人はBです。
# >> Cが並びました。並んでいる人はBとCです。
# >> Bが支払いを終えました。並んでいる人はCです。
# >> Cが支払いを終えました。並んでいる人はいません。
