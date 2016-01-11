p [1,2,3]
o = Object.new
# インスタンス変数を強引に設定する
o.instance_variable_set(:@a, "instance variable")
p o
# >> [1, 2, 3]
# >> #<Object:0xb7b3a904 @a="instance variable">
