# socketライブラリにTCPServerが定義されているので読み込む
require 'socket'
# 127.0.0.1のポート番号7430でサーバを立ち上げる。
TCPServer.open("127.0.0.1", 7430) do |server|
  loop do
# 無限ループ中に新しいスレッドを作成し、リクエストが来たときに
    Thread.start(server.accept) do |socket|
      begin
# リクエストから1行得る。そのとき、末尾の改行を取り除く。
        line = socket.gets.chomp
# レスポンスを返す。
        socket.write "Hi" if line == "Hello"
      ensure
# レスポンスを返したら、必ずソケットを閉じる。
        socket.close
      end
    end
  end
end
