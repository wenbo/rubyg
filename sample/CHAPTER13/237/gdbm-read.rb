require 'gdbm'
begin
# �ǡ����١������ɤ߽Ф���
  GDBM.open("test.gdbm") do |dbm|
    dbm["foo"]  # => "bar"
  end
# ¾�Υץ������ǡ����١����򳫤��Ƥ���Ȥ��ˤ�Errno::EAGAIN�㳰��ȯ������Τ��ԤäƤ���ƻ�Ԥ��롣
rescue Errno::EAGAIN
  sleep 0.1
  retry
end
