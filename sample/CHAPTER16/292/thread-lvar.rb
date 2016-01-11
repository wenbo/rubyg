# �ᥤ�󥹥�åɤΥ���åɥ������ѿ�a���������롣
Thread.current[:a] = "main thread"
# �����Х��ѿ����������롣
$gvar = "global"
th = Thread.start do
  $gvar = "changed!"
# ����å�th�Υ���åɥ������ѿ���̤������ʤΤ�nil�Ǥ��롣
  Thread.current[:a]    # => nil
  Thread.current[:a] = "new thread"
  Thread.current[:a]    # => "new thread"
end
# th�μ¹Խ�λ�ޤ��Ԥġ�
th.join
# �ᥤ�󥹥�åɤΥ���åɥ������ѿ����ѹ�����Ƥ��ʤ���
Thread.current[:a]      # => "main thread"
# ������ʸ�������ꤷ�Ƥ⹽��ʤ���
Thread.current["a"]     # => "main thread"
# ����å�th�Υ���åɥ������ѿ��˥����������롣
th[:a]                  # => "new thread"
# �����Х��ѿ�������å�th����ѹ�����Ƥ��ޤä���
$gvar                   # => "changed!"
Thread.current.keys     # => [:__recursive_key__, :a]
# �ᥤ�󥹥�åɤΥ���åɥ������ѿ��������롣
Thread.current[:a] = nil
Thread.current.key? :a  # => false
