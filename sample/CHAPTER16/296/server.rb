# drb�饤�֥���DRb���������Ƥ���Τ��ɤ߹���
require 'drb'
class Front
  def add(a, b)         a + b                end
  def current_time()    Time.now             end
  def make_hash(value)  { :value => value }  end
end
# Front���֥������Ȥ� druby://127.0.0.1:3459 �Ǹ������롣
DRb.start_service("druby://127.0.0.1:3459", Front.new)
# ���줬�ʤ��ȥ����Фμ¹Ԥ���λ���Ƥ��ޤ���
gets
