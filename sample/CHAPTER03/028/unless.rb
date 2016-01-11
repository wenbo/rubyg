Time.now              # => 2008-05-26 02:57:55 +0900
unless Time.now.hour < 12
  s = "good afternoon"
else
  s = "good morning"
end
s                     # => "good morning"
# 条件分岐はレシーバにもなる。現在時刻で分岐。
v2 = unless Time.now.hour < 12
       "good afternoon"
     else
       "good morning"
     end.upcase
v2                    # => "GOOD MORNING"

"NG" unless 1 < 10    # => nil
"NG" unless 20 < 10   # => "NG"
