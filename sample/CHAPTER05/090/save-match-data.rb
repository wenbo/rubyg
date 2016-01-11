$start = Time.now
def other_match(pre_wait, post_wait)
  sleep pre_wait
  Thread.current[:v].match(/([a-z]+)/)
  sleep post_wait
  [ Time.now-$start, $1 ]      # 経過時間と $1 を返す
end
latter = Thread.start { Thread.current[:v] = "latter"; other_match    0, 0.03 }
former = Thread.start { Thread.current[:v] = "former"; other_match 0.01, 0.01 }
former.value   # => [0.020344834, "former"]
latter.value   # => [0.030246895, "latter"]
