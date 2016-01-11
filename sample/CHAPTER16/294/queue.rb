# thread�饤�֥���Queue���������Ƥ���Τ��ɤ߹���
require 'thread'
$start_time = Time.now
# �ץ����¹Գ��Ϥ���ηв���֤�string��ɽ������ؿ��������
def log(string)  printf("%.2fs: %s\n", Time.now - $start_time, string)  end
# ����åɤ��̿����륭�塼��������롣
q = Queue.new
# ����å�upcaser�ϥ��塼���������줿ʸ�������ʸ���ˤ���ɽ�����롣�����Фȹͤ��뤳�Ȥ��Ǥ��롣
upcaser = Thread.start do
# ���塼��nil���������줿�����ǥ���åɤμ¹Ԥ�λ���롣
  while str = q.pop
    log str.upcase
  end
end

log "Start."
# 0��1�ä��Ȥ˥��塼��ʸ������������롣���饤����Ȥȹͤ��뤳�Ȥ��Ǥ��롣
q.push "foo"; sleep rand
q.push "bar"; sleep rand
q.push "baz"
q.push "abc"
# ��λ�ޡ���nil���������ƥ���åɤμ¹Խ�λ��������롣
q.push nil
# ����å�upcaser�μ¹Խ�λ�ޤ��Ԥġ�
upcaser.join
log "End."
# >> 0.00s: Start.
# >> 0.01s: FOO
# >> 0.60s: BAR
# >> 1.56s: BAZ
# >> 1.56s: ABC
# >> 1.56s: End.
