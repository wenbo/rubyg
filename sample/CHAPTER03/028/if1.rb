# 通常の条件分岐。
if 6 % 4 == 0
  s = "6は4の倍数"
elsif 6 % 2 == 0
  s = "6は偶数"
else
  s = "6は奇数"
end
s    # => "6は偶数"
# 条件分岐式は値を持つ。
v1 = if 6 % 4 == 0
       "6は4の倍数"
     elsif 6 % 2 == 0
       "6は偶数"
     else
       "6は奇数"
     end
v1   # => "6は偶数"
# 1行で書くときはthenが必要。
if true then 1 else 2 end  # => 1
