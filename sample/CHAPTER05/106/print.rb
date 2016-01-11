def print_txt(name, month, day)
  puts "#{name}さん。"
  puts "今日は#{month}月#{day}日です。"
end
print_txt "るびきち", Time.now.month, Time.now.day
# >> るびきちさん。
# >> 今日は7月22日です。
