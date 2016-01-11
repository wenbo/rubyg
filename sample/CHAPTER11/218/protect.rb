#!/usr/local/bin/ruby -Ke
require 'thread'
$protect_from_signals_mutex = Mutex.new
def protect_from_signals
  $protect_from_signals_mutex.synchronize do
    interrupted = false
    # Signal.trap���֤��ͤ�ľ���Υ����ʥ�ϥ�ɥ�
    previous_handler = Signal.trap(:INT) { interrupted = true }
    yield           # �֥�å�ɾ����˥����ʥ뤬����줿��ե饰��Ω��
    Signal.trap(:INT, previous_handler)
    raise Interrupt, "interrupted" if interrupted # �ե饰��Ω�äƤ�����㳰��ȯ������
                                   # ��
  end
end

def current_time() Time.now.strftime '%H:%M:%S' end
begin
  protect_from_signals do
    puts "#{current_time} �����ʥ�˼��⤵��ʤ�!"
    Process.kill :INT, Process.pid # ��ʬ���Ȥ˥����ʥ������
    sleep 2             # ���δ֤˥����ʥ뤬�����Ƥ��Ƥ�֥�å���ɾ�������
  end
rescue Interrupt
  puts "#{current_time} ���������¾�Υ����ʥ�ϥ�ɥ�"
end
# >> 01:39:56 �����ʥ�˼��⤵��ʤ�!
# >> 01:39:58 ���������¾�Υ����ʥ�ϥ�ɥ�
