# ��ruby -v�ץ��ޥ�ɤν��Ϸ�̤����롣�����դ���
`ruby -v`        # => "ruby 1.8.7 (2008-11-12 revision 20228) [i686-linux]\n"
# ��ˡ��%x�פ�Ȥ��롣
%x!ruby -v!      # => "ruby 1.8.7 (2008-11-12 revision 20228) [i686-linux]\n"
# ��ruby -v�ץ��ޥ�ɤν��Ϸ�̤����롣����̵����
`ruby -v`.chomp  # => "ruby 1.8.7 (2008-11-12 revision 20228) [i686-linux]"
# ɸ����Ϥ�ɸ�२�顼���Ϥ˽��Ϥ������ϡ�ɸ����ϤΤ߼��Ф���롣
`ruby -e 'puts "STDOUT"; $stderr.puts "STDERR"'`       # => "STDOUT\n"
# sh�ϤΥ������ɸ����Ϥ�ɸ�२�顼���Ϥ򺮺ߤ������Ϥ����롣
`ruby -e 'puts "STDOUT"; $stderr.puts "STDERR"' 2>&1`  # => "STDERR\nSTDOUT\n"
# sh�ϤΥ������ɸ�२�顼���ϤΤߤ����롣
`ruby -e 'puts "STDOUT"; $stderr.puts "STDERR"' 2>&1 1> /dev/null` # => "STDERR\n"
# ľ���λҥץ����ν�λ���ơ����������롣
$?.exitstatus  # => 0
