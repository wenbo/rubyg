p [1,2,3]
o = Object.new
# ���󥹥����ѿ��򶯰������ꤹ��
o.instance_variable_set(:@a, "instance variable")
p o
# >> [1, 2, 3]
# >> #<Object:0xb7b3a904 @a="instance variable">
