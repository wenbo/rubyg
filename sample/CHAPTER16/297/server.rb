require 'drb'
# ServerObject��1�ĤΥ��Ф���Ĺ�¤�Τ����Ϥ���
ServerObject = Struct.new :value
# ServerObjectUndumped�ϻ����Ϥ���ServerObject��
class ServerObjectUndumped < ServerObject; include DRbUndumped   end
class Front
  def dumped()           @dumped ||= ServerObject.new            end
# ������¦�Ǥ�inspect�η�̤��֤���
  def dumped_inspect()   dumped.inspect                          end
  def undumped()         @undumped ||= ServerObjectUndumped.new  end
  def undumped_inspect() undumped.inspect                        end
end
DRb.start_service("druby://127.0.0.1:54354", Front.new)
# ���줬�ʤ��ȥ����Ф������˽�λ���Ƥ��ޤ���
gets
