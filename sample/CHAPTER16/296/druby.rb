require 'drb'
# サーバのFrontオブジェクトの参照を得る。
remote = DRbObject.new_with_uri "druby://127.0.0.1:3459"
# => #<DRb::DRbObject:0xb7d21b00 @ref=nil, @uri="druby://127.0.0.1:3459">
# サーバ側のメソッドを呼ぶ。
remote.add(1, 3)         # => 4
remote.current_time      # => Tue Apr 28 12:26:01 +0900 2009
# 構造体ClientObjectを作成する。
ClientObject = Struct.new :a
co = ClientObject.new 8  # => #<struct ClientObject a=8>
# 構造体にメソッドを渡していないので、うまくいく。
remote.make_hash(co)     # => {:value=>#<struct ClientObject a=8>}
