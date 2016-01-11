$start_time = Time.now
# �ץ����¹Գ��Ϥ���ηв���֤�string��ɽ������ؿ��������
def log(string)  printf("%.0fs: %s\n", Time.now - $start_time, string)  end
def loop_thread(sec, str)       # ����åɤ�������������¹Ԥ���
# ��Thread.start�פ��Ϥ������ϥ֥�å��ˤ��Τޤ��Ϥ���롣�֥�å��ѥ�᡼���ϥ���åɥ�����Ǥ��뤳�Ȥ��ݾڤ���롣
  Thread.start(sec, str) do |wait_time, string|
# ����åɤ����Ƥϡ�wait_time�ä��Ȥ�string��ɽ����³���뤳�ȡ�
    loop do
      sleep wait_time
      log string
    end
  end
end
log "Start."
# 2�ä��Ȥˡ�a�פ�ɽ�����륹��åɤȡ�3�ä��Ȥˡ�b�פ�ɽ�����륹��åɤ�������롣���������¹Խ������Ϥޤ롣
loop_thread 2, "a"              # => #<Thread:0x9d347f4 run>
loop_thread 3, "b"              # => #<Thread:0x9d34600 run>
# 7�ø�ˡ�End.�פ�ɽ�����롣�ᥤ�󥹥�åɤ���λ����������¾�Υ���åɤμ¹Ԥ��Ǥ��ڤ�졢�ץ����μ¹Ԥ���λ���롣
sleep 7
log "End."
# >> 0s: Start.
# >> 2s: a
# >> 3s: b
# >> 4s: a
# >> 6s: a
# >> 6s: b
# >> 7s: End.
