#!/usr/local/bin/ruby
# at_exit�ˤ�뽪λ������
at_exit { puts "at_exit 1" }
at_exit { puts "at_exit 2" }
# EXIT���������ʥ�ˤ�뽪λ������
Signal.trap(:EXIT) { puts "trap :EXIT 1" }
Signal.trap(:EXIT) { puts "trap :EXIT 2" } # �����ʥ�ϥ�ɥ����
# END�֥�å��ˤ�뽪λ������
END { puts "END exit 1" }
END { puts "END exit 2" }
begin
  exit
# exit�ˤ�äƽ�λ�����Ȥ���SystemExit��ȯ�������롣
rescue SystemExit
  puts "rescue SystemExit"
end
# >> rescue SystemExit
# >> trap :EXIT 2
# >> END exit 2
# >> END exit 1
# >> at_exit 2
# >> at_exit 1
