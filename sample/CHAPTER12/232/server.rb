# socket�饤�֥���TCPServer���������Ƥ���Τ��ɤ߹���
require 'socket'
# 127.0.0.1�Υݡ����ֹ�7430�ǥ����Ф�Ω���夲�롣
TCPServer.open("127.0.0.1", 7430) do |server|
  loop do
# ̵�¥롼����˿���������åɤ���������ꥯ�����Ȥ��褿�Ȥ���
    Thread.start(server.accept) do |socket|
      begin
# �ꥯ�����Ȥ���1�����롣���ΤȤ��������β��Ԥ��������
        line = socket.gets.chomp
# �쥹�ݥ󥹤��֤���
        socket.write "Hi" if line == "Hello"
      ensure
# �쥹�ݥ󥹤��֤����顢ɬ�������åȤ��Ĥ��롣
        socket.close
      end
    end
  end
end
