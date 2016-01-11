#!/usr/local/bin/ruby -Ke
$clients_in_checkout_stand = [] # �쥸���Ԥ������ɽ����������
def current_queue_str           # �¤�Ǥ���ͤξ��֤�ɽ���ؿ�
# ���塼�����Ǥ��뤫��Ĵ�٤�
  if $clients_in_checkout_stand.empty?
    "�¤�Ǥ���ͤϤ��ޤ���"
  else
    "�¤�Ǥ���ͤ�#{$clients_in_checkout_stand.join '��'}�Ǥ���"
  end
end
def new_client(client)          # �Ԥ�����˿ͤ��褿���Ȥ��������ؿ�
# ���塼�˲ä���ˤϡ�Array#push�פ���Ѥ��롣
  $clients_in_checkout_stand.push client
  puts "#{client}���¤Ӥޤ�����#{current_queue_str}"
end
def pay                         # ��ʧ���򽪤������Ȥ��������ؿ�
# ���塼����Ф�ˤϡ�Array#shift�פ���Ѥ��롣
  client = $clients_in_checkout_stand.shift
  puts "#{client}����ʧ���򽪤��ޤ�����#{current_queue_str}"
end
# �쥸�ξ����򥷥ߥ�졼����󤹤롣
new_client :A
new_client :B
pay
new_client :C
pay
pay
# >> A���¤Ӥޤ������¤�Ǥ���ͤ�A�Ǥ���
# >> B���¤Ӥޤ������¤�Ǥ���ͤ�A��B�Ǥ���
# >> A����ʧ���򽪤��ޤ������¤�Ǥ���ͤ�B�Ǥ���
# >> C���¤Ӥޤ������¤�Ǥ���ͤ�B��C�Ǥ���
# >> B����ʧ���򽪤��ޤ������¤�Ǥ���ͤ�C�Ǥ���
# >> C����ʧ���򽪤��ޤ������¤�Ǥ���ͤϤ��ޤ���
