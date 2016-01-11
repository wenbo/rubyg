# socketライブラリにTCPSocketが定義されているので読み込む
require 'socket'
# TCPSocketのクラス階層を得る。IOのサブクラスだと分かる。
TCPSocket.ancestors[0,4]  # => [TCPSocket, IPSocket, BasicSocket, IO]
# http://www.rubyist.net/~rubikitch/test.txt にアクセスする例
# www.rubyist.netのポート番号80にアクセスする。
TCPSocket.open "www.rubyist.net", 80 do |soc|
# socはTCPSocketオブジェクト。
  soc.class               # => TCPSocket
# HTTP/1.1のプロトコルに従ってソケットに書き込む。
  soc.write "GET /~rubikitch/test.txt HTTP/1.1\r\n"
  soc.write "Host: www.rubyist.net\r\n"
  soc.write "Connection: close\r\n\r\n"
# レスポンスを出力する。
  puts soc.read
end
# >> HTTP/1.1 200 OK
# >> Date: Sun, 16 Nov 2008 22:50:05 GMT
# >> Server: Apache/2.2.3 (Debian) DAV/2 SVN/1.4.2 mod_python/3.2.10 Python/2.4.4 PHP/4.4.4-8+etch6 mod_ruby/1.2.6 Ruby/1.8.5(2006-08-25) mod_ssl/2.2.3 OpenSSL/0.9.8c
# >> Last-Modified: Mon, 11 Aug 2008 18:07:50 GMT
# >> ETag: "2080d6a-7-8876980"
# >> Accept-Ranges: bytes
# >> Content-Length: 7
# >> Connection: close
# >> Content-Type: text/plain
# >> 
# >> Hello!
