# anonymous.rb
def hoge() p :hoge end
class ::Object       # Objectクラスを開くにはこうする必要がある
  def fuga() p :fuga end
end
hoge
