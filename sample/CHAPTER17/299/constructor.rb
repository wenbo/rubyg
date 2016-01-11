class HTTPServer
# ブロックをObject#instance_evalに丸投げする。
  def initialize(&block)  instance_eval(&block)  end
# protectedにすることで外からアクセスできないようにする。
  protected
# initializeで使用するアクセサを定義する。
  attr_accessor :rootdir, :port, :http_version, :bind_address
end

s = HTTPServer.new do
# 「self.」がついているものの設定ファイルのようにも見える。
  self.rootdir      = "/var/www"
  self.port         = 8331
  self.http_version = "1.1"
  self.bind_address = "127.0.0.1"
end
# 値は確かに設定されている。
s # => #<HTTPServer:0x999277c @rootdir="/var/www", @port=8331, @http_version="1.1", @bind_address="127.0.0.1">
# protectedなので外部からはアクセスできない。
s.port rescue $! # => #<NoMethodError: protected method `port' called for #<HTTPServer:0x999277c>>
