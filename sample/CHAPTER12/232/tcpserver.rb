require 'socket'
TCPSocket.open("127.0.0.1", 7430) do |sock|
# Helloと書き込んだら、Hiが返ってくる。
  sock.write "Hello\n";  sock.read  # => "Hi"
end
# もう一度リクエストし、他の文字列を書き込んだら、空文字列が返ってくる。
TCPSocket.open("127.0.0.1", 7430) do |sock|
  sock.write "AARGH\n";  sock.read  # => ""
end
