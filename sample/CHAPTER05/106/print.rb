def print_txt(name, month, day)
  puts "#{name}����"
  puts "������#{month}��#{day}���Ǥ���"
end
print_txt "��Ӥ���", Time.now.month, Time.now.day
# >> ��Ӥ�������
# >> ������7��22���Ǥ���
