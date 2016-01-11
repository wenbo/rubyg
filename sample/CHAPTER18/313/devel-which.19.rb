require 'forwardable'
require 'socket'
# 「$"」にロードされたライブラリのフルパスで格納されている。ライブラリのフルパスのうちcgiを含むものを抜き出す。
$".grep(/forwardable/)  # => ["/pkgs/ruby19/lib/ruby19/1.9.0/forwardable.rb"]
# 同様にsocketを含むライブラリを抜き出す。
$".grep(/socket/)       # => ["/pkgs/ruby19/lib/ruby19/1.9.0/i686-linux/socket.so"]
# 一致するライブラリがない場合は空配列になる。
$".grep(/not-exist/)    # => []
