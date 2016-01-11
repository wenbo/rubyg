ary = ["zero", "one", "two"]
hash = {:zero=>0, :one=>1, :two=>2}
# �ǽ�����Ǥ��ѹ����롣���֥������Ȥ��Τ�Τ����Ѥ�롣
ary[0] = "ZERO"
ary   # => ["ZERO", "one", "two"]
# ������:three, 3�Υڥ����ɲä��롣
hash[:three] = 3
hash  # => {:zero=>0, :one=>1, :two=>2, :three=>3}
# ���ǿ���Ķ��������ǥå�������ꤷ���������nil�ǿ�Ĺ����롣
ary[4] = "four"
ary   # => ["ZERO", "one", "two", nil, "four"]
# �᥽�åɸƤӽФ��ǤϤ����ΤΡ�ʸˡ��Ǥ�����ʸ��������뤿��¿���������ǽ��
ary[3], hash[:three] = ["three", 3]
ary   # => ["ZERO", "one", "two", "three", "four"]
hash  # => {:zero=>0, :one=>1, :two=>2, :three=>3}
# �����������ǽ��
hash[:zero] += 3
hash  # => {:zero=>3, :one=>1, :two=>2, :three=>3}

