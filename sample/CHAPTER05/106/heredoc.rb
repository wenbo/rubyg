def print_txt(name, month, day)
  puts <<-EOT
#{name}����
������#{month}��#{day}���Ǥ���
  EOT
end
print_txt "��Ӥ���", Time.now.month, Time.now.day # nodisp
