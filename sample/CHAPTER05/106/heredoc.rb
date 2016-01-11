def print_txt(name, month, day)
  puts <<-EOT
#{name}さん。
今日は#{month}月#{day}日です。
  EOT
end
print_txt "るびきち", Time.now.month, Time.now.day # nodisp
