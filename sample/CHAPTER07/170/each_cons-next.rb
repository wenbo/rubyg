ary = [1,2,3]
(ary+[nil]).each_cons(2) do |x,nxt|
  print "現在の要素は",x
  print "、次の要素は#{nxt}" if nxt
  print "です。\n"
end
# >> 現在の要素は1、次の要素は2です。
# >> 現在の要素は2、次の要素は3です。
# >> 現在の要素は3です。
