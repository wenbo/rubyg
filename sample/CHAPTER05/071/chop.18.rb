#!/usr/local/bin/ruby -Ke
# ������1�Х��Ȥ��������ʸ�����������롣
"System\n".chop                       # => "System"
# ������2�Х��Ȥ��������ʸ�����������롣
"System\n".chop.chop                  # => "Syste"
# ��������\r\n�פʤ�Фɤ��������������ξ����˲�Ū�ˡ�
"System\r\n".chop!                    # => "System"
# �Х���ñ�̤ʤΤ�2��chop���ʤ���EUC-JP�����ܸ�ʸ���ϼ������ʤ���UTF-8�ʤ��3��
"����̾".chop!.chop!                  # => "����"
# �����β��Ԥ��������
"System\n".chomp                      # => "System"
# �������Τϲ��ԤΤߤʤΤǡ����Ԥǽ����ʤ����ϲ��⤷�ʤ���
"System\n".chomp.chomp                # => "System"
# ��������\r\n�פʤ�Фɤ�����������
"System\r\n".chomp!                   # => "System"
# �����Ρ�\001\001�פ��������
"XYZP/1.1\001\001".chomp! "\001\001"  # => "XYZP/1.1"
# �����˶�ʸ�������ꤷ���顢������Ϣ³������Ԥ��������
"cgi.rb\nerb.rb\n\n\n".chomp! ""      # => "cgi.rb\nerb.rb"
# ʣ���Ԥ�ʸ������ñ�̤˽�������
multi_line = <<EOS
first
second
EOS
multi_line.each_line do |line|
  puts "WRONG: <#{line}>"       # ���Ԥ�������Ƥ��ʤ��ΤǴְ㤤
end
puts
multi_line.each_line do |line|
  puts "<#{line.chomp}>"        # ���˲�Ū�᥽�åɤ�������
end
multi_line.each_line do |line|
  line.chomp!                   # �˲�Ū�᥽�åɤǽ������˲��Ԥ������
  puts "(#{line})"
end
# >> WRONG: <first
# >> >
# >> WRONG: <second
# >> >
# >> 
# >> <first>
# >> <second>
# >> (first)
# >> (second)
