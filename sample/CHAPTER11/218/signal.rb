#!/usr/local/bin/ruby -Ke
def current_time() Time.now.strftime '%H:%M:%S' end
$interrupted = false
# SIGINT�Υ����ʥ�ϥ�ɥ��������롣
Signal.trap(:INT) do
  puts "�����ʥ�ϥ�ɥ������ޤ�����"
# ���ƥ����ʥ�ϥ�ɥ�����ä��Ȥ���
  unless $interrupted
    puts "#{current_time} �����˽�λ���ޤ�����2�ð����Ctrl + C�򲡤��Ƥ���������"
# �ե饰��Ω�ơ�����Ctrl + C���������Τ��Ԥġ�
    $interrupted = true
    sleep 2
# �������Ctrl + C��������ʤ��ä��Τǥե饰��ߤ����������롣
    $interrupted = false
    puts "�����ʥ�ϥ�ɥ餫���ܽ������������ޤ���"
# �ե饰��Ω�äƤ���Ȥ���
  else
    puts "�����ʥ�ϥ�ɥ�¹���˥����ʥ�ϥ�ɥ餬�ƤФ�ޤ�����"
    puts "#{current_time} ��λ���ޤ���"
    exit
  end
end
# 0��9999�δ�1�ô֤��Ȥ˥�����ȥ��åפ��Ƥ�����
10000.times {|i|  puts "#{current_time} #{i}"; sleep 1 }
