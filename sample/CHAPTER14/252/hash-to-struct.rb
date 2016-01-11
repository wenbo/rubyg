def Struct(hash)    # �ϥå��夫�鹽¤�Τ��������ؿ�
  Struct.new(*hash.keys).new(*hash.values.map{|s| Hash === s ? Struct(s) : s})
end
# {:a =>1, :b => 2}��¤�Τ��Ѵ����롣
s1 = Struct :a => 1, :b => 2  # => #<struct a=1, b=2>
# ���Τ褦�˥���������ͳ�ǥ��������Ǥ��롣
[ s1.a, s1.b ]                # => [1, 2]
# ��¸�Υ᥽�å�̾�򥭡��ˤ����饢����������񤭤��롣
s2 = Struct :object_id => 1, :class => 2, :find => 3, :map => 4
[ s2.object_id, s2.class, s2.find, s2.map ]  # => [1, 2, 3, 4]
# �ͥ��Ȥ����ϥå����Ϳ����ȡ���¤�Τ�ͥ��Ȥ��롣
nested = Struct :a => 1, :b => {:c => {:d => 4}}
# => #<struct a=1, b=#<struct c=#<struct d=4>>>
# ���Τ��ᡢ�᥽�åɥ�������ǥͥ��Ȥ�é��롣
nested.b      # => #<struct c=#<struct d=4>>
nested.b.c    # => #<struct d=4>
nested.b.c.d  # => 4
