$start_time = Time.now
# �ץ����¹Գ��Ϥ���ηв���֤�string��ɽ������ؿ��������
def log(string)  printf("%.2fs: %s\n", Time.now - $start_time, string)  end
log "Start."
# 0��1�ø��ʸ�����ɽ������2�ĤΥ���åɤ�������롣
th1 = Thread.start { sleep rand; log "Thread 1" } # => #<Thread:0x9a25040 run>
th2 = Thread.start { sleep rand; log "Thread 2" } # => #<Thread:0x9a24e24 run>
# 2�ĤΥ���åɤ��Ԥ���碌�򤹤롣
[th1, th2].each {|th| th.join }
log "joined"
Thread.start { sleep rand; log "Thread 3" }
Thread.start { sleep rand; log "Thread 4" }
# �¹���Τ��٤ƤΥ���åɤ��Ԥ���碌�򤹤륤�ǥ����ࡣ����åɥ��֥������Ȥ��Ǽ�����ѿ���Ȥ�ʤ��Τ���ħ����Thread.list�פ������Ƥ������ƤΥ���åɤ����뤳�Ȥ��Ǥ�����Thread.main�פǥᥤ�󥹥�åɤ����뤳�Ȥ��Ǥ��롣���Τ���ʲ��Τ褦�ʥ����ɤˤʤ롣
Thread.list.each {|th| th.join unless th == Thread.main }
log "End."
# >> 0.00s: Start.
# >> 0.49s: Thread 2
# >> 0.58s: Thread 1
# >> 0.58s: joined
# >> 1.14s: Thread 4
# >> 1.36s: Thread 3
# >> 1.36s: End.
