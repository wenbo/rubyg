$truncate_length = 4            # 要素数がこれより多いと省略表記される
class Array
  # 元の Array#inspect を保存する
  # もし、保存済みの場合は保存した定義を使う
  @@old ||= instance_method(:inspect) 
  undef inspect                 # 警告消し
  def inspect()
    if length > $truncate_length then # 要素数が多いときは
      # 最初の要素以外を省略し、要素数を書き出す
      "[#{self[0,1].map{|x|x.inspect}.join ', '}, ...(length=#{length})]"
    else
      # 要素数が少ないときは元の Array#inspect を呼び出す
      @@old.bind(self).call
    end
  end
end
