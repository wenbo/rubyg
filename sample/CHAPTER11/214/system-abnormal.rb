# ��λ���ơ�����2��ȯ�������롣������Ϸ�ͳ���ʤ���
system "ruby", "-e", "exit 2"  # => false
$?                             # => #<Process::Status: pid 5600 exit 2>
$?.exitstatus                  # => 2
# ¸�ߤ��ʤ����ޥ�ɤ�¹Ԥ��褦�Ȥ��롣������Ϸ�ͳ���ʤ���Ruby 1.8�Ǥ�false����Ruby 1.9�Ǥ�nil���֤�ޤ���
system "command-not-found"     # => nil
$?                             # => #<Process::Status: pid 5602 exit 127>
$?.exitstatus                  # => 127
# ��λ���ơ�������0�Ǥʤ���硢system�ؿ��������֤��ΤǤ�������ʬ�����Ǥ��롣��������ͳ���롣
unless system "ruby -e 'exit 23'"
  puts "Child process exited abnormally with code #{$?.exitstatus}"
end
# >> Child process exited abnormally with code 23
