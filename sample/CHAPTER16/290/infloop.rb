i = 0
v = loop do
  i  # => 0, 1
# breakで無限ループから抜ける。
  break i if i >= 1
  i += 1
end
# Kernel#loopの返り値はbreakの引数などで最後に評価した値。
v    # => 1

v = catch :exit do
  loop do 
# catch/throwでネストされた無限ループから抜ける。
    loop { throw :exit, :ok }
  end
end
v    # => :ok

# a, b, a, ...と0.1秒ごとに交互に表示していくスレッド。Ruby 1.8.7以降では((:Enumerable#cycle:))が使用可能。
Thread.start do
  loop do
    %w[a b].each do |x|
      puts x
      sleep 0.1
    end
  end
end
# メインスレッドが0.39秒間止まっている間にスレッドによる表示が行われる。
sleep 0.39
# >> a
# >> b
# >> a
# >> b
