require 'drb'
# ServerObjectは1つのメンバを持つ構造体で値渡し。
ServerObject = Struct.new :value
# ServerObjectUndumpedは参照渡し版ServerObject。
class ServerObjectUndumped < ServerObject; include DRbUndumped   end
class Front
  def dumped()           @dumped ||= ServerObject.new            end
# サーバ側でのinspectの結果を返す。
  def dumped_inspect()   dumped.inspect                          end
  def undumped()         @undumped ||= ServerObjectUndumped.new  end
  def undumped_inspect() undumped.inspect                        end
end
DRb.start_service("druby://127.0.0.1:54354", Front.new)
# これがないとサーバがすぐに終了してしまう。
gets
