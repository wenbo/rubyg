require 'drb'
# Frontの参照を得る。
remote = DRbObject.new_with_uri "druby://127.0.0.1:54354"
# ServerObjectが値渡しでやってきたが、クライアントはServerObjectを知らないのでDRbUnknownになる。
dumped = remote.dumped
# => #<DRb::DRbUnknown:0xb7ca61f8
#     @buf="\004\bS:\021ServerObject\006:\nvalue0",
#     @name="ServerObject">
# サーバ側でのinspectの結果が返る。
remote.dumped_inspect # => "#<struct ServerObject value=nil>"
# DRbUnknownにメソッドを送信するとエラーになる。
(dumped.value = 1) rescue $!
# => #<NoMethodError: undefined method `value=' for #<DRb::DRbUnknown:0xb7ca61f8>>
# ServerObjectUndumpedの参照を得る（参照渡し）。
undumped = remote.undumped
# => #<DRb::DRbObject:0xb7ca3408 @ref=-605614038, @uri="druby://127.0.0.1:54354">
# 参照に対してはメソッドを送信することができ、サーバ側に反映されている。
undumped.value = 2
remote.undumped_inspect # => "#<struct ServerObjectUndumped value=2>"
# クライアントしか知らないオブジェクトをサーバに送る例
ClientObject = Struct.new :a
co = ClientObject.new 8  # => #<struct ClientObject a=8>
# オブジェクトを個別に参照渡しにする場合はextendを使用する。
co.extend DRbUndumped
# クライアントからサーバへ参照渡しする場合は、これが必要。ないとエラーになる。
DRb.start_service
# dumpedへはメソッドが送信できないので、undumpedへメソッドを送信する（参照渡し）。
undumped.value = co
# 確かに参照が渡っている。
remote.undumped_inspect
# => "#<struct ServerObjectUndumped value=#<DRb::DRbObject:0xb7ca3a0c @ref=-605750488, @uri=\"druby://meg:54765\">>"
# 参照がこちらに戻ってきたので実体に戻る。
remote.undumped.value           # => #<struct ClientObject a=8>
remote.undumped.value.a         # => 8
