# ��print�פ�ʸ�����ɽ�����롣���Ԥ���ʤ��Τǡ����Ԥ�������������Ū�˻��ꤹ�롣
print "This is print.\n"
# ��puts�פ�ʸ�����ɽ�����롣�Ǹ�˲��Ԥ���롣
puts "This is puts."
# ��print�פ��puts�פ�ʣ���ĤΥ��֥������Ȥ�����Ǥ��롣��puts�פϰ������Ȥ˲��Ԥ��롣
print 1,"str",/regexp/,"\n"
puts 1,"str",/regexp/
# ̵�����Ρ�puts�פ϶��Ԥ���Ϥ��롣
puts
# ��puts�פ��������ꤷ�������Ǥ��Ȥ˲��Ԥ���롣
puts [1,2],3
# �����褬ɸ����ϤǤ��뤳�Ȥ��������롣
$stdout.puts "by IO#puts"
# print���̷�����
"by display\n".display
# >> This is print.
# >> This is puts.
# >> 1str(?-mix:regexp)
# >> 1
# >> str
# >> (?-mix:regexp)
# >> 
# >> 1
# >> 2
# >> 3
# >> by IO#puts
# >> by display
