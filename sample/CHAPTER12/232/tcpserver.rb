require 'socket'
TCPSocket.open("127.0.0.1", 7430) do |sock|
# Hello�Ƚ񤭹�����顢Hi���֤äƤ��롣
  sock.write "Hello\n";  sock.read  # => "Hi"
end
# �⤦���٥ꥯ�����Ȥ���¾��ʸ�����񤭹�����顢��ʸ�����֤äƤ��롣
TCPSocket.open("127.0.0.1", 7430) do |sock|
  sock.write "AARGH\n";  sock.read  # => ""
end
