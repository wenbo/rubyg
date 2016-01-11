# drbライブラリにDRbが定義されているので読み込む
require 'drb'
class Front
  def add(a, b)         a + b                end
  def current_time()    Time.now             end
  def make_hash(value)  { :value => value }  end
end
# Frontオブジェクトを druby://127.0.0.1:3459 で公開する。
DRb.start_service("druby://127.0.0.1:3459", Front.new)
# これがないとサーバの実行が終了してしまう。
gets
